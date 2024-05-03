
taxas3_ui <- function(id) {
  
  fluidPage(
    navbarPage(
      title = "TAXAS",
      tabPanel("Taxa de Crescimento/Frota",
               fluidRow(
              
                 box(
                   width = 6,
                   title = textOutput(NS(id,"taxas_5")),
                   status = "primary",
                   solidHeader = TRUE,
                   collapsible = TRUE,
                   height = 50,
                   withSpinner(
                     plotlyOutput(NS(id,"taxas_habilidade5"),
                                  width = "100%"),
                     type = 8,
                     color = "blue",
                     size = 0.5
                   ),
                   footer = list(
                     column(10,
                            tags$b("Fonte: "), "Projeto Pareamento: ")
                     #,
                     #downdoload_ui(NS(id,"d3")) 
                   )
                 ),
                 box(
                   width = 6,
                   title = textOutput(NS(id,"taxas_6")),
                   status = "primary",
                   solidHeader = TRUE,
                   collapsible = TRUE,
                   height = 50,
                   withSpinner(
                     plotlyOutput(NS(id,"taxas_habilidade6"),
                                  width = "100%"),
                     type = 8,
                     color = "blue",
                     size = 0.5
                   ),
                   footer = list(
                     column(10,
                            tags$b("Fonte: "), "Projeto Pareamento: ")
                     #,
                     #downdoload_ui(NS(id,"d3")) 
                   )
                 )

               )
      )
    )
  )
  
}
##########################################################################################
#Função do modulo servidor

taxas3_Server <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    



output$taxas_habilidade5 <- renderPlotly({
  dados <- data.frame(
    Taxa_Crescimento_Frota = c(
      12.71,  5.75, 0,
      12.05,  6.26, 0,
      12.74,  8.98, 0,
      14.41, 12.00, 0,
      16.03,  9.29, 0,
      14.38,  9.81, 0,
      15.00, 12.30, 0,
      14.46,  9.93, 0,
      14.26,  8.66, 0,
      12.89,  7.41, 0,
      10.86,  6.04, 0,  
       8.71,  4.51, 0,
       5.89,  3.39, 0,
       4.95,  2.15, 0,
       5.00,  3.15, 0,
       0.35,  3.78, 0,
      10.20,  3.59, 0,
       5.40,  2.37, 0
    ),
    Ano = c(
      2003, 2003, 2003,
      2004, 2004, 2004,
      2005, 2005, 2005,
      2006, 2006, 2006,
      2007, 2007, 2007,
      2008, 2008, 2008,
      2009, 2009, 2009,
      2010, 2010, 2010,
      2011, 2011, 2011,
      2012, 2012, 2012, 
      2013, 2013, 2013,
      2014, 2014, 2014, 
      2015, 2015, 2015,
      2016, 2016, 2016,
      2017, 2017, 2017,
      2018, 2018, 2018,
      2019, 2019, 2019,
      2020, 2020, 2020
    ),
    Cidade = c("Pará", "Belém", "Brasil",
               "Pará", "Belém", "Brasil",
               "Pará", "Belém", "Brasil",
               "Pará", "Belém", "Brasil",
               "Pará", "Belém", "Brasil",
               "Pará", "Belém", "Brasil",
               "Pará", "Belém", "Brasil",
               "Pará", "Belém", "Brasil",
               "Pará", "Belém", "Brasil",
               "Pará", "Belém", "Brasil",
               "Pará", "Belém", "Brasil",
               "Pará", "Belém", "Brasil",
               "Pará", "Belém", "Brasil",
               "Pará", "Belém", "Brasil",
               "Pará", "Belém", "Brasil",
               "Pará", "Belém", "Brasil",
               "Pará", "Belém", "Brasil",
               "Pará", "Belém", "Brasil"
    ))
  Fig_g5 <- ggplot(dados, 
                   aes(x = Ano, 
                       y = Taxa_Crescimento_Frota, 
                       color = Cidade, 
                       group = Cidade)) +
    geom_line()+
    geom_point(shape = 23, 
               size = 1, 
               stroke = 2)+
    labs(title = "Taxa de Crescimento(Geral)",
         x = "Ano",
         y = "Taxa por 100 veiculos",
         subtitle = "Fonte: Elaborado",
         caption = "Detran-PA")+
    theme_gray()+
    theme(plot.title = element_text(size = 12L, face = "bold", hjust = 0.5),
          plot.subtitle = element_text(size = 11L, face = "bold"),
          plot.caption = element_text(size = 12L, face = "bold", hjust = 0),
          axis.title.y = element_text(size = 12L, face = "bold"),
          axis.title.x = element_text(size = 12L, face = "bold"))+
    scale_x_continuous(breaks = c(2000, 2001, 2002, 2003, 2004, 2005,
                                  2006, 2007, 2008, 2009, 2010, 2011,
                                  2012, 2013, 2014, 2015, 2016, 2017,
                                  2018, 2019, 2020, 2021))
  ggplotly(Fig_g5)
  
})



