% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_bipartite.R
\name{plot_bipartite}
\alias{plot_bipartite}
\title{Plot a bipartite network, colour coding individual links according to
  whether they are stronger or weaker than expected under the null model}
\usage{
plot_bipartite(nullnet, signif.level = 0.95, edge.cols = c("#67A9CF",
  "#F7F7F7", "#EF8A62"), ...)
}
\arguments{
\item{nullnet}{An object of class "nullnet" from \code{generate_null_net}}

\item{signif.level}{An optional value specifying the threshold used for
testing for 'significant' deviations from the null model.  Defaults to 0.95}

\item{edge.cols}{An optional character vector of length three specifying
the colours for links in the bipartite plot: they should represent
interactions that are weaker than expected, consistent with the null model
and stronger than expected in that order.  The default is a colourblind
friendly blue, white and red scheme, using colorbrewer's Red-Blue
colour scheme (Brewer 2017).}

\item{...}{Other arguments to be supplied to \code{bipartite}'s
\code{plotweb} function.}
}
\description{
Acts as a wrapper for the \code{bipartite} package's
  \code{\link[bipartite]{plotweb}} function (Dormann \emph{et al}., 2008),
  colour coding the links in the familiar bipartite plots according to
  whether they are stronger, weaker or consistent with the null model.
}
\details{
Extensive options can be passed to \code{\link[bipartite]{plotweb}}
  to customise the network plot beyond the colour coding of the links. See
  the appropriate help file in the bipartite package for details.
}
\examples{

# Run the null model
set.seed(1234)
sil.null <- generate_null_net(Silene[, 2:7], Silene.plants[, 2:6], sims = 10,
                              c.samples = Silene[, 1],
                              r.samples = Silene.plants[, 1])

# Basic plot
plot_bipartite(sil.null)

# With alternative colour scheme and nodes width in the lower level proportional
#  to mean floral abundance
mean.abunds <- colMeans(Silene.plants[, 2:6])
plot_bipartite(sil.null, signif.level = 0.95, edge.cols = c("#67a9cf",
               "#F7F7F7", "#ef8a62"), low.abun = mean.abunds,
               abuns.type = "independent", low.abun.col = "black",
               high.abun.col = "black", high.lablength = 0, low.lablength = 0)

}
\references{
Brewer, C.A. (2017) \url{http://www.ColorBrewer.org}

  Dormann, C.F., Gruber B. & Frund, J. (2008). Introducing the bipartite
  package: analysing ecological networks. \emph{R news}, \strong{8}, 8-11.

  Vaughan, I.P., Gotelli, N.J., Memmott, J., Pearson, C.E., Woodward, G. &
  Symondson, W.O.C. (2018) econullnetr: an R package using null models to
  analyse the structure of ecological networks and identify resource
  selection. \emph{Methods in Ecology and Evolution}, \strong{9}, 728--733.
}
\seealso{
\code{\link{generate_null_net}}, \code{\link{bipartite_stats}},
  \code{\link[bipartite]{plotweb}}
}

