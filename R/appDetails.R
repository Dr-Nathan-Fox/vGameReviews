#' appDetails
#'
#' Returns information on any game or app on the Steam store.
#'
#' @param game_id Integer, required. The game or app id to search for.
#'
#' @return data frame of app details
#'
#' @export
#'
#' @examples
#'
#' \dontrun{
#'
#' appDetails(game_id = 50)
#'
#' appDetails(game_id = 60)
#'
#' }
#'
#'
appDetails <- function(game_id = 0){

  base_url <- paste("https://store.steampowered.com/api/appdetails?appids=",
                    paste(game_id),
                    sep = "")

  #parse api data
  jsondata <- jsonlite::fromJSON(base_url, flatten = TRUE)

  #successful pares?
  success <- jsondata[[paste(game_id)]][["success"]]

  if(success != TRUE){
    stop(paste("Original search not valid"))
  }


  #convert to data frame
  out <- data.frame(unlist(jsondata[[paste(game_id)]][["data"]]))

  #give columns sensible names
  out <- tibble::rownames_to_column(out, "data")
  colnames(out)[2] <- "response"

  return(out)

}
