#' get_data_excel()
#'
#' scraping information of today's covid19
#' and return xlsx file
#'
#' @examples
#' get_data_excel()
#'
#' @import writexl
#' @export
get_data_excel <- function(){
  get_data()

  write_xlsx(total, path = "data/total_covid19.xlsx")
  write_xlsx(cont, path = "data/cont_covid19.xlsx")
  write_xlsx(corona, path = "data/covid19.xlsx")
}
