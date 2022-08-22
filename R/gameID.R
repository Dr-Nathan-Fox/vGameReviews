#' gameID
#'
#' @param game_name String, required. Name of game.
#'
#' @return data.frame contraining possible matches.
#'
#' @export
#'
#' @examples
#'
#' \dontrun{
#'
#' gameID("Farming Simulator")
#'
#' }
#'
gameID <- function(game_name = ""){

  #get list of games and IDs
  game_list <- gameList()

  #search for given game within list and return possibilities
  #out <- game_list[game_list$name data.table::%like% paste(game_name), ]

  out <- dplyr::filter(game_list, grepl(paste(game_name), game_list$name, fixed = TRUE))

  #drop colnames
  colnames(out) <-NULL

  #return
  return(out)

}
