#===============================================================================#
# 1.0 INTERFACE GERAL ----------------------------------------------------------
#===============================================================================#

#              DETRAN-PA - Departamento de Trânsito do Estado do Pará
#===============================================================================#
#==== DESCRIÇÃO:    Dashboard de CIRETRANS de Trânsito - Pará
#==== ESCRITO POR:  Mário Diego Valente
#====               Tito Félix de Oliveira
#====               Kleber Bezerra Salim
#==== SITE:         https://www.detran.pa.gov.br/
#==== LICENÇA:      MIT
#==== PROJETO:      https://github.com/MarioDhiego/DashBoard_Detran_2023
#===============================================================================#

#===============================================================================#
# 1.1 CARREGAR ARQUIVO GERAL ---------------------------------------------------
source("global.R")
#===============================================================================#

#===============================================================================#
# 2.0 ETAPAS DO DASHBOARD ------------------------------------------------------
# 2.1 DashboardPage ------------------------------------------------------------

shinyApp(
  ui = dashboardPage(#title = "Dash Detran-PA",
    #skin = "blue", 
    #freshTheme = NULL,
    #preloader = NULL,
    #options = list(sidebarExpandOnHover = TRUE),
    #scrollToTop = TRUE,
    #footer = dashboardFooter(left="Copyright © DETRAN-PA - Todos os Direitos Reservados",
    #                      right="Belém-PA, 2023 V.1"),
#===============================================================================#
# 2.2 DashboardHeader ----------------------------------------------------------
header = dashboardHeader(title = span(tags$b("CIRETRAN'S")),

#===============================================================================#
# 2.2.1 Redes Sociais ----------------------------------------------------------
tags$li(class = "dropdown",
        a(href = "https://www.facebook.com/detranPARA",
          class = "fa fa-facebook",
          target = "_blank"
          )
        ),
tags$li(class = "dropdown",
        a(href = "https://www.instagram.com/detranpa_",
          class = "fa fa-instagram",
          target = "_blank"
          )
        ),
tags$li(class = "dropdown",
        a(href = "https://twitter.com/DETRAN_PA",
          class = "fa fa-twitter",
          target = "_blank"
          )
        ),
tags$li(
  class="dropdown",
  tags$a(href="https://github.com/MarioDhiego",
         icon("github"), "Suporte", target = "_blank") 
  )
),
#===============================================================================#
# dbHeader,
skin = "blue",
scrollToTop = TRUE,
options = list(sidebarExpandOnHover = TRUE),
#===============================================================================#
# 2.3 DashboardSidebar ---------------------------------------------------------
sidebar = dashboardSidebar(minified = FALSE,
                           collapsed = FALSE,
#===============================================================================#
# 2.3.1 Imagem -----------------------------------------------------------------
tags$img(src = "detran1.jpeg", 
         width = 230,
         heigth = 100),
#===============================================================================#
# 2.3.2 Sidebar Menu -----------------------------------------------------------
sidebarMenu(id = "tabs",
            menuItem("CIRETRAN'S", tabName = "anuario", icon = icon("address-card"),
                     menuSubItem("SOBRE CIRETRAN", tabName = "sobre1", icon=icon("book")),
                     menuSubItem("VÍDEO INSTITUCIONAL", tabName = "video1", icon=icon("video"))),
            menuItem("MICRODADOS", tabName = "microdados", icon=icon("database")) #,
            #menuItem("GLOSSÁRIO", tabName = "conceitos", icon=icon("book")),
            #menuItem("Região de Trânsito", tabName="socioeconomico", icon=icon("male")),
            #menuItem("Tipos de Ciretran's", tabName="condicao_da_vitima",icon=icon("wheelchair")),
           # menuItem("Tipos de Serviços", tabName="ocorrencias", icon=icon("calendar")),
            #menuItem("Características", tabName="pictogramas", icon=icon("road-bridge"))
                     #,
            #menuItem("RODOVIA ESTADUAL", tabName="custo_hospitalar", icon=icon("road-bridge")),
            #menuItem("MAPAS", tabName="localizacao", icon=icon("globe")),
            #menuItem("INDICADORES", tabName="taxas", icon=icon("dashboard"),
            #menuSubItem("Taxa de Mortalidade", tabName="taxas1"),
            #menuSubItem("Taxa de Internação", tabName="taxas4"),
            #menuSubItem("Taxa de Motorização", tabName="taxas2"),
            #menuSubItem("Taxa de Crescimento", tabName="taxas3")
            #                     )
            
                               )
    ),
#===============================================================================#
# 2.4 DashboardBody ------------------------------------------------------------
body = dashboardBody(
      #valueBoxOutput("contador_acessos"),
      fluidPage(
        tags$head(
          tags$link(rel = "shortcut icon", href = "icons8-favicon-94.png", type = "image/x-icon"),
          tags$link(
            rel = "stylesheet",
            href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
          )
        )
      ),
#===============================================================================#
tabItems(
  tabItem(tabName="sobre1",
  tabBox(id="t1", width=12,
  tabPanel("CIRETRAN'S",icon=icon("address-card"),
  fluidRow(column(width=6,
                  position="left",solidHeader = TRUE,
                  tags$img(
                    id="foto1",
                    src="ciretran.jpg",
                    controls="controls",
                    width = 700,
                    height = 550),
                  tags$br(), 
                  tags$a("Photo by Asdecom"),align = "left"),
          column(width = 3,
            tags$br(),
            tags$p(style = "text-align:justify;font-si24pt",
          strong("As Circunscrições Regionais de Trânsito (CIRETRAN’s) são unidades administrativas do DETRAN-PA, sediadas nos Municípios do interior do Estado, com competência para desenvolver ações de planejamento, controle, execução, fiscalização e avaliação das atividades relacionadas ao cadastro de veículos, ao processo de habilitação de condutores, operação, fiscalização, engenharia e educação de trânsito, no âmbito de sua circunscrição, previstas no CTB.")),
            tags$br(),
            tags$p(style = "text-align: justify;font-si24pt",
          strong("As Circunscrições Regionais de Trânsito são classificadas nas categorias A e B, e suas classificações e implantações devem ser aprovadas pelo CONADM e homologadas por ato do Chefe do Poder Executivo. Conforme dito anteriormente, as Circunscrições Regionais de Trânsito -- CIRETRAN's possuem duas classificações, determinadas como tipo A e tipo B. ")
          ),
          tags$br(),
          tags$p(style = "text-align: justify;font-si24pt",
          strong("As CIRETRANS tipo A realizam os mesmos serviços da Sede-Belém, já as CIRETRANS tipo B, com exceção de Canaã dos Carajás e Santa Izabel do Pará, não realizam exames de legislação e prático de trânsito, conforme disposto na Lei nº 7.594/2011, e possuem duas classificações de acordo com a Lei nº 7.594/2011 artigos 17 E 18:")
          )
           ),
          column(
            width=3,
            tags$br(),
            tags$p(style = "text-align: justify;font-si24pt",
          strong("Art. 17: As Ciretrans A são unidades administrativas subordinadas diretamente ao Coordenador das Ciretrans, competindo-lhes o planejamento, controle, operações, fiscalização e educação de trânsito, registro e licenciamento de veículos, habilitação de condutores, engenharia de trânsito, de acordo com o Código de Trânsito Brasileiro e o disposto nesta Lei, dentro de suas respectivas circunscrições administrativas.")
            ),
          tags$br(),
          tags$p(style="text-align: justify;font-si24pt",
                 strong("Art. 18: As Ciretrans B são unidades administrativas subordinadas diretamente ao Coordenador das Ciretrans, competindo-lhes o planejamento, controle, registro e licenciamento de veículos, habilitação de condutores, de acordo com o Código de Trânsito Brasileiro e o disposto nesta Lei, dentro de suas respectivas circunscrições administrativas.")
          ),
          tags$br(),
          tags$p(style="text-align: justify;font-si24pt",
                 strong("Sendo que as CIRETRANS tipo A realizam os mesmos serviços da Sede-Belém, já as CIRETRANS tipo B, com exceção de Canaã dos Carajás e Santa Izabel do Pará, não realizam exames de legislação e prático de trânsito, conforme disposto na Lei nº 7.594/2011.")
                 ),
          tags$br(),
          tags$p(style="text-align: justify;font-si24pt",
                 strong("Atualmente, o DETRAN possui 18 CIRETRAN's do tipo A e 31 CIRETRAN's do tipo B cujos municípios onde estão instaladas contemplam o total de 87% da frota de veículos e 91% do total de condutores habilitados registrados no Estado.")
                 )
          )
          )
  ),
#===============================================================================#
tabPanel("ATIVIDADES", icon=icon("hospital"),
         fluidRow(
           column(
             width=4,position="center",solidHeader = TRUE,
             tags$br(), 
             tags$p(style="text-align:justify;font-si20pt",
                    strong("As CIRETRANS e suas delegacias são interligadas com o DETRAN-PA nos municípios onde está instalada, em todo o interior do estado, tendo a responsabilidade principal de exigir e impor a obediência às leis de trânsito e seu devido cumprimento, representando o DETRAN nas cidades onde não existe a delegacia desse órgão.")),
             tags$br(),
             tags$p(style="text-align:justify;font-si20pt",
                    strong("Estando interligado com o DETRAN-PA, as CIRETRAN’S prestam todos os serviços necessários aos usuários de veículos de sua cidade, atende também toda a população procurando soluções e facilitando as necessidades dos condutores e proprietários de veículos, sem haver a necessidade de procurar delegacias de outras cidades ou mesmo precisar ir para longe solucionar problemas:")),
           ),
           column(
             width=4,position="center",solidHeader = TRUE,
             tags$br("ATIVIDADES"),
             tags$br(),
             tags$p(style="text-align:justify;font-si20pt",
                    strong("1) Consultas sobre infrações recebidas;"),
                    tags$br(),
                    strong("2) Consulta sobre pontos perdidos na CNH;"),
                    tags$br(),
                    strong("3) Informações constantes do arquivo sobre os veículos;"),
                    tags$br(),
                    strong("4) Imposto sobre Propriedade de Veículos Automotores (IPVA);"),
                    tags$br(),
                    strong("5) Licenciamento de veículos;"),
                    tags$br(),
                    strong("6) Registro de veículos automotores;"),
                    tags$br(),
                    strong("7) Seguro Obrigatório (DPVAT);"),
                    tags$br(),
                    strong("8) Emissão de CNH;"),
                    tags$br(),
                    strong("9) Apreensão de CNH;"),
                    tags$br(),
                    strong("10) Apreensão de veículos;"),
                    tags$br(),
                    strong("11) Liberação de Documentos e de Veículos;")
             )
           )
         ) 
),
tabPanel("REGIÃO DE TRÂNSITO (RAT)", icon=icon("hospital"),
         fluidRow(
           column(
             width=4,position="center",solidHeader = TRUE,
             tags$br(), 
             tags$p(style="text-align:justify;font-si20pt",
                    strong("O Diretor Geral do DETRAN-PA, no uso de suas atribuições legais, em especial ao constante no Art.57, IV do Anexo do Decreto Nº 1.635 de 2005 que homologa o Regimento Interno do DETRAN-PA; Considerando o disposto nos Artigos 120, 123 e incisos e 124 da Lei 9.503 de 23 de setembro de 1997 que institui o Código de Trânsito Brasileiro - CTB, resolve:.")),
             tags$br(),
             tags$p(style="text-align:justify;font-si20pt",
                    strong("Art. 1º Determinar que os processos de licenciamento anual de veículos que requeiram vistoria, expedição de 2ª via de CRV, alteração de características de veículos, inclusão ou baixa de reserva de domínio, transferência de jurisdição, mudança de categoria, alteração de dados cadastrais no documento do veículo, gravação ou regravação do chassi, regravação de motor e baixa de veículo só poderão ser realizados junto a este DETRAN-PA no domicílio ou residência do proprietário e/ou arredatário quando houver CIRETRAN e, não havendo Unidades do DETRAN-PA no município de domicílio ou residência prorietário e/ou arrendatário, os processos de serviços deverão ser realizados em uma das CIRETRAN’S da Região de Trânsito do domicílio ou residência do prorietário conforme o anexo I da Portaria Nº681 de 2013.")
                    ),
             tags$br(),
             tags$p(style="text-align:justify;font-si20pt",
                    strong("1° O Posto Avançado da Antônio Barreto atenderá a todos sos serviços com cobertura aos Municípios da região de Trânsito de Belém conforme Anexo I desta Portaria. ")
             ),
             tags$br(),
             tags$p(style="text-align:justify;font-si20pt",
                    strong("2º Os postos de Atendimento das Concessionárias de Belém só poderão atender os serviços de primeiro emplacamento, trasnferência de propriedade e transferência de jurisdição de veículos transacionados diretamente com a Concesssionária")
             )
             
           ),
           column(
             width=4,position="center",solidHeader = TRUE,
             #tags$br("Região Administrativa de Trânsito"),
             tags$br(),
             tags$p(style="text-align:justify;font-si25pt",
            strong("1) REGIÃO DE TRÂSITO DE BELÉM: Ananindeua, Belém, Benevides, Cachoeira do Arari, Marituba, Ponta de Pedras, Salvaterra, Santa Bárbara, Santa Cruz do Arari, São Sebastião da Boa Vista e Soure"),
             ),
            tags$br(),
            tags$p(style="text-align:justify;font-si25pt",
                   strong("2) REGIÃO DE TRÂNSITO DE SANTARÉM: Alenquer Almeirim, Aveiro, Belterra, Curuá, Faro, Juruti, Mojuí dos Campos, Monte Alegre, Òbidos, Oriximiná, Prainha, Santarém e Terra Santa"),
            ),
            tags$br(),
            tags$p(style="text-align:justify;font-si25pt",
                   strong("3) REGIÃO DE TRÂNSITO DE CASTANHAL: Bujaru, Castanhal, Colares, Concórdia do Pará, Curuçá, Igarapé-Açú, Inhangapi, Irituia, Magalhães, Maracanã, Marapanim, São caetano de Odivelas, São Domingos do capim, São Francisco do Pará, São João da Ponta, São Miguel do Guamá, Santa Izabel do Pará, Santa Maria do Pará, Santo Antônio do Tauá, Terra Alta, Tomé-Açú e Vigia"),
            ),
            tags$br(),
            tags$p(style="text-align:justify;font-si25pt",
                   strong("4) REGIÃO DE TRÂNSITO DE MARABÁ: Abel Figueiredo, Bom Jesus do Tocantins, Brejo Grande do Araguaia, Itupiranga, Jacundá, Marabá, Nova Ipixuna, Palestina do Pará, Piçarra, Rondon do Pará, São Domingos do Araguaia, São Geraldo do Araguaia e São João do Araguaia"),
            ),
            tags$br(),
            tags$p(style="text-align:justify;font-si25pt",
            strong("5) REGIÃO DE TRÂNSITO DE ABAETETUBA: Abaetetuba, Acará, Baião Barcarena, Cametá, Igarapé-Miri, Limoeiro do Ajuru, Mocajuba, Moju, Oueiras do Pará, Tailândia."),
            ),
            tags$br(), 
            tags$p(style="text-align:justify;font-si20pt",
                   strong("6) REGIÃO DE TRÂNSITO DE ALTAMIRA: Altamira, Anapu, Brasil Novo, Gurupá, Medicilândia, Placas, Porto de Moz, Senador José Porfírio, Uruará e Vitória do Xingu")),
           ),
           column(
             width=4,position="center",solidHeader = TRUE,
             tags$br(),  
             tags$p(style="text-align:justify;font-si20pt",
            strong("7) REGIÃO DE TRÂNSITO DE CAPANEMA: Augusto Corrêa, Bonito, Bragança, Cachoeira do Piriá, Capanema, Capitão Poço, Garrafão do Norte, NOva ESperança do Piriá, Nova Timboteua, Ourém, Peixe-Boi, Primavera, Quatipuru, Salinópolis, Santarém Novo, São João de Pirabas, Santa Luzia do Pará, Traquateua e Viseu")
             ),
            tags$br(),
            tags$p(style="text-align:justify;font-si20pt",
                   strong("8) REGIÃO DE TRÂNSITO DE PARAGOMINAS: Dom Eliseu, Ipixuna do Pará, Mãe do Rio, Paragominas e Ulianópolis")
            ),
            tags$br(),
            tags$p(style="text-align:justify;font-si20pt",
                   strong("9) REGIÃO DE TRÂNSITO DE TUCURUÍ: Breu Branco, Goianésia, Novo Repartimento, Pacajá e Tucuruí.")
            ),
            tags$br(),
            tags$p(style="text-align:justify;font-si20pt",
                   strong("10) REGIÃO DE TRÂNSITO DE Redenção: Àgua Azul do Norte, Bannach, Conceição do Araguaia, Cumaru do Norte, Floresta do Araguaia, Ourilândia do Norte, Pau D'arco, Redenção, Rio Maria, Santana do Araguaia, Santa Maria das Barreiras, São Félix do Xingu, Sapucaia, Tucumã e Xinguara")
            ),
            tags$br(),
            tags$p(style="text-align:justify;font-si20pt",
                   strong("11) REGIÃO DE TRÂNSITO DE ITAITUBA: Itaituba, Jacareacanga, Novo Progresso, Rurópolis e Trairão.")
            ),
            tags$br(),
            tags$p(style="text-align:justify;font-si20pt",
                   strong("12) REGIÃO DE TRÂNSITO DE PARAUAPEBAS: Cannãa dos Carajás, Curionópolis, Eldorado dos Carajás e Parauapebas.")
            ),
            tags$br(),
            tags$p(style="text-align:justify;font-si20pt",
                   strong("13) REGIÃO DE TRÂNSITO DE BREVES: Afuá, Anajás, Bagre, Breves, Chaves, Curralinho, Lengaço, Muaná e Portel.")
            )
           )
         ) 
),

tabPanel("SERVIÇOS VEÍCULOS", icon=icon("hospital"),
  fluidRow(
    column(
      width=4,position="center",solidHeader = TRUE,
      tags$br(), 
      tags$p(style="text-align:justify;font-si25pt",
             strong(" De acordo com a Portaria nº3883/2021/DG/DHCRV/CRV/DETRAN de 29 de outubro de 2021 somado a Portaria nº3383/2021/DG/DHCRV/CRV/DETRAN de 06 de dezembro de 2021, Estabelece procedimentos para serviços de Registro de Veículos, nas Unidades de Atendimento do DETRAN-PA."),
      ),
      tags$br(),
      tags$p(style="text-align:justify;font-si25pt",
             strong("O diretor geral do Departamento de Trânsito do Estado do Pará, no uso de suas atribuições legais, em especial ao constante do Art. 57, IV do anexo do Decreto nº 1.635 de 2005 que homologa o Regimento Interno do DETRAN-PA;"),
      ),
      tags$br(), 
      tags$p(style="text-align:justify;font-si25pt",
             strong(" Considerando o dispositivo nos Artigos 120, 123 e incisos e 124 e incisos da Lei nº9.503/1997 que institui o Código de Trânsito Brasileiro."),
      ),
      tags$br(),
      tags$p(style="text-align:justify;font-si25pt",
             strong("  Art. 1º - Determinar que nas CIRETRANS, os processos de:"),
      ),
      tags$br(),
      tags$p(style="text-align:justify;font-si20pt",
             strong("1) Expedição de 2ª via do CRV;;"),
             tags$br(),
             strong("2) Alteração de Características de veículos;"),
             tags$br(),
             strong("3) Inclusão ou Baixa de Reversa de Domínio;"),
             tags$br(),
             strong("4) Transferência de Propriedade;"),
             tags$br(),
             strong("5) Transferência de Jurisdição;"),
             tags$br(),
             strong("6) Mudança de Categoria;"),
             tags$br(),
             strong("7) Alteração de dados Cadastrais do Documento do Veículo;"),
             tags$br(),
             strong("8) Gravação ou Regravação de Chassi;"),
             tags$br(),
             strong("9) Regravação de Motor e Baixa do Veículo;")
      )
    )
  )
),









#===============================================================================#
tabPanel("SOFTWARE'S", icon=icon("computer"),
         fluidRow(
           column(width=4,
                  position="center",solidHeader = TRUE,
                  tags$br(),
                  tags$p(style="text-align: justify;font-si20pt",
                         strong("Para Criação do Anuário em Formato Web com Dasboard Interativos, foi Desenvolvido um script em Linguagem de Programação R-PROJECT Versão 4.2.2, no formato de Projeto de Software Livre de Código Aberto (open source), ou seja, pode ser utilizado sem custos de licença (R DEVELOPMENT CORE TEAM, 2022)")),
                  tags$br(),
                  tags$img(
                    id="foto2",
                    src="R.jpg",
                    controls="controls",
                    width=100,height=100),
                  tags$br(),
                  tags$a("Software R",
                         href = "https://cran.r-project.org/bin/windows/base/R-4.3.2-win.exe"),
                  tags$br(),
                  ),
           column(width=4,
                  position="center",
                  solidHeader = TRUE,
                  tags$br(),
                  tags$p(style="text-align: justify;font-si20pt",
                         strong("Foi utilizado um Ambiente de Desenvolvmento Integrado (IDE) Chamado Rstudio Versão 1.4.1.7, utilizando um Processo de Extração-Transformação-Carga(ETL) com uso de Várias bibliotecas (library), para o Ambiente Windows")),
                  tags$br(),
                  tags$img(
                    id="foto3",
                    src="RStudio.png",
                    controls="controls",
                    width=150,height=150),
                  tags$br(),
                  tags$a("RStudio",
                         href = "https://download1.rstudio.org/electron/windows/RStudio-2023.09.1-494.exe"),
                  tags$br(),
           )
         )
),
#===============================================================================#
tabPanel("MATERIAL E MÉTODOS", icon=icon("book"),
         fluidRow(
           column(width=4,
                  position="center",solidHeader = TRUE,
                  tags$br(), 
                  tags$br("Metodologia"), 
                  tags$br(),
                  tags$p(style="text-align:justify;font-si20pt",
                         strong("A Metodologia Adotada para o Planejamento e execução do Projeto foi apoiada na Estratégia de Proatividade e Parceria Desenvolvida pela GRSP (CARDITA e DI PIETRO, 2010).")),
                  tags$br(),
                  tags$p(style="text-align:justify;font-si20pt",
                         strong("A Estratégia de Proatividade e Parceria (EPP) consiste em um Modelo Desenvolvido para Tratar das questões de Segurança no Trânsito.")),
                  tags$br(),
                  tags$p(style="text-align:justify;font-si20pt",
                         strong(" As Etapas a Serem Desenvolvidas Durante Aplicação do Projeto são:")),
                  tags$br(),
                  tags$p(style="text-align:justify;font-si20pt",
                         strong("1) Articulação Intersetorial e Formação")),
                  tags$p(style="text-align: justify;font-si20pt",
                         strong("2) Qualificação, Integração e Análise de Dados")),
                  tags$p(style="text-align: justify;font-si20pt",
                         
                         strong("3) Ações Integradas de Segurança no Trânsito")),
                  tags$p(style="text-align: justify;font-si20pt",
                         strong("4) Monitoramento, Avaliação de Desenpenhp e Reconhecimento")),
                  tags$p(style="text-align: justify;font-si20pt",
                         strong("5) Revisão Geral Anual")),
                  tags$p(style="text-align: justify;font-si20pt",
                         strong("6) Renovação e Expansão"))
           )
         )
),
#===============================================================================#
tabPanel("CRÉDITOS", icon=icon("phone"),
         fluidRow(
           column(width=4,position="center",solidHeader = TRUE,
                  tags$br(),
                  tags$p(style="text-align: justify;font-si20pt",
                         strong("DEPARTAMENTO DE TRÂNSITO DO ESTADO DO PARÁ - DETRAN/PA")),
                  tags$p(style="text-align: justify;font-si20pt",
                         strong("RENATA MIRELA COELHO")),
                  tags$p(style="text-align: justify;font-si20pt",
                         strong("AVENIDA: AUGUSTO MONTENEGRO KM 03 S/N")),
                  tags$p(style="text-align: justify;font-si20pt",
                         strong("CEP: 66635-918 - PARQUE VERDE - BELÉM - PARÁ")),
                  tags$a("https://www.detran.pa.gov.br", 
                         href = "https://www.detran.pa.gov.br"),
                  tags$br(),
                  tags$br(),
                  tags$p(style="text-align: justify;font-si20pt",
                         strong("Esta publicação deve ser citada como: Departamento de Trânsito do Estado do Pará (DETRAN-PA), Anuário Estatístico de Acidentes de Trânsito, 2023 (LC/PUB.2023/1-P), Belém, 2023.")),
                  tags$br(),
                  tags$p(style="text-align: justify;font-si20pt",
                         strong("A autorização para a reprodução total ou parcial deste trabalho deve ser solicitada ao Departamento de Trânsito do Estado do Pará, Gerência de Análise e Estatística de Trânsito, gerest@detran.pa.gov.br. Os Estados membros das Nações Unidas e suas instituições governamentais podem reproduzir este trabalho sem autorização prévia. Solicita-se apenas que mencionem a fonte e informem ao DETRAN-PA de tal reprodução.")
                  ),
                  tags$br(),
                  
           ),
           column(
             width=4,
             position="center",
             solidHeader = TRUE,
             tags$br(),
             leafletOutput("mapa"),
           )
           
         )        
),
#===============================================================================#
tabPanel("SUGESTÕES",
         fluidRow(
           column(
             width=4,
             position="center",
             tags$br(),
             tags$p(style="text-align: justify;font-si20pt",
                    strong("Reclamações, sugestões, críticas e elogios relacionados ao Anuário
Estatístico de Acidentes de Trânsito do DETRAN-PA podem ser registrados na Gerência de Análise Estatística de Trânsito, por intermédio do ")),
tags$a("estatisticadetransito@detran.pa.gov.br", 
       href = "gerest@detran.pa.gov.br"),
           )
         )
)
          )
  ),
#===============================================================================#
tabItem(tabName="video1",
        tabBox(id="t2", 
               width=12,
               tabPanel("Video Institucional",icon=icon("video"),
                        fluidRow(
                          column(width=7, position="center",solidHeader = TRUE,
                                 tags$br("Projeto Strengthening Road Traffic Enforcement in Brazil"),
                                 tags$video(
                                   id = "videoID",
                                   type="video/mp4",
                                   src="video_detran.mp4",
                                   width= 700, height=550,
                                   controls="controls"
                                 ),
                                 tags$br() , 
                                 tags$a("Video: by Asdecom"),align="left"),
                          column(width=5,
                                 tags$br(),
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("O Departamento de Trânsito do Estado do Pará obteve o Projeto “Strengthening Road Traffic Enforcement
in Brazil” aprovado e financiado pela (United Road Safety Fund), com duração de 12 meses, se constituindo
o único selecionado do Brasil, que somado as propostas de alguns outros países, formam o conjunto de projetos
nacionais administrados pelo Fundo, coordenado e supervisionados por diversas Agências e Comissões
Regionais das Nações Unidas.")
                                 ),
tags$br(),
tags$p(style="text-align: justify;font-si20pt",
       strong("Concomitantemente, o Projeto Brasileiro é supervisionado pela Comissão Econômica das Nações
Unidas para América Latina e Caribe (CEPAL), coordenado e implementado pelo DETRAN-PA
em parceria com Conselho Estadual de Trânsito do Estado do Pará (CETRAN-PA), e tem como objetivo
contribuir para a redução de mortes e lesões no Trânsito através das atividades de Educação, Engenharia e
Fiscalização em nível Estadual."))))))),
#===============================================================================#


#===============================================================================#
tabItem(tabName = "anuario", fluidRow()),
tabItem(tabName = "microdados", fluidRow(microdados_ui("microdados"))),
tabItem(tabName = "socioeconomico", fluidRow(socioeconomico_ui("socioeconomico"))),
tabItem(tabName = "condicao_da_vitima", fluidRow(cond_vitima_ui("cond_vitima"))),
tabItem(tabName = "ocorrencias", fluidRow(ocorrencia_ui("ocorrencia"))),
tabItem(tabName = "custo_hospitalar", fluidRow(custo_hospitalar_ui("custo_hospitalar"))),
tabItem(tabName = "localizacao", fluidRow(localizacao_ui("localizacao"))),
tabItem(tabName = "pictogramas", fluidRow(pictogramas_ui("pictogramas"))),
tabItem(tabName = "taxas1", fluidRow(taxas1_ui("taxas1"))),
tabItem(tabName = "taxas2", fluidRow(taxas2_ui("taxas2"))),
tabItem(tabName = "taxas3", fluidRow(taxas3_ui("taxas3"))),
tabItem(tabName = "taxas4", fluidRow(taxas4_ui("taxas4")))
      )
#===============================================================================#
    ),
footer = dashboardFooter(
  left = tags$b("DETRAN-PA"), 
  right = tags$b("Belém-PA, 2024 v.1")
),
title = "Dashboard"
  ),  
#===============================================================================#
#Servidor 
server <- function(input, output, session) {
  
  # Incrementa o contador de acessos cada vez que o aplicativo é carregado
  #contador_acessos = 0
  #contador_acessos = contador_acessos + 1
  
  # Atualiza dinamicamente o valueBox com o contador de acessos
  output$contador_acessos <- renderValueBox({
    valueBox(
    value = contador_acessos,
      subtitle = "Número de Acessos",
      icon = icon("user"),
      color = "green"
    )
  })
  #===============================================================================#
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
  #===============================================================================#
  microdados_Server("microdados")
  socioeconomico_Server("socioeconomico")
  cond_vitima_Server("cond_vitima")
  ocorrencia_Server("ocorrencia")
  custo_hospitalar_Server("custo_hospitalar")
  localizacao_Server("localizacao")
  pictogramas_Server("pictogramas")
  taxas1_Server("taxas1")
  taxas2_Server("taxas2")
  taxas3_Server("taxas3")
  taxas4_Server("taxas4")
}
)
#===============================================================================#


#devtools::install_github("curso-r/basesCursoR")


