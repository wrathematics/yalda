library(yalda)

infile <- "../testdata/test_data.txt"
outfile <- "../testdata/out.txt"


lda(infile=infile, outfile=outfile, burnin=25, niter=100)

