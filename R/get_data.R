#' get_data()
#'
#' scraping information of today's covid19
#' and seperate continent, country and total data
#'
#' @examples
#' get_data("total")
#'
#' @import rvest
#' @import dplyr
#' @export
get_data <- function(id) {
  url <- "https://www.worldometers.info/coronavirus/#main_table"
  page <- read_html(url)

  data <- page |>
    html_node(".main_table_countries_div") |>
    html_node("table") |>
    html_table(fill = TRUE) |>
    as_tibble()

  data <- data[, 2:16]
  colnames(data)[1] <- "Country"
  colnames(data)[9] <- "Critical"

  data[, c(1, 15)] -> world
  numeric.data <- apply(data[, 2:14], 2, function(x) as.numeric(gsub(",", "", x))) |>
    as_tibble()
  cbind(world, numeric.data) -> corona.data

  total <- corona.data[240:247, ]
  cont <- corona.data[1:7, ]
  corona <- corona.data |>
    anti_join(cont) |>
    anti_join(total)

  if (id == "total") {
    data <- total
  } else if (id == "continent") {
    data <- cont
  } else if (id == "country") {
    data <- corona
  } else {
    cat("there's no option >>", id)
  }

  return(data)
}
