% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/afbo.feature.R
\name{afbo.feature}
\alias{afbo.feature}
\title{Download AfBo data}
\usage{
afbo.feature(features = "all", na.rm = TRUE,
  glottolog.source = "modified")
}
\arguments{
\item{features}{A character vector that define with an affix functions from AfBo (e. g. "all", "adjectivizer", "focus").}

\item{na.rm}{Logical. If TRUE function removes all languages not available in lingtypology database. By default is TRUE.}

\item{glottolog.source}{A character vector that define which glottolog database is used: 'original' or 'modified' (by default)}
}
\description{
This function downloads data from AfBo (http://afbo.info) and changes language names to the names from lingtypology database. You need the internet connection.
}
\examples{
# afbo.feature()
# afbo.feature(c("adjectivizer", "focus"))
}
\seealso{
\code{\link{autotyp.feature}}, \code{\link{phoible.feature}}, \code{\link{sails.feature}}, \code{\link{wals.feature}}
}
\author{
George Moroz <agricolamz@gmail.com>
}