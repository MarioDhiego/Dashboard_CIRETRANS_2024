
taxas2_ui <- function(id) {
  
  fluidPage(
    navbarPage(
      title = "TAXAS",
      tabPanel("Taxa de Motorização",
               fluidRow(
              
                 box(
                   width = 6,
                   title = textOutput(NS(id,"taxas_2")),
                   status = "primary",
                   solidHeader = TRUE,
                   collapsible = TRUE,
                   height = 50,
                   withSpinner(
                     plotlyOutput(NS(id,"taxas_habilidade2"),
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
                   title = textOutput(NS(id,"taxas3")),
                   status = "primary",
                   solidHeader = TRUE,
                   collapsible = TRUE,
                   height = 50,
                   withSpinner(
                     plotlyOutput(NS(id,"taxas_habilidade3"),
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

taxas2_Server <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    

output$taxas_habilidade2 <- renderPlotly({

  dados <- data.frame(
    Taxa_Motorização = c(
      59.3, 116.8,
      64.2, 119.6,
      70.7, 125.4,
      78.1, 134.5,
      89.9, 150.7,
      100.7, 165.1,
      113.1, 179.6,
      130.3, 214.5,
      144.4, 227.4,
      162.8, 245.6,
      179.3, 260.9,
      195.9, 275.3,
      210.3, 286.4,
      221.0, 294.8,
      229.3, 299.8,
      236.6, 302.3,
      235.0, 312.3,
      256.3, 322.6,
      267.5, 328.2),
    Ano = rep(2003:2021, each = 2),
    Cidade = rep(c("Pará", "Belém"), times = 19))
  
  dados_agrupados <- aggregate(Taxa_Motorização ~ Cidade + Ano, data = dados, mean)
  
  Fig_g2 <- ggplot(dados_agrupados, 
                   aes(x = Ano, 
                       y = Taxa_Motorização, 
                       color = Cidade, 
                       group = Cidade)) +
    geom_line()+
    geom_point(shape = 23, 
               size = 1, 
               stroke = 2)+
    labs(title = "Taxa de Motorização(Geral)",
         x = "Ano",
         y = "Taxa Motorização (1000 hab)",
         subtitle = "Fonte: Elaborado",
         caption = "Detran-PA")+
    theme_gray()+
    theme(plot.title = element_text(size = 12L, face = "bold", hjust = 0.5),
          plot.subtitle = element_text(size = 11L, face = "bold"),
          plot.caption = element_text(size = 12L, face = "bold", hjust = 0),
          axis.title.y = element_text(size = 12L, face = "bold"),
          axis.title.x = element_text(size = 12L, face = "bold"))+
    scale_x_continuous(breaks = seq(2000, 2021, by = 1))+
    theme(legend.title = element_blank(), legend.position="bottom")
  ggplotly(Fig_g2)
  
})


output$taxas_habilidade3 <- renderPlotly({
  dados <- data.frame(
    Taxa_Motorização_Moto = c(
      1.83, 1.17, 3.45,
      2.18, 1.38, 3.90,
      2.60, 1.63, 4.41,
      3.01, 2.04, 5.05,
      4.33, 2.50, 5.89,
      5.07, 3.06, 6.84,
      6.03, 3.61, 7.60,
      6.92, 4.73, 8.44,
      8.08, 5.52, 9.35,
      9.16, 6.31, 10.1,
      10.20, 7.12, 10.7,  
      11.12, 7.72, 11.4,
      11.73, 8.29, 11.9,
      12.18, 8.75, 12.3,
      12.56, 9.15, 12.6,
      12.47, 9.41, 12.9,
      13.55, 9.98, 13.4,
      14.08, 10.46, 14.1),
      Ano = rep(2003:2020, each = 3),
      Cidade = rep(c("Pará", "Belém", "Brasil"), times = 18))
      
  Fig_g3 <- ggplot(dados, 
                   aes(x = Ano, 
                       y = Taxa_Motorização_Moto, 
                       color = Cidade, 
                       group = Cidade)) +
    geom_line()+
    geom_point(shape = 23, 
               size = 1, 
               stroke = 2)+
    labs(title = "Taxa de Motorização(Motocicleta)",
         x = "Ano",
         y = "Taxa Motorização (1000 hab)",
         subtitle = "Fonte: Elaborado",
         caption = "Detran-PA")+
    theme_gray()+
    theme(plot.title = element_text(size = 12L, face = "bold", hjust = 0.5),
          plot.subtitle = element_text(size = 11L, face = "bold"),
          plot.caption = element_text(size = 12L, face = "bold", hjust = 0),
          axis.title.y = element_text(size = 12L, face = "bold"),
          axis.title.x = element_text(size = 12L, face = "bold"))+
    scale_x_continuous(breaks = seq(2000, 2021, by = 1))
  ggplotly(Fig_g3)
  
})






    
    
    ##########################################################################################
    
  })
}


#Play do Módulo
ui <- dashboardPage(header = dashboardHeader(),
                    title = "Taxas de Sinistros",
                    sidebar = dashboardSidebar(),
                    body = dashboardBody(fluidPage(taxas2_ui("taxas2"))))

server <- function(input, output) {
  taxas2_Server("taxas2")
}

shinyApp(ui, server)
