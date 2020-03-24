library(shiny)
library(semantic.dashboard)
library(leaflet)
library(DT)

ui <- dashboardPage(
  dashboardHeader(color = "blue", title = "Dashboard Demo", inverted = TRUE),
  dashboardSidebar(
    size = "thin", color = "teal",
    sidebarMenu(
      menuItem(tabName = "main", "Main"),
      menuItem(tabName = "extra", "Extra")
    )
  ),
  dashboardBody(
    tabItems(
      selected = 1,
      tabItem(
        tabName = "main",
        fluidRow(
         # h1("main")
          box(width = 16,
              #title = "table",
              color = "green", ribbon = TRUE, title_side = "top right",
              column(8,
                     DT::dataTableOutput('master')
                     #DT::dataTableOutput('child'),
                     #plotOutput("boxplot1")
              )
          )
          ),
        fluidRow(
          box(width = 16,
              #title = "Map",
              color = "red", ribbon = TRUE, title_side = "top right",
              leafletOutput("mymap")
          )
        )
      ),
      tabItem(
        tabName = "extra",
        fluidRow(
          #h1("extra")
          DT::dataTableOutput('child')
        )
      )
    )
  )
)
