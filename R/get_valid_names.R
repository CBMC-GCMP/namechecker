
#' A wrapper of fetch species data
#' It is a convenient wrapper to map through a vector of names and give progress.
#'
#' @param species_list a vector of species names
#'
#' @return a data.frame
#' @export
#'
#' @examples
#'
#' species_list <- c("Acetabularia parvula", "Codium decorticatum")
#' get_valid_names(species_list)
#'
get_valid_names <- function(species_list) {
     purrr::map_dfr(species_list, fetch_species_data, .progress = T)
}
