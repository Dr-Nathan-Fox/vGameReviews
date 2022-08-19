gameID <- function(game_name = ""){

  #get list of games and IDs
  game_list <- gameList()

  #search for given game within list and return possibilities
  out <- game_list[game_list$name %like% paste(game_name), ]

  #drop colnames
  colnames(out)<-NULL

  #return
  return(out)

}
