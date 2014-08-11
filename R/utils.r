is.int <- function(x)
{
  if (is.numeric(x))
  {
    if (is.integer(x))
      return( TRUE )
    else if (x-as.integer(x) < sqrt(.Machie$double.eps))
      return( TRUE )
    else
      return( FALSE )
  }
  else
    return( FALSE )
}



# error checking for the lazy man
must.be <- function(x, type)
{
  Rstuff <- c("character", "numeric", "integer", "double", "logical", "matrix", "data.frame", "vector")
  
  type <- match.arg(type, Rstuff)
  
  nm <- deparse(substitute(x))
  
  fun <- eval(parse(text=paste("is.", type, sep="")))
  
  if (!fun(x))
    stop(paste("argument '", nm, "' must be of type ", type, sep=""), call.=FALSE)
  
  invisible(TRUE)
}

