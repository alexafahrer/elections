# Load packages ----------------------------------------------------------------

library(shiny)
library(tidyverse)
library(usmap)

# Load data --------------------------------------------------------------------

presidents <- read_csv("~/R/project-2-team_ella/app/data/1976-2020-president.csv", show_col_types = FALSE)

# Find all years ---------------------------------------------------------------

year_choices <- presidents |>
  distinct(year) |>
  arrange(year) |>
  pull(year)

# Define UI --------------------------------------------------------------------

ui <- fluidPage(
  titlePanel(title = "US Presidential Election Data"),
  sidebarLayout(
    
    # Sidebar panel
    sidebarPanel(
      checkboxGroupInput(
        inputId = "year",
        label = "Select up to 8 industies:",
        choices = year_choices
      ),
      
      # sliderInput(
        # inputId = "ylim",
        # label = "Pick a US presidential election year between 1976 and 2020",
        # min = "1976",
        # value = c("1976", "2020"),
        # step = 4,
        # max = "2020",
        # width = "100%"
        # "years", 
        # label = "Pick a US presidential election year between 1976 and 2020",
        # min(presidents$year), max(presidents$year),
        # value = c(1976, 2020), 
        # step = 4, 
        # sep = ""
        # )
      ),
    
    # Main panel
    mainPanel(
      hr(),
      "Showing only results for those with salaries in USD who have provided information on their industry and highest level of education completed.",
      br(), br(),
      textOutput(outputId = "selected_year"),
      hr(),
      br(),
      tabsetPanel(
        type = "tabs",
        tabPanel("Map", plotOutput(outputId = "us_election_map")),
        tabPanel("Data", DT::dataTableOutput(outputId = "data"))
      )
    )
    
  )
)

# Define server function -------------------------------------------------------

server <- function(input, output, session) {
  
  # Print selected year
  output$selected_year <- reactive({
    paste("You've selected the year ", input$year, ".")
  })
  
  # Filter data for selected year
  presidents_filtered <- reactive({
    presidents |>
      filter(year %in% input$year) |>
      group_by(state) |>
      filter(candidatevotes == max(candidatevotes)) |>
      ungroup() |>
      select(state_fips, party_simplified) |>
      rename(fips = state_fips, values = party_simplified)
  })
  
  # Make a table of filtered data
  output$data <- DT::renderDataTable({
    presidents_filtered()
  })

  
  # Plot of average salaries from filtered data
  output$us_election_map <- renderPlot({

    plot_usmap("states", data = presidents_filtered()) +
      scale_fill_manual(values = c("blue", "red", "green"))  +
      labs(    
        fill = "Political Party"
      ) +
      theme(
        legend.position = "right"
      )
  })
}

# Create the Shiny app object --------------------------------------------------

shinyApp(ui = ui, server = server)
    