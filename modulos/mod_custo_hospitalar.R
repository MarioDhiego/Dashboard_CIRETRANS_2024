#MÓDULO CUSTO HOSPITALAR

custo_hospitalar_ui <- function(id) {
  fluidPage(
    
    #tags$head(
    #  tags$link(rel = "stylesheet", type = "text/css", href = "estilo.css")
    #),
    #panel(
      ##1.1 Controle                                                                  ----
    #  tags$div(
    #   style = "position:relative; 
    #    float:left; margin-right:10px; width: 9%;",
    #    ##1.2 Selecionar                                                                ----
    #    pickerInput(
    #      inputId = NS(id, "ano"),
    #      label = "ANO",
    #      choices = sort(unique(Sinistros_Rodovias$Ano), decreasing = TRUE),
    #      width = "100px"
    #    )
    #  ),
    #  tags$div(
    #    style = "position:relative; 
    #    float:left; margin-right:30px; width: 9%;",
    #    ##1.3 Select Município                                                           ----
    #    pickerInput(
    #      inputId = NS(id,"muni"),
    #      label = "MUNICÍPIO",
    #      choices = Sinistros_Rodovias$Municípios %>% unique(),
    #      width = "200px"
    #    )
    #  )
   #  ),
    
    navbarPage(
      title = "MICRODADOS RODOVIAS",
      tabPanel("BASE DE DADOS",
        fluidRow(
          box(
            width = 12,
            title = textOutput(NS(id,"rodovia1")),
            status = "primary",
            solidHeader = TRUE,
            collapsible = TRUE,
            height = 35,
            withSpinner(
              dataTableOutput(NS(id,"tabi1")),
              type = 8,
              color = "blue",
              size = 0.5
            ),
            footer = list(
              column(10,
                     tags$b("Fonte: "), "Projeto Pareamento: SISP-PC/PRE/PRF/IML/CBM/SAMU/AIH")
              #,
              #downdoload_ui(NS(id,"d3")) 
            )
            
          )
          
        )
      ),
      
      tabPanel("GRAFICOS",
        fluidRow(
          box(
            width = 6,
            title = "Rodovias/PA",
            status = "primary",
            solidHeader = TRUE,
            collapsible = TRUE,
            height = 50,
            div(class = "elemente",
                plotlyOutput(NS(id,"fonte11"),
                             width = "100%")
            )
          ),
          box(
            width = 6,
            title = "Sinistros",
            status = "primary",
            solidHeader = TRUE,
            collapsible = TRUE,
            height = 50,
            div(class = "elemente",
                plotlyOutput(NS(id,"fonte12"),
                             width = "100%")
            )
            
          ),
          
          box(
            width = 6,
            title = "Causas",
            status = "primary",
            solidHeader = TRUE,
            collapsible = TRUE,
            height = 50,
            div(class = "elemente",
                plotlyOutput(NS(id,"fonte13"),
                             width = "100%")
            )
            
          ),
          box(
            width = 6,
            title = "Turnos",
            status = "primary",
            solidHeader = TRUE,
            collapsible = TRUE,
            height = 50,
            div(class = "elemente",
                plotlyOutput(NS(id,"fonte14"),
                             width = "100%")
            )
            
          ),
          box(
            width = 6,
            title = "Meses",
            status = "primary",
            solidHeader = TRUE,
            collapsible = TRUE,
            height = 50,
            div(class = "elemente",
                plotlyOutput(NS(id,"fonte15"),
                             width = "100%")
            )
          ),
          box(
            width = 6,
            title = "Anos",
            status = "primary",
            solidHeader = TRUE,
            collapsible = TRUE,
            height = 50,
            div(class = "elemente",
                plotlyOutput(NS(id,"fonte16"),
                             width = "100%")
            )
          )
        )
      )
    )
  )
}
##########################################################################################
#Função do modulo servidor
custo_hospitalar_Server <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    

