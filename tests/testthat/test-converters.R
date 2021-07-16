test_that("multiplication works", {
  data <- load_parquet("test-data/sample_peaks.parquet")
  actual <- rcx_aplcms_to_xmsannotator(data)
  expected <- readRDS("test-data/expected/rcx_aplcms_to_xmsannotator.rda")

  expect_true(dplyr::all_equal(actual, expected))
})