output$taxas_habilidade6 <- renderPlotly({
  dados <- data.frame(
    Taxa_Crescimento_Frota_Moto = c(
      24.38,  21.04, 0,
      21.15,  19.87, 0,
      18.32,  27.22, 0,
      20.44,  21.11, 0,
      22.98,  23.58, 0,
      19.23,  19.18, 0,
      18.61,  23.13, 0,
      18.63,  21.16, 0,
      18.37,  15.04, 0,
      16.34,  14.12, 0,
      12.83,  8.86, 0,  
      10.37,  7.96, 0,
      6.78,   5.94, 0,
      4.63,   5.00, 0,
      4.87,   5.22, 0,
      0.32,   6.64, 0,
      9.81,   5.26, 0,
      4.95,   4.81, 0
    ),
    Ano = c(
      2003, 2003, 2003,
      2004, 2004, 2004,
      2005, 2005, 2005,
      2006, 2006, 2006,
      2007, 2007, 2007,
      2008, 2008, 2008,
      2009, 2009, 2009,
      2010, 2010, 2010,
      2011, 2011, 2011,
      2012, 2012, 2012, 
      2013, 2013, 2013,
      2014, 2014, 2014, 
      2015, 2015, 2015,
      2016, 2016, 2016,
      2017, 2017, 2017,
      2018, 2018, 2018,
      2019, 2019, 2019,
      2020, 2020, 2020
    ),
    Cidade = c("Pará", "Belém", "Brasil",
               "Pará", "Belém", "Brasil",
               "Pará", "Belém", "Brasil",
               "Pará", "Belém", "Brasil",
               "Pará", "Belém", "Brasil",
               "Pará", "Belém", "Brasil",
               "Pará", "Belém", "Brasil",
               "Pará", "Belém", "Brasil",
               "Pará", "Belém", "Brasil",
               "Pará", "Belém", "Brasil",
               "Pará", "Belém", "Brasil",
               "Pará", "Belém", "Brasil",
               "Pará", "Belém", "Brasil",
               "Pará", "Belém", "Brasil",
               "Pará", "Belém", "Brasil",
               "Pará", "Belém", "Brasil",
               "Pará", "Belém", "Brasil",
               "Pará", "Belém", "Brasil"
    ))
  Fig_g6 <- ggplot(dados, 
                   aes(x = Ano, 
                       y = Taxa_Crescimento_Frota_Moto, 
                       color = Cidade, 
                       group = Cidade)) +
    geom_line()+
    geom_point(shape = 23, 
               size = 1, 
               stroke = 2)+
    labs(title = "Taxa de Crescimento(Motocicleta)",
         x = "Ano",
         y = "Taxa por 100 veiculos",
         subtitle = "Fonte: Elaborado",
         caption = "Detran-PA")+
    theme_gray()+
    theme(plot.title = element_text(size = 12L, face = "bold", hjust = 0.5),
          plot.subtitle = element_text(size = 11L, face = "bold"),
          plot.caption = element_text(size = 12L, face = "bold", hjust = 0),
          axis.title.y = element_text(size = 12L, face = "bold"),
          axis.title.x = element_text(size = 12L, face = "bold"))+
    scale_x_continuous(breaks = c(2000, 2001, 2002, 2003, 2004, 2005,
                                  2006, 2007, 2008, 2009, 2010, 2011,
                                  2012, 2013, 2014, 2015, 2016, 2017,
                                  2018, 2019, 2020, 2021))
  ggplotly(Fig_g6)
  
})


    
    
    ##########################################################################################
    
  })
}


#Play do Módulo
ui <- dashboardPage(header = dashboardHeader(),
                    title = "Taxas de Sinistros",
                    sidebar = dashboardSidebar(),
                    body = dashboardBody(fluidPage(taxas3_ui("taxas3"))))

server <- function(input, output) {
  taxas3_Server("taxas3")
}

shinyApp(ui, server)
