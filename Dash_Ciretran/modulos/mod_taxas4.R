
taxas4_ui <- function(id) {
  
  fluidPage(
    navbarPage(
      title = "TAXAS",
      tabPanel("Taxa de Internação",
               fluidRow(
                 box(
                   width = 6,
                   title = textOutput(NS(id,"taxas_7")),
                   status = "primary",
                   solidHeader = TRUE,
                   collapsible = TRUE,
                   height = 50,
                   withSpinner(
                     plotlyOutput(NS(id,"taxas_habilidade7"),width = "100%"),
                     type = 8,
                     color = "blue",
                     size = 0.5
                   ),
                   footer = list(
                   column(10,
                           tags$b("Fonte: "), "Projeto Pareamento: ")
                   #,
                    # downdoload_ui(NS(id,"d3")) 
                   )
                 )
                 ,
                 box(
                    width = 6,
                   title = textOutput(NS(id,"taxas_8")),
                   status = "primary",
                    solidHeader = TRUE,
                   collapsible = TRUE,
                    height = 50,
                    withSpinner(
                     plotlyOutput(NS(id,"taxas_habilidade8"),
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

taxas4_Server <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    #output$downloadPDF <- downloadHandler(
    #  filename = function() {
    #    "Pnatrans.pdf"  # Nome do arquivo para download
    #  },
    #  content = function(file) {
    #    file.copy("C:/Users/mario.valente/Documents/GitHub_scripts/DashBoard_Detran_2023-main2/www/Perfil_belem.pdf", file)  # Substitua #pelo caminho correto
#      }
#    )



output$taxas_habilidade7 <- renderPlotly({
  dados <- data.frame(
    Taxa_Internação = c(
      0,  0, 60.7,
      0,  0, 61.5,
      0,  0, 64.1,
      0,  0, 64.6,
      0,  0, 62.6,
      0,  0, 49.7,
      0,  0, 63.8,
      0,  0, 74.7,
      0,  0, 77.8,
      0,  0, 79.9,
      0,  0, 85.0,  
      0,  0, 86.8,
      0,  0, 85.5,
      0,  0, 87.6,
      0,  0, 88.3,
      0,  0, 87.6,
      0,  0, 90.6,
      0,  0, 102.3,
      0,  0, 106.5
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
      2020, 2020, 2020,
      2021, 2021, 2021
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
               "Pará", "Belém", "Brasil",
               "Pará", "Belém", "Brasil"
    ))
  Fig_g7 <- ggplot(dados, 
                   aes(x = Ano, 
                       y = Taxa_Internação, 
                       color = Cidade, 
                       group = Cidade)) +
    geom_line()+
    geom_point(shape = 23, 
               size = 1, 
               stroke = 2)+
    labs(title = "Taxa de Internação Hospitalar",
         x = "Ano",
         y = "Taxa de Internação (10 mil hab)",
         subtitle = "Fonte: Elaborado",
         caption = "Detran-PA")+
    theme_gray()+
    theme(plot.title = element_text(size = 12L, face = "bold", hjust = 0.5),
          plot.subtitle = element_text(size = 11L, face = "bold"),
          plot.caption = element_text(size = 12L, face = "bold", hjust = 0),
          axis.title.y = element_text(size = 12L, face = "bold"),
          axis.title.x = element_text(size = 12L, face = "bold"))+
    scale_x_continuous(breaks = seq(2000, 2021, by = 1))
  ggplotly(Fig_g7)
  
})

##########################################################################################


output$taxas_habilidade8 <- renderPlotly({
  dados <- data.frame(
    Taxa_Internação_Moto = c(
      0,  0, 13.8,
      0,  0, 14.7,
      0,  0, 16.7,
      0,  0, 18.4,
      0,  0, 21.5,
      0,  0, 20.7,
      0,  0, 28.2,
      0,  0, 35.8,
      0,  0, 39.3,
      0,  0, 40.9,
      0,  0, 44.1,  
      0,  0, 47.5,
      0,  0, 49.1,
      0,  0, 51.1,
      0,  0, 50.5,
      0,  0, 50.7,
      0,  0, 54.9,
      0,  0, 54.9,
      0,  0, 60.9
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
      2020, 2020, 2020,
      2021, 2021, 2021
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
               "Pará", "Belém", "Brasil",
               "Pará", "Belém", "Brasil"
    ))
  Fig_g8 <- ggplot(dados, 
                   aes(x = Ano, 
                       y = Taxa_Internação_Moto, 
                       color = Cidade, 
                       group = Cidade)) +
    geom_line()+
    geom_point(shape = 23, 
               size = 1, 
               stroke = 2)+
    labs(title = "Taxa de Internação(Motocicleta)",
         x = "Ano",
         y = "Taxa de Internação (10 mil hab)",
         subtitle = "Fonte: Elaborado",
         caption = "Detran-PA")+
    theme_gray()+
    theme(plot.title = element_text(size = 12L, face = "bold", hjust = 0.5),
          plot.subtitle = element_text(size = 11L, face = "bold"),
          plot.caption = element_text(size = 12L, face = "bold", hjust = 0),
          axis.title.y = element_text(size = 12L, face = "bold"),
          axis.title.x = element_text(size = 12L, face = "bold"))+
    scale_x_continuous(breaks = seq(2000, 2021, by = 1))
  ggplotly(Fig_g8)
  
})









##########################################################################################
    
  })
}


#Play do Módulo
ui <- dashboardPage(header = dashboardHeader(),
                    title = "Taxas de Sinistros",
                    sidebar = dashboardSidebar(),
                    body = dashboardBody(fluidPage(taxas4_ui("taxas4"))))

server <- function(input, output) {
  taxas4_Server("taxas4")
}

shinyApp(ui, server)
