lda <- function(infile, outfile, compute.loglik=TRUE, num.topics=10, 
                alpha=50/num.topics, beta=0.01, niter=15, burnin=10, 
                verbose=FALSE)
{
  must.be(infile, "character")
  must.be(outfile, "character")
  must.be(compute.loglik, "logical")
  must.be(num.topics, "numeric")
  must.be(alpha, "numeric")
  must.be(beta, "numeric")
  must.be(niter, "numeric")
  must.be(burnin, "numeric")
  must.be(verbose, "logical")
  
  
  verbose <- tolower(as.character(verbose))
  comploglik <- tolower(as.character(compute.loglik))
  
  infile <- file_path_as_absolute(infile)
  modelfile <- file_path_as_absolute(modelfile)
  
  if (!file.exists(infile))
    stop(paste("Data set infile=", infile, "does not exist"))
  
  
  ret <- new("LDA", infile=infile, modelfile=modelfile, 
            num.topics=num.topics, alpha=alpha, beta=beta,
            niter=niter, burnin=burnin, loglik=NA)
  
  check.lda(ret)
  
  
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
    "--compute_likelihood", as.character(comploglik)
  )
  
  loglik <- .Call("R_lda", argv, PACKAGE="yalda")
  
  if (compute.loglik)
    ret@loglik <- loglik
  
  return( ret )
}

