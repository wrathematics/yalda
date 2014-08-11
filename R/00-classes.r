check.lda <- function(object)
{
  ### Type checking
  if (!is.numeric(object@alpha))
    return("alpha must be numeric.")
  if (!is.numeric(object@beta))
    return("beta must be numeric.")
  if (!is.int(object@burnin))
    return("burnin must be an integer.")
  if (!is.int(object@niter))
    return("niter must be an integer.")
  
  ### Value checking
  if (object@alpha <= 0)
    return("alpha must be > 0.")
  if (beta <= 0)
    return("beta must be > 0.")
  if (!file.exists(object@infile))
    return("Invalid input data file.")
  if (file.exists(object@modelfile))
    warning("Given modelfile already exists; overwriting.")
  if (object@burnin < 0)
    return("burn_in_iterations must >= 0.")
  if (object@niter < 1)
    return("niter must be > 0")
  if (object@niter <= object@burnin)
    return("niter must be > burnin.")
  
  return( TRUE )
}



setClass(
  Class="LDA", 
  representation=representation(
    infile="character",
    modelfile="character",
    num.topics="numeric",
    alpha="numeric",
    beta="numeric",
    niter="numeric",
    burnin="numeric",
    loglik="numeric"
  ),
  
  validity=check.lda
)

