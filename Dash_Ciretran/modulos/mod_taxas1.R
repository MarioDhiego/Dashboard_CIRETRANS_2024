  
taxas1_ui <- function(id) {
  
  fluidPage(
    navbarPage(
      title = "TAXAS",
      tabPanel("Taxa de Mortalidade",
               fluidRow(
                 box(
                   width = 6,
                   title = textOutput(NS(id,"taxas1a")),
                   status = "primary",
                   solidHeader = TRUE,
                   collapsible = TRUE,
                   height = 50,
                   withSpinner(
                     plotlyOutput(NS(id,"taxas1_hab1"),
                                  width = "100%"),
                     type = 8,
                     color = "blue",
                     size = 0.5
                   ),
                   footer = list(
                     column(10,
                            tags$b("Fonte: "), "DTI/DETRAN-PA")
                     #,
                     #download_ui(NS(id,"d3")) 
                   )
                 ),
                 box(
                   width = 6,
                   title = textOutput(NS(id,"taxas1b")),
                   status = "primary",
                   solidHeader = TRUE,
                   collapsible = TRUE,
                   height = 50,
                   withSpinner(
                     plotlyOutput(NS(id,"taxas2_hab2"),
                                  width = "100%"),
                     type = 8,
                     color = "blue",
                     size = 0.5
                   ),
                   footer = list(
                     column(10,
                            tags$b("Fonte: "), "DTI/DETRAN-PA")
                     #,
                     #download_ui(NS(id,"d3")) 
                   )
                 )
                 
                 
                 
               )
      )
    )
  )
  
}
##########################################################################################
#Função do modulo servidor

taxas1_Server <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    
 
