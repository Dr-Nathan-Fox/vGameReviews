shinyReviews <- function(){

  library(shiny)
  library(dqshiny)
  library(dplyr)

  # load all game titles
  all_games <- gameList()
  all_games <- subset(all_games, name > 0)
  opts <- paste(all_games$name)

  ui <- fluidPage(

    titlePanel("Search for and save reviews of games hosted on the steam library."),

    fontawesome::fa_html_dependency(),

    tags$style("input{font-family:'Font Awesome\ 5 Free';font-weight: 900;}"),

    fluidRow(

      br(),

      column(6,
             autocomplete_input("auto1", "Search for a game:", opts,
                                placeholder = " Search Value",
                                max_options = 100,
                                value = "Zoo World VR")),
      column(6,
             tags$label("Steam library game ID:"),
             verbatimTextOutput("val1", placeholder = TRUE))

    ),

    fluidRow(

      column(12,

             br(),

             tags$label("Review table will update automatically; popular games may take a while."))
    ),


    downloadButton('download',"Download the data"),

    fluidRow(

      br(),

      column(12,
             tableOutput("gameReviews"))

    )

  )

  server <-  function(input, output) {

    #get list of games
    all_games <- gameList()
    all_games <- subset(all_games, name > 0)

    #find the id of the current search
    game_id <- reactive({

      paste(
        subset(all_games, name == input$auto1) %>%
          select(appid) %>%
          unique()
      )

    })

    #create data.frame of current search
    dat <- reactive({

      dat <- paste(
        subset(all_games, name == input$auto1) %>%
          select(appid) %>%
          unique()
      )

      dat <- allReviews(dat)

      dat

    })

    #output value of id back to ui
    output$val1 <- game_id

    #output data.frame of reviews back to ui
    output$gameReviews <- renderTable({

      dat()

    })

    #data.frame to download button
    output$download <- downloadHandler(
      filename = function(){"steam_review.csv"},
      content = function(fname){
        write.csv(dat(), fname)
      }
    )


  }

  shinyApp(ui, server)

}
