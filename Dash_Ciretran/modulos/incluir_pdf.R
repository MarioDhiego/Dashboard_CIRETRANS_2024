# Instale os pacotes, se necessário
# install.packages(c("shiny", "shinydashboard"))

# Instale os pacotes, se necessário
# install.packages(c("shiny", "shinyjs"))

# Carregue as bibliotecas
library(shiny)
library(shinyjs)

# Defina o UI do Shiny
ui <- fluidPage(
  titlePanel("Upload e Download de PDF"),
  sidebarLayout(
    sidebarPanel(
      fileInput("pdfFile", "Escolha um arquivo PDF"),
      downloadButton("downloadPDF", "Baixar PDF")
    ),
    mainPanel(
      tags$iframe(id = "pdfViewer", style = "height:600px; width:100%;", src = ""),
      useShinyjs(),  # Necessário para usar shinyjs
      extendShinyjs(text = "shinyjs.pdfViewer = function(url) { $('#pdfViewer').attr('src', url); }")
    )
  )
)

# Defina o servidor Shiny
server <- function(input, output, session) {
  # Quando um arquivo PDF é carregado
  observeEvent(input$pdfFile, {
    inFile <- input$pdfFile
    if (!is.null(inFile)) {
      # Salva o arquivo temporariamente
      tempFile <- tempfile(fileext = ".pdf")
      file.copy(inFile$datapath, tempFile, overwrite = TRUE)
      
      # Atualiza o visualizador de PDF
      shinyjs::js$pdfViewer(tempFile)
    }
  })
  
  # Quando o botão de download é clicado
  observeEvent(input$downloadPDF, {
    file.copy(input$pdfFile$datapath, "downloaded_file.pdf", overwrite = TRUE)
  })
}

# Execute o aplicativo Shiny
shinyApp(ui, server)
