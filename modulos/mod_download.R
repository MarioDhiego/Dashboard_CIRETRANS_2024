
#===============================================================================#
#1.1 Função de modulo de UI Donwload                                            ----

downdoload_ui <- function(id) {
  fluidPage(
    #useShinyjs(),
    #introjsUI(),
    dropMenu(
      padding = "15px",
      placement = "right",
      #autoWaiter(),
      actionButton(NS(id, "demo1down"),
                   tags$b("Download"),
                   icon = icon("download"),
                   style = "background-color: #286090; color: #fff;", 
                   class = "bg-success"
                   ),
      #tags$p("Formatos para Download:"),
      tags$p("Excel, CSV ou RData"),
      tags$p("Obrigado!"),
      tags$hr(),
      downloadButton(
        NS(id, "xlsx"),
        label = "Excel",
        icon = icon("file-excel"),
        class = "btn btn-success active"
        #class = "btn-lg btn-success"
      ),
      downloadButton(
        NS(id, "csv"),
        label = "CSV",
        icon = icon("file-csv"),
        class = "btn btn-warning active"
      ),
      downloadButton(
        NS(id, "rds"),
        label = "RData",
        type = "button",
        icon = icon("database"),
        class = "btn btn-secondary active", 
        datatoggle="popover"  
      )
      
     # ,downloadButton(
      #  NS(id, "pdf"),
      #  label = "PDF",
      #  type = "button",
      #  icon = icon("filepdf"),
      #  class = "btn btn-danger", 
      #  datatoggle="popover"
      #)
      
      
      
    )
  )
}







#===============================================================================#

#===============================================================================#
# 1.2 Função de modulo de servidor                                              ----
download_Server <- function(id,df,nome) {
  moduleServer(id, function(input, output, session) {
    
output$xlsx <- downloadHandler(
  filename = function() {
    paste0(nome,".xlsx")
      },
      content = function(file) {
        write.xlsx(df, file)
      }
    )
#===============================================================================#
    
#===============================================================================#
output$csv <-   downloadHandler(
      filename = function() {
        paste0(nome,".csv")
      },
      content = function(file) {
        write.csv(df, file)
      }
    )
#===============================================================================#   

#===============================================================================#
output$rds <-  downloadHandler(
  filename = function() {
    paste0(nome,".rds")
      },
  content = function(file) {
    write_rds(df, file)
      }
    )

#output$pdf <-  downloadHandler(
#  filename = function() {
#    paste0(nome,".pdf")
#  },
#  content = function(file) {
#    write.pdf(df, file)
#  }
#)


  }
)
  
  
  
}
#===============================================================================#

