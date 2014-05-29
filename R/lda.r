lda <- function(infile, outfile, compute.loglik=TRUE, num.topics=10, alpha=50/num.topics, beta=0.1, niter=15, burnin=10, verbose=FALSE)
{
  if (verbose)
    verbose <- "true"
  else
    verbose <- "false"
  
  if (compute.loglik)
    complik <- "true"
  else
    complik <- "false"
  
  ### This is exactly what it looks like.
  argv <- c(
    "./lda",
    "--num_topics", as.character(num.topics),
    "--alpha", as.character(alpha),
    "--beta", as.character(beta),
    "--training_data_file", as.character(infile),
    "--model_file", as.character(outfile),
    "--burn_in_iterations", as.character(burnin),
    "--total_iterations", as.character(niter),
    "--verbose", as.character(verbose),
    "--compute_likelihood", as.character(complik)
  )
  
  ret <- .Call("R_lda", argv)
  
  if (compute.loglik)
    return(ret)
  else
    invisible()
}