output$taxas1_hab1 <- renderPlotly({
  dados <- data.frame(
    Taxa_Mortalidade = c(
          16.7, 10.3, 13.57,
          17.3, 11.7, 12.57,
          18.3, 12.8, 11.49,
          18.3, 13.1, 13.93,
          19.2, 13.0, 10.02,
          19.5, 14.0, 11.87,
          19.4, 14.4, 12.11,
          19.8, 14.5, 10.57,
          20.1, 14.9, 12.14,
          19.5, 13.7,  9.94,
          22.1, 17.5, 13.64,
          22.1, 17.5, 13.76,
          22.6, 19.4, 14.88,
          21.1, 19.4, 12.20,
          21.7, 19.4, 11.93,
          19.0, 18.9,  9.58,
          18.2, 18.7, 10.85,
          17.1, 17.2,  9.98,
          15.7, 16.3,  9.89,
          15.2, 15.7,  10.2,
          15.4, 17.8,  10.8,
          16.4, 18.3,  11.1   
          ),
    Ano = c(
      2000, 2000, 2000,
      2001, 2001, 2001,
      2002, 2002, 2002,
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
      2021, 2021, 2021),
    Cidade = c("Brasil", "Pará", "Belém",
               "Brasil", "Pará", "Belém",
               "Brasil", "Pará", "Belém",
               "Brasil", "Pará", "Belém",
               "Brasil", "Pará", "Belém",
               "Brasil", "Pará", "Belém",
               "Brasil", "Pará", "Belém",
               "Brasil", "Pará", "Belém",
               "Brasil", "Pará", "Belém",
               "Brasil", "Pará", "Belém",
               "Brasil", "Pará", "Belém",
               "Brasil", "Pará", "Belém",
               "Brasil", "Pará", "Belém",
               "Brasil", "Pará", "Belém",
               "Brasil", "Pará", "Belém",
               "Brasil", "Pará", "Belém",
               "Brasil", "Pará", "Belém",
               "Brasil", "Pará", "Belém",
               "Brasil", "Pará", "Belém",
               "Brasil", "Pará", "Belém",
               "Brasil", "Pará","Belém",
               "Brasil", "Pará", "Belém"
               ))
  
  Figura_g1 <- ggplot(dados, 
                   aes(x = Ano, 
                       y = Taxa_Mortalidade, 
                       color = Cidade, 
                       group = Cidade))+
    geom_line()+
    geom_point(shape = 23, 
               size = 1, 
               stroke = 2)+
        labs(title = "Taxa de Mortalidade(Geral)",
             x = "Ano",
             y = "Taxa de Mortalidade por (100 mil hab)",
             subtitle = "Fonte: Elaborado",
             caption = "Detran-pa")+
        theme_gray()+
        theme(plot.title = element_text(size = 12L, face = "bold", hjust = 0.5),
              plot.subtitle = element_text(size = 11L, face = "bold"),
              plot.caption = element_text(size = 12L, face = "bold", hjust = 0),
              axis.title.y = element_text(size = 12L, face = "bold"),
              axis.title.x = element_text(size = 12L, face = "bold"))+
    scale_x_continuous(breaks = seq(2000, 2021, by = 1))+
    theme(legend.title = element_blank(), legend.position="bottom")
ggplotly(Figura_g1)
})
    
    
output$taxas2_hab2 <- renderPlotly({
  dados <- data.frame(
    Taxa_Mortalidade_Moto = c(
      1.48, 1.19, 0.08,
      1.79, 1.60, 0.08,
      2.14, 1.64, 0.34, 
      2.41, 2.61, 0.25,
      2.77, 2.62, 0.50,
      3.24, 2.85, 0.49,
      3.83, 2.88, 0.84,
      4.38, 3.39, 0.52,
      4.69, 3.37, 0.96,
      4.83, 3.80, 1.09,
      5.67, 5.28, 0.49,
      5.94, 5.74, 1.77,
      6.43, 6.09, 1.26,
      5.95, 6.67, 0.97,
      6.21, 5.70, 1.07,
      5.90, 6.06, 1.71,
      5.83, 6.30, 1.41,
      5.85, 6.99, 1.89,
      5.48, 6.97, 1.60,
      5.30, 7.20, 1.95,
      5.80, 7.74, 2.12,
      5.70, 7.90, 2.60),
  Ano = rep(2000:2021, each = 3),
  Cidade = rep(c("Brasil","Pará","Belém"), times = 22))
dados_agrupados <- aggregate(Taxa_Mortalidade_Moto ~ Cidade + Ano, data = dados, mean)
  Fig_g1 <- ggplot(dados_agrupados, 
                   aes(x = Ano, 
                       y = Taxa_Mortalidade_Moto, 
                       color = Cidade, 
                       group = Cidade))+
    geom_line()+
    geom_point(shape = 23, 
               size = 1, 
               stroke = 2)+
    labs(title = "Taxa de Mortalidade(Motocicleta)",
         x = "Ano",
         y = "Taxa de Mortalidade por (100 mil hab)",
         subtitle = "Fonte: Elaborado",
         caption = "Detran-pa")+
    theme_gray()+
    theme(plot.title = element_text(size = 12L, face = "bold", hjust = 0.5),
          plot.subtitle = element_text(size = 11L, face = "bold"),
          plot.caption = element_text(size = 12L, face = "bold", hjust = 0),
          axis.title.y = element_text(size = 12L, face = "bold"),
          axis.title.x = element_text(size = 12L, face = "bold"))+
    scale_x_continuous(breaks = seq(2000, 2021, by = 1))+
    theme(legend.title = element_blank(), legend.position="bottom")
  ggplotly(Fig_g1)
})  
    


    
    
##########################################################################################
    
  })
}


#Play do Módulo
ui <- dashboardPage(header = dashboardHeader(),
                    title = "Taxas de Sinistros",
                    sidebar = dashboardSidebar(),
                    body = dashboardBody(fluidPage(taxas1_ui("taxas1"))))

server <- function(input, output) {
  taxas1_Server("taxas1")
}

shinyApp(ui, server)
