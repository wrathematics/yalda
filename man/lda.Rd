\name{lda}
\alias{lda}

\title{LDA Model Fitting}
\description{
  This routine uses the plda application from Google to fit a 
  Latent Dirichlet Allocation model. 
  
  Currently IO is required "both ways".
}
\usage{
  lda(infile, outfile, compute.loglik=TRUE, num.topics=10, alpha=50/num.topics, 
      beta=0.01, niter=15, burnin=10, verbose=FALSE)
}
\arguments{
  \item{infile}{A string pointing to the input dataset.}
  \item{outfile}{A string pointing to the output data file.}
  \item{compute.loglik}{logical; controls whether the model 
  log-likelihood should be returned.}
  \item{num.topics}{integer; determines the number of topics in the
  topic model.}
  \item{alpha}{numeric; }
  \item{beta}{numeric; }
  \item{niter}{integer; the total number of iterations to perform
  in fitting the model.}
  \item{burnin}{The number of burnin iterations (for the Gibbs
  sampler).  Must be no greater than \code{niter}}.
  \item{verbose}{logical; controls if "Iteration <iter>" should
  be printed at each iteration.}
}

