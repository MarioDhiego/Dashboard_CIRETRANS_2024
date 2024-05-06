
#==============================================================================#
#1.1 MÓDULO MICRODADOS                                                          ----

microdados_ui <- function(id) {
  
  fluidPage(
    navbarPage(
      title = "MICRODADOS GERAIS",
      tabPanel("BASE DE DADOS",
#1.2 Base de Dados                                                              ----
               fluidRow(
                 box(
                   width = 12,
                   title = textOutput(NS(id,"txt1")),
                   status = "primary",
                   solidHeader = TRUE,
                   collapsible = TRUE,
                   height = 35,
                   dataTableOutput(NS(id,"tabela1")),
                   footer = list(
                     column(11,
                            tags$b("Fonte: "), "DETRAN-PA"),
                     downdoload_ui(NS(id,"d1")) 
                   )
                   
                 )
               )
              ),
      tabPanel("CIRETRAN TIPO A",
#==============================================================================#  
#1.3 Fonte de Dados                                                             ----
               fluidRow(
                 box(
                   width = 12,
                   title = "Categoria A",
                   status = "primary",
                   solidHeader = TRUE,
                   collapsible = TRUE,
                   headerBorder = TRUE,
                   div(class = "elemente",
                   DiagrammeROutput(NS(id,"fonte11"),
                                    width = "100%")
                   )
  
                 )
               )
              ),
      tabPanel("CIRETRAN TIPO B",
#==============================================================================#
#1.4 Pareamento                                                                 ----
              fluidRow(
#1.4.1 Etapa 1                                                                  ----
                 box(
                   width = 12,
                   title = "Categoria B",
                   status = "primary",
                   solidHeader = TRUE,
                   collapsible = TRUE,
                   headerBorder = TRUE,
                   DiagrammeROutput(NS(id,"med1"),
                                    width = "100%")
                 )
               )
            ),

tabPanel("CIRETRAN HOMOLOGADAS",
         #==============================================================================#
         #1.4 Pareamento                                                                 ----
         fluidRow(
           #1.4.1 Etapa 1                                                                  ----
           box(
             width = 12,
             title = "Homologadas",
             status = "primary",
             solidHeader = TRUE,
             collapsible = TRUE,
             headerBorder = TRUE,
             DiagrammeROutput(NS(id,"med2"))
           )
         )
         ),
tabPanel("POSTO DE ATENDIMENTO",
         #==============================================================================#
         #1.4 Pareamento                                                                 ----
         fluidRow(
           column(12,
           #1.4.1 Etapa 1                                                                  ----
           box(
             maximizable = TRUE,
             title = "Posto",
             status = "primary",
             collapsible = FALSE,
             solidHeader = TRUE,
             headerBorder = TRUE,
             width = 12,
             DiagrammeROutput(NS(id,"med3"))
           )
         )
         )
         )
    )
  )
}
#==============================================================================#
#2.0 FUNÇÃO DO MÓDULO SERVIDOR                                                  ----
microdados_Server <- function(id) {
  moduleServer(id, function(input, output, session) {
#2.1 Dados                                                                      ----
    output$txt1 <- renderText({
      paste0("Base de Dados sobre Servicos das CIRETRAN'S - ",min(Pareamento_Limpo$Ano)," a ",max(Pareamento_Limpo$Ano))
    })
#==============================================================================#
#2.2 Base de Dados                                                              ----

  #output$tabela1 <- renderReactable({
  #x <- CIRETRAN_EMPRESAS
  #x %>% reactable(
  #  searchable = TRUE,
  #  highlight = TRUE,
  #  bordered = TRUE,
  #  borderless = FALSE,
  #onClick = "expand",
  #selection = "multiple",
  #  compact = TRUE,
  #  striped = TRUE,
  #  fullWidth = TRUE,
  #  wrap = TRUE,
  #  theme = reactableTheme(
  #    borderColor = "#dfe2e5",
  #    stripedColor = "#f6f8fa",
  #    highlightColor = "#f0f5f9",
  #    cellPadding = "8px 12px",
  #    style = list(fontFamily = "-apple-system, BlinkMacSystemFont, Segoe UI, Helvetica, Arial, sans-serif"),
  #    searchInputStyle = list(width = "100%")
  #  ),
  #  defaultColDef = colDef(width=102, na="-"),
  #  showPageSizeOptions = TRUE,
  #  pageSizeOptions = c(7, 10, 25, 50, 100, 500),
  #  defaultPageSize = 7,
  #  showPagination = TRUE,
  #  language=reactableLang(
  #    searchPlaceholder = "Procurar...",
  #    noData="Nenhuma entrada encontrada",
  #    pageInfo="{rowStart} para {rowEnd} de {rows} entradas",
  #    pagePrevious="\u276e",
  #    pageNext="\u276f",
  #    pagePreviousLabel="Página anterior",
  #    pageNextLabel="Próxima página"))
  #})
    
  
output$tabela1 <- renderDataTable({
  setwd("C:/Users/mario.valente/Documents/Github2/Dashboard_Modulo_Ciretran_2024/data")
  CIRETRAN_EMPRESAS <- read_excel("CIRETRAN_EMPRESAS.xls")
  
  datatable(CIRETRAN_EMPRESAS,
            filter = "top", 
            #filter = "bottom",
            plugins='natural',
            extensions='Buttons',
            options=list(dom='Blfrtip',buttons=c('copy','csv','excel','pdf','print'),
                         engthMenu=list(c(5,50,100,250,-1)), c(5,50,100,250,"All"),
                         pageLength = 7, 
                         autoWidth=TRUE,
                         scrollX=TRUE),
            rownames=FALSE,
            class='cell-border compact stripe hover row-border order-column dt-body-right',
            style='bootstrap',
            editable='cell',
            colnames=c('Município','Região de Integração','RAT','Tipos','Nº Servidores','Nº Vistoriador','Nº AFT','Nº Auxiliar','Nº Assistente','Nº Analista','Clínicas','Biometria','Emissão',
'Estação Coleta','Estação de Prova','Empresas Vistoria','Empresa Estampas','CFC','Parque Retenção', 'Pista Exame', 'Situção Imóvel'),
            caption='Tabela 1. Base de Dados sobre Servicos das CIRETRANS.')
})
#==============================================================================#
# 2.3 Fonte de Dados                                                            ----
#library(htmltools)

output$fonte11 <- renderDiagrammeR({
mermaid("
graph TB
A[DETRAN-PA]-->B[CIRETRAN TIPO A]
B-->C[LEI Nº7594/2011]
B-->D[LEI Nº432/2019]
B-->E[CONADM/2023]
C-->F[SANTARÉM]
F-->G[CASTANHAL]
G-->H[MARABÁ]
H-->I[ABAETETUBA]
C-->J[ALTAMIRA]
J-->K[CAPANEMA]
K-->L[PARAGOMINAS]
L-->M[TUCURUÍ]
C-->N[REDENÇÃO]
N-->O[ITAITUBA]
O-->P[PARAUAPEBAS]
P-->Q[BREVES]
D-->R[BRAGANÇA]
R-->S[SÃO FÉLIX]
E-->T[ANANINDEUA]
T-->U[CAMETÁ]
U-->V[SALINÓPOLIS]
V-->X[TAILÂNDIA]
", width = 1000, 
   align = 'center')
})
#==============================================================================#
#2.4 Pareamento                                                                 ----
#2.4.1 Diagrama med1                                                            ----
output$med1 <- renderDiagrammeR({
mermaid("graph TB
  A[LEI Nº7594/2011]-->B[DETRAN-PA]
  B-->C[CIRETRAN TIPO B]
  C-->D[SOURE]
  D-->E[ALENQUER]
  E-->F[ALMERIM]
  F-->G[MONTE ALEGRE]
  G-->H[OBIDOS]
  C-->I[ORIXIMINÁ]
  I-->J[IGUARAPÉ-AÇÚ]
  J-->K[SÃO MIGUEL]
  K-->L[SANTA LUZIA]
  L-->M[TOMÉ-AÇÚ]
  C-->N[ITUPIRANGA]
  N-->O[JACUNDÁ]
  O-->P[RONDON]
  P-->Q[SÃO GERALDO]
  Q-->R[BARCARENA]
  C-->S[IGARAPÉ-MIRI]
  S-->T[MEDICILÂNDIA]
  T-->U[URUARÁ]
  U-->V[CAPITÃO POÇO]
  V-->W[OUTILÂNDIA DO NORTE]
  C-->X[DOM ELISEU]
  X-->Y[MÃE DO RIO]
  Y-->Z[NOVO REPARTIMENTO]
  Z-->A1[CONCEIÇÃO DO ARAGUAIA]
  A1-->A2[SANTANA DO ARAGUAIA]
  C-->A3[TUCUMÃ]
  A3-->A4[NOVO PROGRESSO]
  A4-->A5[CANÃA DOS CARAJÁS]
  A5-->A6[CURIONÓPOLIS]
  A6-->A7[RURÓPOLIS]
   C-->A8[VIGIA]
  ", width = 1000)
})
#==============================================================================#
#2.4.1 Diagrama med2                                                            ----

output$med2 <- renderDiagrammeR({
  mermaid("graph TD
A[DETRAN-PA]-->B[CONADM]
B-->C[HOMOLOGADAS]
C-->D[2008]
D-->E[ULIANÓPOLIS]
C-->F[2009]
F-->G[MARITUBA]
C-->I[2013]
I-->J[SÃO DOMINGOS]
C-->K[2019]
K-->L[JURUTI]
L-->M[VISEU]
", width = 1000, 
   align = 'center')
})
#==============================================================================#
#==============================================================================#
#2.4.1 Diagrama med3                                                            ----

output$med3 <- renderDiagrammeR({
mermaid("
graph TD
A[DETRAN-PA]-->B[POSTO DE ATENDIMENTO]
B-->C[BELÉM]
C-->D[SHOPPING BOULEVARD]
D-->F[SHOPPING BOSQUE GRÃO PARÁ]
F-->G[SHOPPING METRÓPOLE]
G-->H[SHOPPING PÁTIO BELÉM]
B-->I[Marabá]
I-->J[SHOPPING PÁTIO MARABÁ]
B-->K[PARAUAPEBAS]
K-->L[SHOPPING KARAJÁS]
B-->M[SANTARÉM]
M-->N[ESTAÇÃO CIDADANIA]
", width = 1000, 
   align = 'center')
})

#==============================================================================#
#3.0 DOWANLOAD DE ARQUIVOS                                                      ----
#3.1 Base de Dados                                                              ----
#3.1.1 Filtrar os Dados                                                         ----

d1 <- reactive({Pareamento_Limpo})
#Monitora a base filtrada, defini o texto a ser baixado
    observeEvent(d1(), {
      t <- paste0("Base de Dados sobre Servicos das CIRETRAN'S - ",min(Pareamento_Limpo$Ano)," a ",max(Pareamento_Limpo$Ano))
      download_Server("d1",d1(),t)})
    
  })
}
#==============================================================================#
#3.2 Play do Módulo                                                             ----

ui <- dashboardPage(header=dashboardHeader(),
                    title="microdados",
                    sidebar=dashboardSidebar(),
                    body=dashboardBody(fluidPage(microdados_ui("microdados"))))
#==============================================================================#

#==============================================================================#
server <- function(input, output) {
  microdados_Server("microdados")
}
#==============================================================================#

#==============================================================================#
shinyApp(ui, server)
#==============================================================================#




