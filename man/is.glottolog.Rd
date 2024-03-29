% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/is.glottolog.R
\name{is.glottolog}
\alias{is.glottolog}
\title{Are these languages in glottolog?}
\usage{
is.glottolog(x, response = FALSE)
}
\arguments{
\item{x}{A character vector of languages (can be written in lower case)or ISO codes}

\item{response}{logical. If TRUE, when language is absent, return warnings with a possible candidates.}
}
\description{
Takes any vector of languages or ISO codes and returns a logical vector.
}
\examples{
is.glottolog(c('Kabardian', 'Russian'))
is.glottolog('Buyaka')

\dontrun{
# Add warning message with sugestions
is.glottolog(c('Adyge', 'Russian'), response = TRUE)
# > FALSE TRUE
# Warning message:
# In is.glottolog(c('Kabardia', 'Russian'), response = TRUE) :
# Language Kabardia is absent in our version of the Glottolog database.
# Did you mean Kabardian, Greater Kabardian?
}
}
\author{
George Moroz <agricolamz@gmail.com>
}
