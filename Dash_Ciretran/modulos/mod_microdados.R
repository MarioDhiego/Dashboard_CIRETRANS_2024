

#==============================================================================#
#1.1 MÓDULO MICRODADOS                                                          ----

microdados_ui <- function(id) {

  fluidPage(
    navbarPage(
      title = "MICRODADOS GERAIS",
      tabPanel("Base de Dados",
#1.2 Base de Dados                                                              ----
               fluidRow(
                 box(
                   width = 12,
                   title = textOutput(NS(id,"txt1")),
                   status = "primary",
                   solidHeader = TRUE,
                   collapsible = TRUE,
                   height = 35,
                   reactableOutput(NS(id,"tabela1")),
                   footer = list(
                     column(11,
                            tags$b("Fonte: "), "Projeto Pareamento: SISP-PC/PRE/PRF/IML/CBM/SAMU/AIH"),
                     downdoload_ui(NS(id,"d1"))
                   )

                 )
               )
              ),
      tabPanel("Ciretran Tipo A",
#==============================================================================#

#==============================================================================#
#1.3 Fonte de Dados                                                             ----
               fluidRow(
                 box(
                   width = 12,
                   title = "Tipo A",
                   status = "primary",
                   solidHeader = TRUE,
                   collapsible = TRUE,
                   height = 35,
                   div(class = "elemente",
                   DiagrammeROutput(NS(id,"fonte11"),width = "100%")
                   )

                 )
               )
              ),
      tabPanel("Ciretran Tipo B",
#==============================================================================#

#==============================================================================#
#1.4 Pareamento                                                                 ----
               fluidRow(
#1.4.1 Etapa 1                                                                  ----
                 box(
                   width = 12,
                   title = "Tipo B",
                   status = "primary",
                   solidHeader = TRUE,
                   collapsible = TRUE,
                   height = 35,
                   DiagrammeROutput(NS(id,"med1"))
                 )
               )
            )
        )
  )
}
#==============================================================================#