##########################################################################################
output$tabi1 <- DT::renderDataTable({
setwd("C:/Users/mario.valente/Documents/Dashboard_Modulo_Sinistro_2024-main/data")
  Sinistros_Rodovias <- read_excel("Sinistros_Rodovias.xls")
  datatable(Sinistros_Rodovias,
                filter = "top", 
                #filter = "bottom",
                plugins='natural',
                extensions='Buttons',
                options=list(dom='Blfrtip',buttons=c('copy','csv','excel','pdf','print'),
                             engthMenu=list(c(7,50,500,2500,-1)), c(5,50,1000,2500,"All"),
                             pageLength=7, 
                             autoWidth=TRUE,
                             scrollX=TRUE),
                rownames=FALSE,
                class='cell-border compact stripe hover row-border order-column dt-body-right',
                editable='cell',
                colnames=c('Ano','Data','Mês','Hora','Período','Rodovias','Km','Municípios','Tipos_Sinistros','Feridos', 'Mortos', 'Causas'),
                caption='Tabela 1. Base de Dados sobre Vítimas Fatais por Sinistros de Trânsito em Rodovias Estaduais.')
    })

##########################################################################################

##### Teste 1 ######
output$fonte11 <- renderPlotly({
  setwd("C:/Users/mario.valente/Documents/Dashboard_Modulo_Sinistro_2024-main/data")
  Sinistros_Rodovias <- read_excel("Sinistros_Rodovias.xls")
  
  Sinistros_Rodovias$Rodovias=factor(Sinistros_Rodovias$Rodovias,
                                   levels = names(sort(table(Sinistros_Rodovias$Rodovias),
                                                       decreasing = FALSE)))  
g10 <- Sinistros_Rodovias %>%
  filter(!(Rodovias %in% c("PA-152", "PA-158", "PA-395", "PA-403", "PA-411", "PA-415", 
  "PA-424", "PA-449", "PA-463", "PA-127", "PA-153", "PA-214", "PA-230", "PA-251","PA-253", 
  "PA-268", "PA-457", "PA-257", "PA-318", "PA-404", "PA-475", "PA-155"))) %>%
  ggplot()+
  aes(x = Rodovias) +
  geom_bar(fill = "blue")+
  coord_flip()+
  theme_bw()+
  theme(plot.title = element_text(size = 12L,
                                  face = "bold"),
        plot.subtitle = element_text(face = "bold"),
        plot.caption = element_text(size = 10L,
                                    face = "bold",
                                    hjust = 0),
        axis.title.y = element_text(size = 12L,
                                    face = "bold"),
        axis.title.x = element_text(size = 12L,
                                    face = "bold"))
ggplotly(g10)

})
############################################################################################# 
  


#############################################################################################
output$fonte12 <- renderPlotly({
  setwd("C:/Users/mario.valente/Documents/Dashboard_Modulo_Sinistro_2024-main/data")
  Sinistros_Rodovias <- read_excel("Sinistros_Rodovias.xls")
  
  Sinistros_Rodovias$Tipos_Sinistros=factor(Sinistros_Rodovias$Tipos_Sinistros,
                                     levels = names(sort(table(Sinistros_Rodovias$Tipos_Sinistros),
                                                         decreasing = FALSE)))  
  g11 <- Sinistros_Rodovias %>%
    ggplot()+
    aes(x = Tipos_Sinistros) +
    geom_bar(fill = "blue")+
    coord_flip()+
    theme_bw()+
    theme(plot.title = element_text(size = 12L,
                                    face = "bold"),
          plot.subtitle = element_text(face = "bold"),
          plot.caption = element_text(size = 10L,
                                      face = "bold",
                                      hjust = 0),
          axis.title.y = element_text(size = 12L,
                                      face = "bold"),
          axis.title.x = element_text(size = 12L,
                                      face = "bold"))
  ggplotly(g11)
  
})
#############################################################################################


#############################################################################################
output$fonte13 <- renderPlotly({
  setwd("C:/Users/mario.valente/Documents/Dashboard_Modulo_Sinistro_2024-main/data")
  Sinistros_Rodovias <- read_excel("Sinistros_Rodovias.xls")
  
  Sinistros_Rodovias$Causas=factor(Sinistros_Rodovias$Causas,
                                            levels = names(sort(table(Sinistros_Rodovias$Causas),
                                                                decreasing = FALSE)))  
  g13 <- Sinistros_Rodovias %>%
    filter(!(Causas %in% c("NMDRS", "NÃO INFORMADO", "PEDESTRE BRINCAVA NA VIA/DESVIAR DE PEDESTRE NA VIA", 
                           "ATRAVESSAR A PISTA SEM ATENÇÃO", "AVANÇO DE SINAL"))) %>%
    ggplot()+
    aes(x = Causas) +
    geom_bar(fill = "blue")+
    coord_flip()+
    theme_bw()+
    theme(plot.title = element_text(size = 12L,
                                    face = "bold"),
          plot.subtitle = element_text(face = "bold"),
          plot.caption = element_text(size = 10L,
                                      face = "bold",
                                      hjust = 0),
          axis.title.y = element_text(size = 12L,
                                      face = "bold"),
          axis.title.x = element_text(size = 12L,
                                      face = "bold"))
  ggplotly(g13)
  
})


