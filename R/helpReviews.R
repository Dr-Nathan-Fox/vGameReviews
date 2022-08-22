#' helpReviews
#'
#' @param game_id The game id. Integer or string.
#' Can be found at: https://steamdb.info/apps/
#' @param day_range How many days to search for between 1 and 365.
#'
#' @return A data.frame containing review and reviewer information
#'
#' @export
#'
#' @examples
#' \dontrun{
#'
#' posReviews(game_id = '976730')
#'
#' }
#'
#'
helpReviews <- function(game_id = 0,
                        day_range = 365){


  #create base url with dates and search terms
  base_url <- paste("https://store.steampowered.com/appreviews/",
                    paste(game_id),
                    "?json=1",
                    "&filter=all",
                    "&day_range=",
                    paste(day_range),
                    "&cursor=*",
                    "&num_per_page=100",
                    sep = "")

  #parse api data
  jsondata <- jsonlite::fromJSON(base_url, flatten = TRUE)

  #successful pares?
  success <- paste(jsondata[["success"]])

  if(success != 1){
    stop(paste("Original search not valid"))
  }

  #any user reviews?
  any_reviews <- paste(jsondata[["query_summary"]][["review_score_desc"]])

  if(any_reviews == "No user reviews"){
    stop(paste("No user reviews"))
  }

  #output dataframe  created
  out <- jsondata[["reviews"]]

  out <- data.frame(out)

  return(out)

}
