% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utilities.R
\name{samplesSplits}
\alias{samplesSplits}
\alias{samplesSplits,CrossValParams-method}
\alias{samplesSplits,numeric-method}
\alias{splitsTestInfo}
\title{Split Sample Indexes into Training and Test Partitions for Cross-validation Taking Into Account Classes.}
\usage{
samplesSplits(
  samplesSplits = c("k-Fold", "Permute k-Fold", "Permute Percentage Split",
    "Leave-k-Out"),
  permutations = 100,
  folds = 5,
  percentTest = 25,
  leave = 2,
  outcome
)

splitsTestInfo(
  samplesSplits = c("k-Fold", "Permute k-Fold", "Permute Percentage Split",
    "Leave-k-Out"),
  permutations = 100,
  folds = 5,
  percentTest = 25,
  leave = 2,
  splitsList
)
}
\arguments{
\item{samplesSplits}{Default: \code{"k-Fold"}. One of \code{"k-Fold"}, \code{"Permute k-Fold"}, \code{"Permute Percentage Split"}, \code{"Leave-k-Out"}.}

\item{permutations}{Default: \code{100}. An integer. The number of times the samples are permuted before splitting (repetitions).}

\item{folds}{Default: \code{5}. An integer. The number of folds to which the samples are partitioned to. Only relevant if \code{samplesSplits} is \code{"k-Fold"} or \code{"Permute k-Fold"}.}

\item{percentTest}{Default: \code{25}. A positive number between 0 and 100. The percentage of samples to keep for the test partition. Only relevant if \code{samplesSplits} is \code{"Permute Percentage Split"}.}

\item{leave}{Default: \code{2}. An integer. The number of samples to keep for the test set in leave-k-out cross-validation. Only relevant if \code{samplesSplits} is \code{"Leave-k-Out"}.}

\item{outcome}{A \code{factor} vector or \code{\link{Surv}} object containing the samples to be partitioned.}

\item{splitsList}{The return value of the function \code{samplesSplits}.}
}
\value{
For \code{samplesSplits}, two lists of the same length. First is training partitions. Second is test partitions.

For \code{splitsTestInfoTable}, a table with a subset of columns \code{"permutation"}, \code{"fold"} and \code{"subset"}, depending on the cross-validation scheme specified.
}
\description{
\code{samplesSplits} Creates two lists of lists. First has training samples, second has test samples for a range
 of different cross-validation schemes.

\code{splitsTestInfo} creates a table for tracking the permutation, fold number, or subset of each set
of test samples. Useful for column-binding to the predictions, once they are unlisted into a vector.
}
\examples{

classes <- factor(rep(c('A', 'B'), c(15, 5)))
splitsList <-samplesSplits(permutations = 1, outcome = classes)
splitsList
splitsTestInfo(permutations = 1, splitsList = splitsList)
}
