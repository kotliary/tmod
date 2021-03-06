% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/limma.R
\name{tmodLimmaDecideTests}
\alias{tmodLimmaDecideTests}
\title{Up- and down-regulated genes in modules based on limma object}
\usage{
tmodLimmaDecideTests(f, genes, lfc.thr = 0.5, pval.thr = 0.05,
  filter.unknown = FALSE, adjust.method = "BH", mset = "all")
}
\arguments{
\item{f}{result of linear model fit produced by limma functions lmFit and eBayes}

\item{genes}{Either the name of the column in f$genes which
contains the gene symbols corresponding to the gene set collection used, or
a character vector with gene symbols}

\item{lfc.thr}{log fold change threshold}

\item{pval.thr}{p-value threshold}

\item{filter.unknown}{If TRUE, modules with no annotation will be omitted}

\item{adjust.method}{method used to adjust the p-values for multiple testing. See p.adjust(). Default:BH.}

\item{mset}{Which module set to use (see tmodUtest for details)}
}
\value{
A list with as many elements as there were coefficients in f. Each element of the list is a data 
frame with the columns "Down", "Zero" and "Up" giving the number of the
down-, not- and up-regulated genes respectively. Rows of the data frame
correspond to module IDs. The object can directly be used in
tmodPanelPlot as the pie parameter.
library(limma)
data(Egambia)
design <- cbind(Intercept=rep(1, 30), TB=rep(c(0,1), each= 15))
fit <- eBayes( lmFit(Egambia[,-c(1:3)], design))
ret <- tmodLimmaTest(fit, Egambia$GENE_SYMBOL)
pie <- tmodLimmaDecideTests(fit, Egambia$GENE_SYMBOL)
tmodPanelPlot(ret, pie=pie)
}
\description{
For each module in mset and for each coefficient in f$coefficients, this
function calculates the numbers of significantly up- and down-regulated genes.
}
\details{
For an f object returned by eBayes(), tmodLimmaDecideTests considers every
coefficient in this model (every column of f$coefficients). For each such
coefficient, tmodLimmaDecideTests calculates, for each module, the number
of genes which are up- or down-regulated.

In short, tmodLimmaDecideTests is the equivalent of tmodDecideTests, but
for limma objects returned by eBayes().
}
\seealso{
tmodDecideTests, tmodLimmaTest, tmodPanelPlot
}

