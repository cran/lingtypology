## ----include=FALSE------------------------------------------------------------
library(lingtypology)
knitr::opts_chunk$set(message= FALSE, eval=FALSE)

## -----------------------------------------------------------------------------
# df <- wals.feature(c("1a", "20a"))
# head(df)
# map.feature(df$language,
#             features = df$`1a`,
#             latitude = df$latitude,
#             longitude = df$longitude,
#             label = df$language,
#             title = "Consonant Inventories")

## -----------------------------------------------------------------------------
# df <- grambank.feature(c("gb026", "gb042"))
# head(df)
# map.feature(df$grambank.name,
#             features = df$`GB042`,
#             latitude = df$latitude,
#             longitude = df$longitude,
#             label = df$language,
#             title = "Is there productive overt morphological singular marking on nouns?")

## -----------------------------------------------------------------------------
# df <- autotyp.feature(c('Has Gender', 'Has Numeral Classifiers'))
# head(df)
# map.feature(df$language,
#             features = df$HasNumeralClassifiers,
#             label = df$language_for_lingtypology,
#             title = "Presence of Numeral Classifiers")

## -----------------------------------------------------------------------------
# df <- phoible.feature(source = "UPSID")
# head(df)

## -----------------------------------------------------------------------------
# df <- afbo.feature(c("adjectivizer", "adverbializer"))
# head(df)
# map.feature(df$Recipient.name,
#             features = df$adjectivizer,
#             label = df$Recipient.name,
#             title = "Borrowed adjectivizer affixes")

## -----------------------------------------------------------------------------
# df <- sails.feature(features = "ics10")
# head(df)
# map.feature(df$language,
#             features = df$ics10_description,
#             longitude = df$longitude,
#             latitude = df$latitude,
#             label = df$language,
#             title = "Are there numeral classifiers?")

## ----eval = FALSE-------------------------------------------------------------
# df <- abvd.feature(c(292, 7))
# head(df)
# new_df <- df[df$word == "hand",]
# map.feature(new_df$language,
#             features = new_df$item,
#             label = new_df$language)

## -----------------------------------------------------------------------------
# df <- uralex.feature()
# df <- df[df$uralex_mng == "crush",]
# 
# map.feature(df$language,
#             label = df$item,
#             title = "crush")

