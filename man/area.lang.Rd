% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/area.lang.R
\name{area.lang}
\alias{area.lang}
\title{Get macro area by language}
\usage{
area.lang(x)
}
\arguments{
\item{x}{character vector of the languages (can be written in lower case)}
}
\description{
Takes any vector of languages and return macro area.
}
\examples{
area.lang('Adyghe')
area.lang(c('Adyghe', 'Aduge'))
}
\seealso{
\code{\link{aff.lang}}, \code{\link{iso.lang}}, \code{\link{lat.lang}}, \code{\link{long.lang}}
}
\author{
George Moroz <agricolamz@gmail.com>
}
