library(lingtypology)
context("Tests for iso.gltc function")

df <- data.frame(my_langs = c("ady", "udi"), stringsAsFactors = FALSE)

test_that("iso.gltc", {
  skip_on_cran()
  expect_equal(gltc.iso("ady"), c(ady = "adyg1241"))
  expect_equal(gltc.iso(c("ady", "udi")), c(ady = "adyg1241", udi = "udii1243"))
  expect_equal(gltc.iso(df), c(my_langs1 = "adyg1241", my_langs2 = "udii1243"))
})
