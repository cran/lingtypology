% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/polygon.points_fd.R
\name{polygon.points_fd}
\alias{polygon.points_fd}
\title{Get polygons from fixed distance circles around coordinates}
\usage{
polygon.points_fd(latitude, longitude, width)
}
\arguments{
\item{latitude}{numeric vector of latitudes}

\item{longitude}{numeric vector of longitudes}

\item{width}{radius for creating poligons around points}
}
\description{
This function is based on this answer: https://www.r-bloggers.com/merging-spatial-buffers-in-r/
}