#==============================================================================#
#2.0 FUNÇÃO DO MÓDULO SERVIDOR                                                  ----
microdados_Server <- function(id) {
  moduleServer(id, function(input, output, session) {
#2.1 Dados                                                                      ----
    output$txt1 <- renderText({
      paste0("Base de Dados sobre Vítimas Fatais por Sinistros de Trânsito - ",min(Pareamento_Limpo$Ano)," a ",max(Pareamento_Limpo$Ano))
    })

#==============================================================================#
#2.2 Base de Dados                                                              ----

output$tabela1 <- renderReactable({
  x <- Pareamento_Limpo
  x %>% reactable(
    searchable = TRUE,
    highlight = TRUE,
    bordered = TRUE,
    borderless = FALSE,
    #onClick = "expand",
    #selection = "multiple",
    compact = TRUE,
    striped = TRUE,
    fullWidth = TRUE,
    wrap = TRUE,
    theme = reactableTheme(
      borderColor = "#dfe2e5",
      stripedColor = "#f6f8fa",
      highlightColor = "#f0f5f9",
      cellPadding = "8px 12px",
      style = list(fontFamily = "-apple-system, BlinkMacSystemFont, Segoe UI, Helvetica, Arial, sans-serif"),
      searchInputStyle = list(width = "100%")
    ),
    defaultColDef = colDef(width=102, na="-"),
    showPageSizeOptions = TRUE,
    pageSizeOptions = c(7, 10, 25, 50, 100, 500),
    defaultPageSize = 7,
    showPagination = TRUE,
    language=reactableLang(
      searchPlaceholder = "Procurar...",
      noData="Nenhuma entrada encontrada",
      pageInfo="{rowStart} para {rowEnd} de {rows} entradas",
      pagePrevious="\u276e",
      pageNext="\u276f",
      pagePreviousLabel="Página anterior",
      pageNextLabel="Próxima página")
    )
  })


#output$tabela1 <- renderDataTable({
#  x <- Pareamento_Limpo
#  datatable(x,
#            filter = "top",
#            #filter = "bottom",
#            plugins='natural',
#            extensions='Buttons',
#            options=list(dom='Blfrtip',buttons=c('copy','csv','excel','pdf','print'),
#                         engthMenu=list(c(5,50,100,250,-1)), c(5,50,100,250,"All"),
#                         pageLength=8,
#                        autoWidth=TRUE,
#                         scrollX=TRUE),
#            rownames=FALSE,
#            class='cell-border compact stripe hover row-border order-column dt-body-right',
#            style='bootstrap',
#            editable='cell',
#            colnames=c('Ano','Gênero','Idade','Faixa-Etária','Raça','Estado Civil',
#                       'Escolaridade','Local Obito','Drogas','Alcool','Condição',
#                       'Veículo','Tipo','Turno','Dia','Meses','Rua','Bairro',
#                       'Municípios','Fatal'),
#            caption='Tabela 1. Base de Dados sobre Vítimas Fatais por Acidentes de Trâsito-2020.')
#})



#==============================================================================#

#==============================================================================#
# 2.3 Fonte de Dados                                                            ----

output$fonte11 <- renderDiagrammeR({
mermaid("
graph TD
A[DETRAN-PA]-->B[CIRETRAN A]
B-->C[LEI Nº7594/2011]
B-->D[LEI Nº432/2019]
B-->E[LEI Nº/2023]
C-->F[Santarém]
F-->G[Castanhal]
G-->H[Marabá]
H-->I[Abaetetuba]
C-->J[Altamira]
J-->K[Capanema]
K-->L[Paragominas]
L-->M[Tucuruí]
C-->N[Redenção]
N-->O[Itaituba]
O-->P[Parauapebas]
P-->Q[Breves]
D-->R[BRAGANÇA]
R-->S[SÃO FÉLIX]
E-->T[ANANINDEUA]
T-->U[CAMETÁ]
U-->V[SALINÓPOLIS]
V-->X[TAILÂNDIA]
",width=500)
})
#==============================================================================#

#==============================================================================#
#2.4 Pareamento                                                                 ----
#2.4.1 Diagrama med1                                                            ----

output$med1 <- renderDiagrammeR({
mermaid("
graph TD
A[LEI Nº7594/2011]-->B[DETRAN-PA]
B-->C[CIRETRAN TIPO B]
C-->D[Soure]
D-->E[Alenquer]
E-->F[ALmeirim]
F-->G[Monte Alegre]
G-->H[Obidos]
H-->I[Vigia]
C-->J[Oriximiná]
J-->K[Iguarapé-Açú]
K-->L[São Miguel]
L-->M[Santa Luzia]
M-->N[Tomé-Açú]
N-->O[Itupiranga]
C-->P[Jacundá]
P-->Q[Rondon]
Q-->R[São Geraldo]
R-->S[Barcarena]
S-->T[Igarapé-Miri]
T-->U[Medicilândia]
C-->V[Uruará]
V-->W[Capitão Poço]
W-->X[Ourilândia do Norte]
X-->Y[Dom Eliseu]
Y-->Z[Mãe do Rio]
Z-->A1[Novo Repartimento]
C-->A2[Conceição do Araguaia]
A2--> A3[Santana do Araguaia]
A3-->A4[Tucumã]
A4-->A5[Novo Progresso]
A5-->A6[Canãa dos Carajás]
A6-->A7[Curionópolis]
", width = 1000)
})
#==============================================================================#

#==============================================================================#
#2.4.2 Diagrama med2                                                            ----

output$med2 <- renderDiagrammeR({
mermaid("
graph TB
A[PAREAMENTO2]-->B{BASE: RESGATE}
B-->C[SAMU]
B-->D[BOMBEIRO]
C-->E(LUVF2)
D-->E(LUVF2)
",width=50)
})
#==============================================================================#

#==============================================================================#
#2.4.3 Diagrama med3                                                            ----

output$med3 <- renderDiagrammeR({
mermaid("
graph TB
A[PAREAMENTO3]-->B{BASE: SAÚDE}
B-->C[SESMA]
B-->D[SESPA]
B-->E(HMUE)
C-->F(LUVF3)
D-->F(LUVF3)
E-->F(LUVF3)
",width=50)
  })
#==============================================================================#

#==============================================================================#
#2.4.4 Diagrama med4                                                            ----

output$med4 <- renderDiagrammeR({
mermaid("
graph TB
A[PAREAMENTO FINAL]-->B{BASES}
B-->C[LUVF1]
B-->D[LUVF2]
B-->E(LUVF3)
C-->F(BASE FINAL)
D-->F(BASE FINAL)
E-->F(BASE FINAL)
",width=50)
})
#==============================================================================#

#==============================================================================#
#3.0 DOWANLOAD DE ARQUIVOS                                                      ----
#3.1 Base de Dados                                                              ----
#3.1.1 Filtrar os Dados                                                         ----

d1 <- reactive({Pareamento_Limpo})
#Monitora a base filtrada, defini o texto a ser baixado
    observeEvent(d1(), {
      t <- paste0("Base de Dados sobre Vítimas Fatais por Sinistros de Trânsito - ",min(Pareamento_Limpo$Ano)," a ",max(Pareamento_Limpo$Ano))
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




