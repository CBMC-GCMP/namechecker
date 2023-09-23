#' fetch_species_data
#' The function checks scientific names status and returns several information around the names.
#'
#' @param species a vector of species names
#'
#' @return a data.frame
#' @export
#'
#' @examples
#'
#' library(httr)
#' library(jsonlite)
#' library(dplyr)
#' species_list <- c("Acetabularia parvula", "Codium decorticatum")
#' fetch_species_data(species_list)
#'
fetch_species_data <- function(species) {
     tryCatch({
          # Make API request
          response <- httr::GET(paste0("https://www.marinespecies.org/rest/AphiaRecordsByName/", utils::URLencode(species)))

          # Initialize an empty data frame
          filtered_data <- data.frame()

          # Check response status
          if(httr::http_status(response)$category == "Success") {
               # Parse JSON data
               parsed_data <- suppressMessages(jsonlite::fromJSON(httr::content(response, "text")))

               # Check if parsed_data is empty
               if(nrow(parsed_data) == 0) {
                    stop("No data found")
               }

               # Select only the first entry and desired columns
               filtered_data <- parsed_data[1, c("kingdom", "phylum", "class", "order", "family", "genus", "authority", "status", "unacceptreason", "rank", "valid_name", "valid_authority", "citation")]

               # Add species name as a new column
               filtered_data$input_name <- species

               # Rearrange columns
               filtered_data <- filtered_data %>%
                    dplyr::select(.data$input_name, .data$authority, .data$status, .data$valid_name, .data$valid_authority, .data$unacceptreason, .data$rank, tidyselect::everything())
          } else {
               stop("API call failed")
          }

          return(filtered_data)
     }, error = function(e) {
          # Create a data frame with the error message
          return(data.frame(input_name = species, authority = NA, status = "Species not found", valid_name = NA, valid_authority = NA, unacceptreason = NA, rank = NA, kingdom = NA, phylum = NA, class = NA, order = NA, family = NA, genus = NA, citation = NA))


     })
}





