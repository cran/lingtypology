% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/url.lang.R
\name{url.lang}
\alias{url.lang}
\title{Make a url-link to glottolog page for a language}
\usage{
url.lang(x, popup = "")
}
\arguments{
\item{x}{A character vector of languages (can be written in lower case)}

\item{popup}{character vector of strings that will appear in pop-up window of the function map.feature}
}
\description{
Takes any vector of languages and returns links to glottolog pages.
}
\examples{
url.lang('Korean')
url.lang(c('Gangou', 'Hachijo', 'West Circassian', 'Ganai'))
}
\seealso{
\code{\link{aff.lang}}, \code{\link{area.lang}}, \code{\link{country.lang}}, \code{\link{gltc.lang}}, \code{\link{iso.lang}}, \code{\link{lat.lang}}, \code{\link{long.lang}}, \code{\link{subc.lang}}
}
\author{
George Moroz <agricolamz@gmail.com>
}
