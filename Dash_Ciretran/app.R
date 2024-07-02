###################################################################################################
#             DETRAN-PA - Departamento de Trânsito do Estado do Pará                              #
###################################################################################################
#####   DESCRIÇÃO:        Dashboard de Sinistros de Trânsito - Pará                               #
#####   ESCRITO POR:      Mário Diego Valente                                                     #
#####                     Tito Félix de Oliveira                                                  #
#####                     Kleber Bezerra Salim                                                    #
#####   SITE:             https://www.detran.pa.gov.br/                                           #
#####   LICENÇA:          MIT                                                                     #
#####   PROJETO:          https://github.com/MarioDhiego/DashBoard_Detran_2023                    #
###################################################################################################


###################################################################################################
# Interface
# Carregar o Arquivo Geral

library(shiny)
library(shinydashboard)
library(shinydashboardPlus)
library(shinyWidgets)
library(tidyverse)
library(leaflet)
library(htmltools)
library(htmlwidgets)

###################################################################################################

shinyApp(
  ui = dashboardPage(
    header = dashboardHeader(
      title = span(tags$b("CIRETRAN'S"),
                   titleWidth = 250),
      tags$li(
        class = "dropdown",
        a(
          href = "https://www.facebook.com/detranPARA",
          class = "fa fa-facebook",
          target = "_blank"
        )
      ),
      tags$li(
        class = "dropdown",
        a(
          href = "https://www.instagram.com/detranpa_",
          class = "fa fa-instagram",
          target = "_blank"
        )
      ),
      tags$li(
        class = "dropdown",
        a(
          href = "https://twitter.com/DETRAN_PA",
          class = "fa fa-twitter",
          target = "_blank"
        )
      ),
      tags$li(
        class = "dropdown",
        tags$a(href = "https://github.com/MarioDhiego",
               icon("github"), "Suporte", target = "_blank")
      )
    ),
    skin = "blue",
    scrollToTop = TRUE,
    options = list(sidebarExpandOnHover = TRUE),
    sidebar = dashboardSidebar(minified = FALSE,collapsed = FALSE,
      tags$img(src = "detran1.jpeg",width = 230,heigth = 100),
      sidebarMenu(id = "tabs",
        menuItem("CIRETRANS",tabName = "ciretrans",icon = icon("address-card"),
          menuSubItem("Sobre Ciretran", tabName = "sobre1", icon = icon("book")),
          menuSubItem("Vídeo Institucional",tabName = "video1",icon = icon("video"))),
        menuItem("MICRODADOS",tabName = "microdados",icon = icon("database")),
        menuItem("GLOSSÁRIO", tabName = "conceitos", icon = icon("book")),
        menuItem("RAT",tabName = "socioeconomico",icon = icon("male")),
        menuItem("TIPOS",tabName = "condicao_da_vitima",icon = icon("wheelchair")),
        menuItem("Serviços",tabName = "ocorrencias",icon = icon("calendar")),
        menuItem("Características",tabName = "pictogramas",icon = icon("road-bridge")
        )
      )
    ),
###################################################################################################
    body = dashboardBody(fluidPage(tags$head(
      tags$link(rel = "shortcut icon", href = "icons8-favicon-94.png", type = "image/x-icon"),
      tags$link(rel = "stylesheet",
                href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css")
    )),
###################################################################################################
    tabItems(
      tabItem(
        tabName = "sobre1",
        tabBox(
          id = "t1",
          width = 12,
          tabPanel(
            "CIRETRAN'S",
            icon = icon("address-card"),
            fluidRow(
              column(
                width = 7,
                position = "left",
                solidHeader = TRUE,
                tags$img(
                  id = "foto1",
                  src = "ciretran.jpg",
                  controls = "controls",
                  width = 750,
                  height = 500
                ),
                tags$br(),
                tags$a("Photo by Asdecom"),
                align = "left"
              ),
              column(
                width = 5,
                tags$br(),
                tags$p(
                  style = "text-align:justify;font-si20pt",
                  strong(
                    "As Circunscrições Regionais de Trânsito (CIRETRAN’s) são unidades administrativas do DETRAN-PA, sediadas nos Municípios do interior do Estado, com competência para desenvolver ações de planejamento, controle, execução, fiscalização e avaliação das atividades relacionadas ao cadastro de veículos, ao processo de habilitação de condutores, operação, fiscalização, engenharia e educação de trânsito, no âmbito de sua circunscrição, previstas no CTB."
                  )
                ),
                tags$br(),
                tags$p(
                  style = "text-align: justify;font-si20pt",
                  strong(
                    "As Circunscrições Regionais de Trânsito são classificadas nas categorias “A” e “B”, e suas classificações e implantações devem ser aprovadas pelo CONADM e homologadas por ato do Chefe do Poder Executivo. Conforme dito anteriormente, as Circunscrições Regionais de Trânsito – CIRETRAN’s possuem duas classificações, determinadas como tipo “A” e tipo “B”."
                  )
                ),
                tags$br(),
                tags$p(
                  style = "text-align: justify;font-si20pt",
                  strong(
                    "Sendo que as CIRETRANS tipo “A” realizam os mesmos serviços da Sede-Belém, já as CIRETRANS tipo “B”, com exceção de Canaã dos Carajás e Santa Izabel do Pará, não realizam exames de legislação e prático de trânsito, conforme disposto na Lei nº 7.594/2011. "
                  )
                ),
                tags$br(),
                tags$p(
                  style = "text-align:justify;font-si20pt",
                  strong(
                    "Atualmente, o DETRAN possui 12 CIRETRAN’s do tipo A e 39 CIRETRAN’s do tipo B cujos municípios onde estão instaladas contemplam o total de 87% da frota de veículos e 91% do total de condutores habilitados registrados no Estado. Entretanto esta grande cobertura não tem sido suficiente para reduzir a inadimplência dos veículos registrados, o aumento de CNH’s vencidas, bem como os índices de acidentes de trânsito no estado do Pará, o que sugere a necessidade de uma maior efetividade da presença do DETRAN no Estado."
                  )
                )
              )
            )
          ),
###################################################################################################
          tabPanel("ATIVIDADES",
                   icon = icon("hospital"),
                   fluidRow(
                     column(
                       width = 4,
                       position = "center",
                       solidHeader = TRUE,
                       tags$br(),
                       tags$p(
                         style = "text-align:justify;font-si20pt",
                         strong(
                           " As CIRETRANS e suas delegacias são interligadas com o DETRAN-PA nos municípios onde está instalada, em todo o interior do estado, tendo a responsabilidade principal de exigir e impor a obediência às leis de trânsito e seu devido cumprimento, representando o DETRAN nas cidades onde não existe a delegacia desse órgão."
                         )
                       ),
                       tags$br(),
                       tags$p(
                         style = "text-align:justify;font-si20pt",
                         strong(
                           " Estando interligado com o DETRAN-PA, as CIRETRAN’S prestam todos os serviços necessários aos usuários de veículos de sua cidade, atende também toda a população procurando soluções e facilitando as necessidades dos condutores e proprietários de veículos, sem haver a necessidade de procurar delegacias de outras cidades ou mesmo precisar ir para longe solucionar problemas."
                         )
                       ),
                       tags$br(),
                       tags$p(style = "text-align:justify;font-si20pt",
                              strong(""))
                     )
                   )),
###################################################################################################
          tabPanel("SOFTWARE'S", icon = icon("computer"),
                   fluidRow(
                     column(
                       width = 4,
                       position = "center",
                       solidHeader = TRUE,
                       tags$br(),
                       tags$p(
                         style = "text-align: justify;font-si20pt",
                         strong(
                           "Para Criação do Anuário em Formato Web com Dasboard Interativos, foi Desenvolvido um script em Linguagem de Programação R-PROJECT Versão 4.2.2, no formato de Projeto de Software Livre de Código Aberto (open source), ou seja, pode ser utilizado sem custos de licença (R DEVELOPMENT CORE TEAM, 2022)"
                         )
                       ),
                       tags$br(),
                       tags$img(
                         id = "foto2",
                         src = "R.jpg",
                         controls = "controls",
                         width = 100,
                         height = 100
                       ),
                       tags$br(),
                       tags$a("Software R",
                              href = "https://cran.r-project.org/bin/windows/base/R-4.3.2-win.exe"),
                       tags$br(),
                     ),
                     column(
                       width = 4,
                       position = "center",
                       solidHeader = TRUE,
                       tags$br(),
                       tags$p(
                         style = "text-align: justify;font-si20pt",
                         strong(
                           "Foi utilizado um Ambiente de Desenvolvmento Integrado (IDE) Chamado Rstudio Versão 1.4.1.7, utilizando um Processo de Extração-Transformação-Carga(ETL) com uso de Várias bibliotecas (library), para o Ambiente Windows"
                         )
                       ),
                       tags$br(),
                       tags$img(
                         id = "foto3",
                         src = "RStudio.png",
                         controls = "controls",
                         width = 150,
                         height = 150
                       ),
                       tags$br(),
                       tags$a("RStudio",
                              href = "https://download1.rstudio.org/electron/windows/RStudio-2023.09.1-494.exe"),
                       tags$br(),
                     )
                   )),
###################################################################################################
          tabPanel("CRÉDITOS", icon = icon("phone"),
                   fluidRow(
                     column(
                       width = 4,
                       position = "center",
                       solidHeader = TRUE,
                       tags$br(),
                       tags$p(
                         style = "text-align: justify;font-si20pt",
                         strong("DEPARTAMENTO DE TRÂNSITO DO ESTADO DO PARÁ - DETRAN/PA")
                       ),
                       tags$p(style = "text-align: justify;font-si20pt",
                              strong("RENATA MIRELA COELHO")),
                       tags$p(style = "text-align: justify;font-si20pt",
                              strong("AVENIDA: AUGUSTO MONTENEGRO KM 03 S/N")),
                       tags$p(style = "text-align: justify;font-si20pt",
                              strong("CEP: 66635-918 - PARQUE VERDE - BELÉM - PARÁ")),
                       tags$a("https://www.detran.pa.gov.br",
                              href = "https://www.detran.pa.gov.br"),
                       tags$br(),
                       tags$br(),
                       tags$p(
                         style = "text-align: justify;font-si20pt",
                         strong(
                           "Esta publicação deve ser citada como: Departamento de Trânsito do Estado do Pará (DETRAN-PA), Anuário Estatístico de Acidentes de Trânsito, 2023 (LC/PUB.2023/1-P), Belém, 2023."
                         )
                       ),
                       tags$br(),
                       tags$p(
                         style = "text-align: justify;font-si20pt",
                         strong(
                           "A autorização para a reprodução total ou parcial deste trabalho deve ser solicitada ao Departamento de Trânsito do Estado do Pará, Gerência de Análise e Estatística de Trânsito, gerest@detran.pa.gov.br. Os Estados membros das Nações Unidas e suas instituições governamentais podem reproduzir este trabalho sem autorização prévia. Solicita-se apenas que mencionem a fonte e informem ao DETRAN-PA de tal reprodução."
                         )
                       ),
                       tags$br(),

                     ),
                     column(
                       width = 4,
                       position = "center",
                       solidHeader = TRUE,
                       tags$br(),
                       leafletOutput("mapa"),
                     )

                   )),
###################################################################################################
          tabPanel("SUGESTÕES",
                   fluidRow(
                     column(
                       width = 4,
                       position = "center",
                       tags$br(),
                       tags$p(
                         style = "text-align: justify;font-si20pt",
                         strong(
                           "Reclamações, sugestões, críticas e elogios relacionados ao Anuário
Estatístico de Acidentes de Trânsito do DETRAN-PA podem ser registrados na Gerência de Análise Estatística de Trânsito, por intermédio do "
                         )
                       ),
tags$a("estatisticadetransito@detran.pa.gov.br",
       href = "gerest@detran.pa.gov.br"),
                     )
                   ))
        )
      ),
###################################################################################################
tabItem(tabName = "video1",
        tabBox(
          id = "t2",
          width = 12,
          tabPanel(
            "Video Institucional",
            icon = icon("video"),
            fluidRow(
              column(
                width = 8,
                position = "center",
                solidHeader = TRUE,
                tags$br("Projeto Strengthening Road Traffic Enforcement in Brazil"),
                tags$video(
                  id = "videoID",
                  type = "video/mp4",
                  src = "video_detran.mp4",
                  width = 750,
                  height = 500,
                  controls = "controls"
                ),
                tags$br() ,
                tags$a("Video: by Asdecom"),
                align = "left"
              ),
              column(
                width = 4,
                tags$br(),
                tags$p(
                  style = "text-align:justify;font-si20pt",
                  strong(
                    "O Departamento de Trânsito do Estado do Pará obteve o Projeto “Strengthening Road Traffic Enforcement
in Brazil” aprovado e financiado pela (United Road Safety Fund), com duração de 12 meses, se constituindo
o único selecionado do Brasil, que somado as propostas de alguns outros países, formam o conjunto de projetos
nacionais administrados pelo Fundo, coordenado e supervisionados por diversas Agências e Comissões
Regionais das Nações Unidas."
                  )
                ),
tags$br(),
tags$p(
  style = "text-align: justify;font-si20pt",
  strong(
    "Concomitantemente, o Projeto Brasileiro é supervisionado pela Comissão Econômica das Nações
Unidas para América Latina e Caribe (CEPAL), coordenado e implementado pelo DETRAN-PA
em parceria com Conselho Estadual de Trânsito do Estado do Pará (CETRAN-PA), e tem como objetivo
contribuir para a redução de mortes e lesões no Trânsito através das atividades de Educação, Engenharia e
Fiscalização em nível Estadual."
  )
)
              )
            )
          )
        )),
###################################################################################################
tabItem(tabName = "conceitos",
        tabBox(
          id = "t3",
          width = 12,


          tabPanel("TURNOS", icon = icon("calendar"),
                   fluidRow(
                     column(
                       width = 4,
                       solidHeader = TRUE,
                       tags$br(),
                       tags$p(
                         style = "text-align:justify;font-si20pt",
                         strong("O Horário dos Sinistros é Classificados em quatro Turnos a saber:")
                       ),
                       tags$br(),
                       tags$p(
                         style = "text-align:justify;font-si20pt",
                         strong(
                           "1) MADRUGADA: compreende todos os acidentes ocorridos a partir da hora (00:00 minutos até às 05:59min)"
                         )
                       ),
                       tags$br(),
                       tags$p(
                         style = "text-align:justify;font-si20pt",
                         strong(
                           "2) MANHÃ: compreende todos os acidentes ocorridos a partir da hora (06:00 minutos até às 11:59min);"
                         )
                       ),
                       tags$br(),
                       tags$p(
                         style = "text-align:justify;font-si20pt",
                         strong(
                           "3) TARDE: compreende todos os acidentes ocorridos a partir da hora (12:00 minutos até às 17:59min); "
                         )
                       ),
                       tags$br(),
                       tags$p(
                         style = "text-align:justify;font-si20pt",
                         strong(
                           "4) NOITE: compreende todos os acidentes ocorridos a partir da hora (18:00 minutos até às 23:59min); "
                         )
                       )
                     )
                   )),
###################################################################################################
          tabPanel("CONVENÇÕES", icon = icon("landmark"),
                   fluidRow(
                     column(
                       width = 4,
                       solidHeader = TRUE,
                       tags$br(),
                       tags$p(
                         style = "text-align:justify;font-si20pt",
                         strong("O Sistema segue a orientação das Normas da ABNT - NBR 10697.")
                       ),
                       tags$br(),
                       tags$p(
                         style = "text-align:justify;font-si20pt",
                         strong("(-): Dado numérico igual a zero não resultante de arredondamento;")
                       ),
                       tags$br(),
                       tags$p(
                         style = "text-align:justify;font-si20pt",
                         strong(
                           "NI: Referem-se aos acidentes, vítimas ou atributos não informados."
                         )
                       ),
                       tags$br(),
                       tags$p(style = "text-align:justify;font-si20pt",
                              strong("(…): Dado numérico não disponível."))
                     )
                   )),
        )),
###################################################################################################
#tabItem(tabName = "anuario",           fluidRow()),
#tabItem(tabName = "microdados",        fluidRow(microdados_ui("microdados"))),
#tabItem(tabName = "socioeconomico",    fluidRow(socioeconomico_ui("socioeconomico"))),
#tabItem(tabName = "condicao_da_vitima",fluidRow(cond_vitima_ui("cond_vitima"))),
#tabItem(tabName = "ocorrencias",       fluidRow(ocorrencia_ui("ocorrencia"))),
#tabItem(tabName = "custo_hospitalar",  fluidRow(custo_hospitalar_ui("custo_hospitalar"))),
#tabItem(tabName = "localizacao",       fluidRow(localizacao_ui("localizacao"))),
#tabItem(tabName = "pictogramas",       fluidRow(pictogramas_ui("pictogramas"))),
#tabItem(tabName = "taxas1",             fluidRow(taxas1_ui("taxas1"))),
#tabItem(tabName = "taxas2",             fluidRow(taxas2_ui("taxas2"))),
3tabItem(tabName = "taxas3",             fluidRow(taxas3_ui("taxas3"))),
#tabItem(tabName = "taxas4",             fluidRow(taxas4_ui("taxas4")))
    )),
###################################################################################################),
footer = dashboardFooter(
  left = tags$b("DETRAN-PA"),
  right = tags$b("Belém-PA, 2024 v.1")
),
title = "CNH"
  ),
###################################################################################################
#Servidor

server <- function(input, output, session) {

  detran_location <- data.frame(
    lat = -1.37843,  # Substitua pelo valor correto da latitude
    lon = -48.44034  # Substitua pelo valor correto da longitude
  )
  output$mapa <- renderLeaflet({
    df <- read.csv(textConnection("Nome,lat,lon,
                              DETRAN-PA, -1.37843,-48.44034"))

    leaflet(df) %>%
      addTiles() %>%
      addMarkers(~lon, ~lat, label = ~htmlEscape(Nome),
                 labelOptions = labelOptions(noHide = FALSE,
                                             textsize = "15px")
      )%>%
      #leaflet(options = leafletOptions(minZoom = 0, maxZoom = 18)) %>%
      #addProviderTiles(providers$Esri.WorldStreetMap)%>%
      addProviderTiles(providers$OpenSeaMap)%>%
      setView(lng = detran_location$lon,
              lat = detran_location$lat,
              zoom = 15)
    #addMarkers(
    #           lng = detran_location$lon,
    #           lat = detran_location$lat,
    #           popup = "DETRAN-PA"
    #           ) %>%
    #addCircleMarkers()

  })

#microdados_Server("microdados")
#socioeconomico_Server("socioeconomico")
#cond_vitima_Server("cond_vitima")
#ocorrencia_Server("ocorrencia")
#custo_hospitalar_Server("custo_hospitalar")
#localizacao_Server("localizacao")
#pictogramas_Server("pictogramas")
#taxas1_Server("taxas1")
#taxas2_Server("taxas2")
#taxas3_Server("taxas3")
#taxas4_Server("taxas4")




}
)
