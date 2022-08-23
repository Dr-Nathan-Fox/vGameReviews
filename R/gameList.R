#' gameList
#'
#' Returns a data.frame of all games from the Steam library with their appID.
#' See \url{http://api.steampowered.com/ISteamApps/GetAppList/v0002/?key=STEAMKEY&format=json} for more information.
#'
#' @return data.frame of all games on Steam along with their game ID
#'
#' @export
#'
#' @examples
#' \dontrun{
#'
#' gameList()
#'
#' }
#'
#'
gameList <- function() {

#create base url with dates and search terms
base_url <- paste("http://api.steampowered.com/ISteamApps/GetAppList/v0002/")

#parse api data
jsondata <- jsonlite::fromJSON(base_url, flatten = TRUE)

#turn response into data.frame
game_list <- data.frame(jsondata[["applist"]][["apps"]])

#return data.frame
return(game_list)

}
