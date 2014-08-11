#  ./infer \
#  --alpha 0.1    \
#  --beta 0.01                                           \
#  --inference_data_file ./testdata/test_data.txt \
#  --inference_result_file /tmp/inference_result.txt \
#  --model_file /tmp/lda_model.txt                       \
#  --burn_in_iterations 10                              \
#  --total_iterations 15

setMethod("infer", signature(x="LDA"),
  function(x, newdatafile, inferfile)
  {
    must.be(newdatafile, "character")
    must.be(inferfile, "character")
    
    newdatafile <- file_path_as_absolute(newdatafile)
    inferfile <- file_path_as_absolute(inferfile)
    
    if (!file.exists(newdatafile))
      stop(paste("Data set newdatafile=", newdatafile, "does not exist"))
    
    ### This is exactly what it looks like.
    argv <- c(
      "./lda",
      "--num_topics", as.character(x@num.topics),
      "--alpha", as.character(x@alpha),
      "--beta", as.character(x@beta),
      "--inference_data_file", as.character(newdatafile),
      "--model_file", x@modelfile,
      "--inference_result_file", as.character(inferfile),
      "--burn_in_iterations", as.character(x@burnin),
      "--total_iterations", as.character(x@niter),
    )
    
    ret <- .Call("R_infer", argv, PACKAGE="yalda")
    
    invisible()
  }
)

