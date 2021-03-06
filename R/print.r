setMethod("print", signature(x="ngram"),
  function(x, full=FALSE)
  {
    if (full)
      ng.print(x)
    else
      print(paste("An ngram object with ", x@ngsize, " ", x@n, "-grams", sep=""))
    
    invisible()
  }
)



setMethod("show", signature(object="ngram"),
  function(object)
    print(x=object, full=FALSE)
)

