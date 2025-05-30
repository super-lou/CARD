% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/baseflow.R
\name{compute_VolSnowmelt}
\alias{compute_VolSnowmelt}
\title{Compute Total Snowmelt Volume}
\usage{
compute_VolSnowmelt(Q, d = 5, w = 0.9, a = 0.925, passes = 3, method = "Wal")
}
\value{
Numeric value of total snowmelt volume in cubic hectometers (hm³).
}
\description{
Calculates the total snowmelt volume (in hm³) from baseflow separation,
assuming baseflow represents snowmelt contributions to streamflow.
}
\details{
Computes:
\deqn{VolSnowmelt = \frac{\sum BF \times 86400}{10^6}}
Where:
\itemize{
\item BF is baseflow from \code{\link{BFS}}
\item 86400 converts seconds to days
\item 10^6 converts m³ to hm³
}
}
\examples{
Q <- c(10,15,20,18,12,8,5,7,9,12) # Sample streamflow (m³/s)
compute_VolSnowmelt(Q) # Returns volume in hm³

}
\seealso{
\code{\link{BFS}} for baseflow separation method
}
