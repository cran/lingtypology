% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/autotyp.feature.R
\name{autotyp.feature}
\alias{autotyp.feature}
\title{Download AUTOTYP data}
\usage{
autotyp.feature(features, na.rm = TRUE)
}
\arguments{
\item{features}{A character vector that define with a feature names from AUTOTYP.}

\item{na.rm}{Logical. If TRUE function removes all languages not available in lingtypology database. By default is TRUE.}
}
\description{
This function downloads data from AUTOTYP (https://github.com/autotyp/autotyp-data#the-autotyp-database) and changes language names to the names from lingtypology database. You need the internet connection.
}
\examples{
# autotyp.feature(c('Has Gender', 'Has Numeral Classifiers'))
}
\seealso{
\code{\link{abvd.feature}}, \code{\link{afbo.feature}}, \code{\link{bivaltyp.feature}}, \code{\link{eurasianphonology.feature}}, \code{\link{oto_mangueanIC.feature}}, \code{\link{phoible.feature}}, \code{\link{sails.feature}}, \code{\link{soundcomparisons.feature}}, \code{\link{uralex.feature}}, \code{\link{valpal.feature}}, \code{\link{vanuatu.feature}}, \code{\link{wals.feature}}

\code{\link{abvd.feature}}, \code{\link{afbo.feature}}, \code{\link{oto_mangueanIC.feature}}, \code{\link{phoible.feature}}, \code{\link{sails.feature}}, \code{\link{uralex.feature}}, \code{\link{valpal.feature}}, \code{\link{wals.feature}}
}
