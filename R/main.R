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
      data <- data[, 2:15]
      colnames(data)[1] <- "Country"
      colnames(data)[9] <- "Critical"
      colnames(data)[10] <- "TotalCasesPer1M"
      colnames(data)[11] <- "TotalDeathsPer1M"
      colnames(data)[13] <- "TotalTestsPer1M"

      data[, c(1, 14)] -> world
      numeric.data <- apply(data[, 2:14], 2, function(x) as.numeric(gsub(",", "", x))) |>
        as_tibble()
      cbind(world[,1], numeric.data) -> corona.data
    })

    total <- corona.data[240:247, ]
    cont <- corona.data[1:7, 2:10]
    corona <- corona.data[8:239,]

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
#' and return .csv file
#'
#' @param option character. is country or continent
#'
#' @examples
#' get_data_csv("continent")
#' @importFrom utils read.csv
#' @export
get_data_csv <- function(option) {
  data <- get_data(option)
  utils::write.csv(data, "covid19.csv", row.names = FALSE)
}


#' get_data_excel()
#'
#' scraping information of today's covid19
#' and return .xlsx file
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


#' get_data_spss()
#'
#' scraping information of today's covid19
#' and return .sav file
#'
#' @param option character. is country or continent
#'
#' @examples
#' get_data_spss("country")
#' @importFrom haven write_sav
#'
#' @export
get_data_spss <- function(option) {
  data <- get_data(option)
  haven::write_sav(data, path = "covid19.sav")
}


#' get_data_sas()
#'
#' scraping information of today's covid19
#' and return .sas file
#'
#' @param option character. is country or continent
#'
#' @examples
#' get_data_sas("continent")
#' @importFrom haven write_xpt
#'
#' @export
get_data_sas <- function(option) {
  data <- get_data(option)
  haven::write_xpt(data, "covid19.xpt")
}



#' get_data_stata()
#'
#' scraping information of today's covid19
#' and return .stata file
#'
#' @param option character. is country or continent
#'
#' @examples
#' get_data_stata("country")
#' @importFrom haven write_dta
#'
#' @export
get_data_stata <- function(option) {
  data <- get_data(option)
  haven::write_dta(data, "covid19.dta")
}
