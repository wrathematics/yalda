#include <R.h>
#include <Rinternals.h>

#define CHARPT(x,i)	((char*)CHAR(STRING_ELT(x,i)))

extern "C" {

double lda_main(int argc, char **argv);
int infer_main(int argc, char** argv);


char *unliteral(const char *str) {
  char *ret;
  ret = (char *) malloc(strlen(str) + 1);
  
  if (ret == NULL) 
    return NULL;
  
  strcpy(ret, str);
  return ret;
}



int freestr(int argc, char **argv)
{
  int i;
  
  for (i=0; i<argc; i++)
    free(argv[i]);
  
  free(argv);
  
  return 0;
}



SEXP R_lda(SEXP argv_)
{
  SEXP ret;
  int i;
  const int argc = LENGTH(argv_);
  
  char **argv = (char**) malloc(argc * sizeof(*argv));
  
  PROTECT(ret = allocVector(REALSXP, 1));
  
  for (i=0; i<argc; i++)
    argv[i] = unliteral(CHARPT(argv_, i));
  
  REAL(ret)[0] = lda_main(argc, argv);
  
  freestr(argc, argv);
  
  UNPROTECT(1);
  return ret;
}



SEXP R_lda_infer(SEXP argv_)
{
  SEXP ret;
  int i;
  const int argc = LENGTH(argv_);
  
  char **argv = (char**) malloc(argc * sizeof(*argv));
  
  PROTECT(ret = allocVector(REALSXP, 1));
  
  for (i=0; i<argc; i++)
    argv[i] = unliteral(CHARPT(argv_, i));
  
  REAL(ret)[0] = infer_main(argc, argv);
  
  freestr(argc, argv);
  
  UNPROTECT(1);
  return ret;
}

}
