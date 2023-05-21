#' get_data_excel()
#'
#' scraping information of today's covid19
#' and return xlsx file
#'
#' @examples
#' get_data_excel("total")
#'
#' @import writexl
#' @import covid19today
#' @export
get_data_excel <- function(id) {
  data <- get_data(id)
  write_xlsx(data, path = "covid19.xlsx")
}
