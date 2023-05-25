country <- get_data("country")
continent <- get_data("continent")

datashapetests = function(df, ncols, nrows, uniquecol = NULL, nuniques = NULL) {
  expect_equal(ncol(df), ncols)
  expect_equal(nrow(df), nrows)
  if (!is.null(uniquecol)) {
    expect_equal(nrow(unique(df[uniquecol])), nuniques)
  }
}

test_that("country data is correctly shaped", {
  datashapetests(country, 15, 232)
})

test_that("ccontinent data is correctly shaped", {
  datashapetests(continent, 15, 7)
})
