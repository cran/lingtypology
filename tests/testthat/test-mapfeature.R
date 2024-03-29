library(lingtypology)

df <-  data.frame("Abkhaz", stringsAsFactors = FALSE)
map <- map.feature("Abkhaz")
map3 <- map.feature(data.frame("Abkhaz", stringsAsFactors = FALSE))

test_that("map.feature source", {
  skip_on_cran()
  expect_equal(exists("map"), TRUE)
  expect_equal(exists("map"), TRUE)
  expect_equal(exists("map3"), TRUE)
})

test_that("map.feature no coordinates", {
  skip_on_cran()
  expect_warning(map.feature(c("Yugul", "Kabardian", "Selako")),
                 "There is no coordinates for languages Yugul, Selako")
})

test_that("map.feature no data to map", {
  skip_on_cran()
  expect_error(
    expect_warning(
      map.feature("bla-bla-bla"),
      "Languoid bla-bla-bla is absent in our version of the Glottolog database. Did you mean Blablanga?",
      ignore.case = T
    ),
    "There is no data to map"
  )
})

map_coord <- map.feature("Abkhaz", latitude = 43, longitude = 57)

test_that("map.feature coordinates", {
  skip_on_cran()
  expect_equal(map$x$limits[[1]][1], unname(lat.lang("Abkhaz")))
  expect_equal(map$x$limits[[2]][1], unname(long.lang("Abkhaz")))
  expect_equal(map_coord$x$limits[[1]][1], 43)
  expect_equal(map_coord$x$limits[[2]][1], 57)
})

density1 <- map.feature(
  circassian$language,
  circassian$language,
  longitude = circassian$longitude,
  latitude = circassian$latitude,
  density.estimation = circassian$language,
  density.width = 0.15
)

density2 <- map.feature(
  circassian$language,
  circassian$language,
  longitude = circassian$longitude,
  latitude = circassian$latitude,
  density.estimation = circassian$language,
  density.points = FALSE,
  density.width = 0.15
)

density3 <- map.feature(
  circassian$language,
  circassian$language,
  longitude = circassian$longitude,
  latitude = circassian$latitude,
  density.estimation = circassian$language,
  density.control = TRUE,
  density.width = 0.15
)

density4 <- map.feature(
  circassian$language,
  circassian$language,
  longitude = circassian$longitude,
  latitude = circassian$latitude,
  density.estimation = circassian$language,
  density.method = "kernal",
  density.control = TRUE,
  density.width = c(1.9, 1.2)
)

test_that("map.feature density estimation", {
  skip_on_cran()
  expect_equal(exists("density1"), TRUE)
  expect_equal(exists("density2"), TRUE)
  expect_equal(exists("density3"), TRUE)
})

map_image <-
  map.feature("Tabasaran", image.url = "https://goo.gl/Ycn6tJ")

test_that("map.feature images", {
  skip_on_cran()
  expect_equal(map_image$x$calls[[4]]$args[[3]]$iconUrl$data,
               "https://goo.gl/Ycn6tJ")
})

df <-
  data.frame(
    lang = c("West Circassian", "Kabardian", "Polish", "Russian", "Bulgarian"),
    feature = c("polysynthetic",
                "polysynthetic", "fusion", "fusion", "fusion"),
    popup = c("Circassian", "Circassian", "Slavic",
              "Slavic", "Slavic"),
    stringsAsFactors = FALSE
  )
map_stroke <-
  map.feature(df$lang, df$feature, df$popup, stroke.features = df$popup)
map_stroke2 <-
  map.feature(
    df$lang,
    df$feature,
    df$popup,
    stroke.features = df$popup,
    stroke.color = c("blue",
                     "green")
  )

test_that("map.feature stroke feature", {
  skip_on_cran()
  expect_equal(length(map_stroke$x$calls), 9)
  expect_equal(
    map_stroke2$x$calls[[4]]$args[[6]]$fillColor,
    c("#0000FF", "#0000FF", "#00FF00",
      "#00FF00", "#00FF00")
  )
})

