#' get_data_csv()
#'
#' scraping information of today's covid19
#' and return csv file
#'
#' @examples
#' get_data_csv("total")
#'
#' @import covid19today
#'
#' @export
get_data_csv <- function(id) {
  data <- get_data(id)
  write.csv(data, "covid19.csv")
}
