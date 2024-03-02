datashapetests <- function(df, ncols, nrows, uniquecol = NULL, nuniques = NULL) {
  expect_equal(ncol(df), ncols)
  expect_equal(nrow(df), nrows)
  if (!is.null(uniquecol)) {
    expect_equal(nrow(unique(df[uniquecol])), nuniques)
  }
}

test_that("country data is correctly shaped", {
  country <- get_data("country")
  datashapetests(country, 14, 232)
})

test_that("continent data is correctly shaped", {
  continent <- get_data("continent")
  datashapetests(continent, 9, 7)
})

# get_data_csv----------------------------
test_that("exported csv file is correctly shaped", {
  get_data_csv("country")
  csv <- read.csv("covid19.csv")
  datashapetests(csv, 14, 232)
})

test_that("exported csv file is correctly shaped", {
  get_data_csv("continent")
  csv <- read.csv("covid19.csv")
  datashapetests(csv, 9, 7)
})

# get_data_excel----------------------------
test_that("exported xlsx file is correctly shaped", {
  get_data_excel("country")
  excel <- readxl::read_excel("covid19.xlsx")
  datashapetests(excel, 14, 232)
})

test_that("exported xlsx file is correctly shaped", {
  get_data_excel("continent")
  excel <- readxl::read_excel("covid19.xlsx")
  datashapetests(excel, 9, 7)
})

# get_data_spss----------------------------
test_that("exported sav file is correctly shaped", {
  get_data_spss("country")
  spss <- haven::read_sav("covid19.sav")
  datashapetests(spss, 14, 232)
})

test_that("exported sav file is correctly shaped", {
  get_data_spss("continent")
  spss <- haven::read_sav("covid19.sav")
  datashapetests(spss, 9, 7)
})

# get_data_sas----------------------------
test_that("exported xpt file is correctly shaped", {
  get_data_sas("country")
  sas <- haven::read_xpt("covid19.xpt")
  datashapetests(sas, 14, 232)
})

test_that("exported xpt file is correctly shaped", {
  get_data_sas("continent")
  sas <- haven::read_xpt("covid19.xpt")
  datashapetests(sas, 9, 7)
})

# get_data_stata----------------------------
test_that("exported dta file is correctly shaped", {
  get_data_stata("country")
  stata <- haven::read_dta("covid19.dta")
  datashapetests(stata, 14, 232)
})

test_that("exported dta file is correctly shaped", {
  get_data_stata("continent")
  stata <- haven::read_dta("covid19.dta")
  datashapetests(stata, 9, 7)
})