map_colorless <- map.feature(c("Tabasaran", "Kabardian"))
map_lang_colors <- map.feature(c("Tabasaran", "Kabardian"),
                               color = "navy")
map_colors <- map.feature(
  c("Tabasaran", "Kabardian"),
  features = c("a", "b"),
  color = c("navy", "yellowgreen")
)
map_colors2 <- map.feature(
  c("Tabasaran", "Kabardian"),
  features = c(1, 2),
  color = c("navy", "yellowgreen")
)
map_colorless2 <- map.feature(c("Tabasaran", "Kabardian"),
                              features = c(1, 2))

test_that("map.feature colors", {
  skip_on_cran()
  expect_equal(map_colors$x$calls[[3]]$args[6][[1]]$fillColor, c("#000080", "#9ACD32"))
  expect_equal(map_colors2$x$calls[[3]]$args[6][[1]]$fillColor, c("#000080", "#9ACD32"))
  expect_equal(map_colorless$x$calls[[3]]$args[6][[1]]$fillColor,
               c("#3B8BC6", "#3B8BC6"))
  expect_equal(map_colorless2$x$calls[[3]]$args[6][[1]]$fillColor,
               c("#F7FCFD", "#4D004B"))
  expect_equal(map_lang_colors$x$calls[[3]]$args[6][[1]]$fillColor,
               c("navy", "navy"))
  expect_equal(
    map_stroke[["x"]][["calls"]][[4]][["args"]][[6]][["color"]],
    c("#FFFFFF", "#FFFFFF", "#000000", "#000000", "#000000")
  )
})

map_tiles <-
  map.feature("Kabardian",
              tile = c("OpenStreetMap.BlackAndWhite", "Thunderforest.OpenCycleMap"))
map_tiles_control <-
  map.feature(
    "Kabardian",
    tile = c("OpenStreetMap.BlackAndWhite", "Thunderforest.OpenCycleMap"),
    control = TRUE
  )

test_that("map.feature tiles", {
  skip_on_cran()
  expect_equal(
    c(map_tiles$x$calls[[2]]$args[[1]], map_tiles$x$calls[[3]]$args[[1]]),
    c(
      "OpenStreetMap.BlackAndWhite",
      "Thunderforest.OpenCycleMap"
    )
  )
  expect_equal(
    c(
      map_tiles_control$x$calls[[2]]$args[[1]],
      map_tiles_control$x$calls[[3]]$args[[1]]
    ),
    c(
      "OpenStreetMap.BlackAndWhite",
      "Thunderforest.OpenCycleMap"
    )
  )
  expect_warning(
    map.feature(
      "Kabardian",
      tile = c(
        "OpenStreetMap.BlackAndWhite",
        "Thunderforest.OpenCycleMap"
      ),
      tile.name = c("first")
    ),
    "number of tile names \\(tile.name argument\\) is less than number of tiles \\(tile argument\\)"
  )
  expect_warning(
    map.feature(
      "Kabardian",
      tile = c("OpenStreetMap.BlackAndWhite"),
      tile.name = c("first", "second")
    ),
    'number of tile names \\(tile.name argument\\) is less than number of tiles \\(tile argument\\)'
  )
})

map_control <- map.feature(c("Kabardian", "Russian", "Polish"),
                           control = c("a", "b", "b"))

test_that("control", {
  skip_on_cran()
  expect_equal(map_control$x$calls[[4]]$method, "addLayersControl")
})

map_minimap <- map.feature(c("Kabardian", "Russian"), minimap = TRUE)

test_that("map.feature minimap", {
  skip_on_cran()
  expect_equal(map_minimap$x$calls[[5]]$method, "addMiniMap")
})

test_that("map.feature scale bar", {
  skip_on_cran()
  expect_equal(map_minimap$x$calls[[4]]$method, "addScaleBar")
})

