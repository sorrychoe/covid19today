#' get_data()
#'
#' scraping information of today's covid19
#' and seperate continent, country and total data
#'
#' @param option character. is country or continent
#'
#' @examples
#' data <- get_data("country")
#' head(data)
#' @import rvest
#' @import dplyr
#' @export
get_data <- function(option) {
  url <- "https://www.worldometers.info/coronavirus/#main_table"
  page <- read_html(url)

  data <- page |>
    html_node(".main_table_countries_div") |>
    html_node("table") |>
    html_table(fill = TRUE) |>
    as_tibble()

  suppressWarnings({
    data <- data[, 2:16]
    colnames(data)[1] <- "Country"
    colnames(data)[9] <- "Critical"

    data[, c(1, 15)] -> world
    numeric.data <- apply(data[, 2:14], 2, function(x) as.numeric(gsub(",", "", x))) |>
      as_tibble()
    cbind(world, numeric.data) -> corona.data
  })

  total <- corona.data[240:247, ]
  cont <- corona.data[1:7, ]
  corona <- corona.data |>
    anti_join(cont) |>
    anti_join(total) |>
    suppressMessages()

   if (option == "continent") {
    data <- cont
  } else if (option == "country") {
    data <- corona
  } else {
    cat("there's no option >>", option)
    data <- NULL
  }
  return(data)
}

#' get_data_csv()
#'
#' scraping information of today's covid19
#' and return csv file
#'
#' @param option character. is country or continent
#'
#' @examples
#' get_data_csv("continent")
#' @importFrom utils read.csv
#' @export
get_data_csv <- function(option) {
  data <- get_data(option)
  utils::write.csv(data, "covid19.csv")
}


#' get_data_excel()
#'
#' scraping information of today's covid19
#' and return xlsx file
#'
#' @param option character. is country or continent
#'
#' @examples
#' get_data_excel("continent")
#' @importFrom writexl write_xlsx
#'
#' @export
get_data_excel <- function(option) {
  data <- get_data(option)
  writexl::write_xlsx(data, path = "covid19.xlsx")
}
