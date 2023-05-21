#' get_data_csv()
#'
#' scraping information of today's covid19
#' and return csv file
#'
#' @examples
#' get_data_csv()
#'
#' @export
get_data_csv <- function(){
  get_data()

  write.csv(total,"csv/total_covid19.csv")
  write.csv(cont, "csv/cont_covid19.csv")
  write.csv(corona, "csv/covid19.csv")
}