map_label <-
  map.feature(c("Kabardian", "Russian"), label = c("a", "b"))
test_that("map.feature labels", {
  skip_on_cran()
  expect_equal(map_label$x$calls[[3]]$args[11], list(c("a", "b")))
})

map_label_emph <-
  map.feature(
    c("Kabardian", "Russian"),
    label = c("a", "b"),
    label.emphasize = list(1, "red")
  )
test_that("map.feature emphasized labels", {
  skip_on_cran()
  expect_equal(map_label_emph$x$calls[[4]]$args[11], list(c("a")))
  expect_equal(map_label_emph$x$calls[[4]]$args[12][[1]]$style$color, "red")
})

map_zoom <-
  map.feature(c("Kabardian", "Russian"), zoom.level = 4)
test_that("map.feature emphasized labels", {
  expect_equal(map_zoom$x$setView[[2]], 4)
})

map_rectangular <-
  map.feature(
    circassian$language,
    circassian$language,
    longitude = circassian$longitude,
    latitude = circassian$latitude,
    rectangle.lng = c(42.7, 45),
    rectangle.lat = c(42.7, 44.3),
    rectangle.color = "blue"
  )

test_that("map.feature rectangular", {
  skip_on_cran()
  expect_equal(map_rectangular$x$calls[[3]]$method, "addRectangles")
})

map_minicharts <-
  map.feature(
    languages = phonological_profiles$language,
    minichart.data = phonological_profiles[, c("vowels", "consonants")],
    minichart = "pie"
  )

test_that("map.feature minicharts", {
  skip_on_cran()
  expect_equal(exists("map_minicharts"), TRUE)
})

line <- map.feature(
  circassian$language,
  circassian$language,
  longitude = circassian$longitude,
  latitude = circassian$latitude,
  line.lng = c(43, 45),
  line.lat = c(43, 44)
)

line.logit <- map.feature(
  circassian$language,
  circassian$language,
  longitude = circassian$longitude,
  latitude = circassian$latitude,
  line.type = "logit"
)

test_that("map.feature lines", {
  skip_on_cran()
  expect_equal(line$x$calls[[3]]$method, "addPolylines")
  expect_equal(line.logit$x$calls[[3]]$method, "addPolylines")
  expect_warning(
    map.feature(
      circassian$language,
      circassian$dialect,
      longitude = circassian$longitude,
      latitude = circassian$latitude,
      line.type = "logit"
    ),
    "If you want to plot the decision boundary of the logistic regression, the argument features should contain two levels."
  )
})

graticule <- map.feature(c("Russian", "Kabardian"), graticule = 5)

test_that("map.feature graticule", {
  skip_on_cran()
  expect_equal(graticule$x$calls[[3]]$method, "addSimpleGraticule")
})


shape1 <- map.feature(df$lang,
                      df$feature,
                      shape = TRUE)
shape2 <- map.feature(df$lang,
                      df$feature,
                      shape = c("f", "p"))
shape3 <- map.feature(df$lang,
                      df$feature,
                      shape = c("p", "p", "f", "f", "f"))

test_that("map.feature shape", {
  skip_on_cran()
  expect_equal(shape1$x$calls[[3]]$args[[11]], c("▴", "▴", "●", "●", "●"))
  expect_equal(shape2$x$calls[[3]]$args[[11]], c("p", "p", "f", "f", "f"))
  expect_equal(shape3$x$calls[[3]]$args[[11]], c("p", "p", "f", "f", "f"))
  expect_warning(map.feature(lang.aff("Slavic")[-3],
                           lang.aff("Slavic")[-3],
                           shape = TRUE),
               'The argument "shape = TRUE" works fine only with 6 or less levels in "features" variable. List your own shapes in "shape" argument')
})


map_none_tile <- map.feature("Kabardian", tile = "none")

test_that("map without a tile", {
  skip_on_cran()
  expect_equal(exists("map_none_tile"), TRUE)
})

