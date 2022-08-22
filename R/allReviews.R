#' allReviews
#'
#' @param game_id The game id. Integer or string.
#' Can be found at: https://steamdb.info/apps/
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
allReviews <- function(game_id = 0){


  #create base url with dates and search terms
  base_url <- paste("https://store.steampowered.com/appreviews/",
                    paste(game_id),
                    "?json=1",
                    "&filter=recent",
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

  #new cursor to start loop
  new_curs <- jsondata[["cursor"]]

  #url encode cursor
  new_curs <- utils::URLencode(new_curs, reserved = TRUE)

  #number of reviews from parse (should be 100 unless last page)
  num_review <- jsondata[["query_summary"]][["num_reviews"]]

  #number of total reviews for progress bar
  total_review <- paste(jsondata[["query_summary"]][["total_reviews"]])

  #begin progress bar
  pb <- progress::progress_bar$new(format = "[:bar] :current/:total (:percent)",
                         total = total_review)

  #loop through all the extra pages
  while(num_review > 0){

    #update progress bar
    pb$tick(num_review)

    #create base url with dates and search terms
    base_url <- paste("https://store.steampowered.com/appreviews/",
                      paste(game_id),
                      "?json=1",
                      "&filter=recent",
                      "&cursor=",
                      new_curs,
                      "&num_per_page=100",
                      sep = "")

    #parse api data
    jsondata <- jsonlite::fromJSON(base_url, flatten = TRUE)

    #output dataframe  created
    tmp_out <- jsondata[["reviews"]]

    #new date to start loop
    new_curs <- jsondata[["cursor"]]

    #url encode cursor
    new_curs <-  utils::URLencode(new_curs, reserved = TRUE)

    #some issue with score sometimes being int and somethimes a character
    tmp_out$weighted_vote_score <- paste(tmp_out$weighted_vote_score)

    #bind current page to output
    out <- dplyr::bind_rows(out, tmp_out)
    rm(tmp_out)

    #number of reviews from parse (should be 100 unless last page)
    num_review <- jsondata[["query_summary"]][["num_reviews"]]

    #print(new_curs)

  }

  out <- data.frame(out)

  return(out)

}