#############################################################################################

output$fonte14 <- renderPlotly({
  setwd("C:/Users/mario.valente/Documents/Dashboard_Modulo_Sinistro_2024-main/data")
  Sinistros_Rodovias <- read_excel("Sinistros_Rodovias.xls")
  
  Sinistros_Rodovias$Período = factor(Sinistros_Rodovias$Período,
                                   levels = names(sort(table(Sinistros_Rodovias$Período),
                                                       decreasing = FALSE)))  
  g14 <- Sinistros_Rodovias %>%
    ggplot()+
    aes(x = Período) +
    geom_bar(fill = "blue")+
    coord_flip()+
    theme_bw()+
    theme(plot.title = element_text(size = 12L,
                                    face = "bold"),
          plot.subtitle = element_text(face = "bold"),
          plot.caption = element_text(size = 10L,
                                      face = "bold",
                                      hjust = 0),
          axis.title.y = element_text(size = 12L,
                                      face = "bold"),
          axis.title.x = element_text(size = 12L,
                                      face = "bold"))
  ggplotly(g14)
  
})
############################################################################################


output$fonte15 <- renderPlotly({
  setwd("C:/Users/mario.valente/Documents/Dashboard_Modulo_Sinistro_2024-main/data")
  Sinistros_Rodovias <- read_excel("Sinistros_Rodovias.xls")
  
  Sinistros_Rodovias$Mês = factor(Sinistros_Rodovias$Mês,
                                      levels = names(sort(table(Sinistros_Rodovias$Mês),
                                                          decreasing = FALSE)))  
  g15 <- Sinistros_Rodovias %>%
    ggplot()+
    aes(x = Mês) +
    geom_bar(fill = "blue")+
    coord_flip()+
    theme_bw()+
    theme(plot.title = element_text(size = 12L,
                                    face = "bold"),
          plot.subtitle = element_text(face = "bold"),
          plot.caption = element_text(size = 10L,
                                      face = "bold",
                                      hjust = 0),
          axis.title.y = element_text(size = 12L,
                                      face = "bold"),
          axis.title.x = element_text(size = 12L,
                                      face = "bold"))
  ggplotly(g15)
  
})
##########################################################################################


output$fonte16 <- renderPlotly({
  setwd("C:/Users/mario.valente/Documents/Dashboard_Modulo_Sinistro_2024-main/data")
  Sinistros_Rodovias <- read_excel("Sinistros_Rodovias.xls")
  
  Sinistros_Rodovias$Ano = factor(Sinistros_Rodovias$Ano,
                                  levels = names(sort(table(Sinistros_Rodovias$Ano),
                                                      decreasing = FALSE)))  
  g16 <- Sinistros_Rodovias %>%
    ggplot()+
    aes(x = Ano) +
    geom_bar(fill = "blue")+
    coord_flip()+
    theme_bw()+
    theme(plot.title = element_text(size = 12L,
                                    face = "bold"),
          plot.subtitle = element_text(face = "bold"),
          plot.caption = element_text(size = 10L,
                                      face = "bold",
                                      hjust = 0),
          axis.title.y = element_text(size = 12L,
                                      face = "bold"),
          axis.title.x = element_text(size = 12L,
                                      face = "bold"))
  ggplotly(g16)
  
})

























##########################################################################################

  })
}


#Play do Módulo
ui <- dashboardPage(header = dashboardHeader(),
                    title = "Sinistros em Rodovias Estaduais",
                    sidebar = dashboardSidebar(),
                    body = dashboardBody(fluidPage(custo_hospitalar_ui("custo_hospitalar"))))

server <- function(input, output) {
  custo_hospitalar_Server("custo_hospitalar")
}

shinyApp(ui, server)
