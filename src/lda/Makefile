CC=clang++
MPICC=mpicxx

CFLAGS=-fPIC -O3 -w

all: lda infer
#mpi_lda

cmd_flags.o: cmd_flags.cc cmd_flags.h
	$(CC) -c $(CFLAGS)  cmd_flags.cc -o cmd_flags.o

common.o: common.cc common.h
	$(CC) -c $(CFLAGS)  common.cc -o common.o

document.o: document.cc document.h common.o
	$(CC) -c $(CFLAGS)  document.cc -o document.o

model.o: model.cc model.h common.o
	$(CC) -c $(CFLAGS)  model.cc -o model.o

accumulative_model.o: accumulative_model.cc accumulative_model.h common.o model.o
	$(CC) -c $(CFLAGS)  accumulative_model.cc -o accumulative_model.o

sampler.o: sampler.cc sampler.h common.o document.o model.o accumulative_model.o
	$(CC) -c $(CFLAGS)  sampler.cc -o sampler.o

lda.o: cmd_flags.o common.o document.o model.o accumulative_model.o sampler.o
	$(CC) -c $(CFLAGS)  lda.cc -o lda.o

infer.o: cmd_flags.o common.o document.o model.o accumulative_model.o sampler.o
	$(CC) -c $(CFLAGS)  infer.cc -o infer.o

static: lda.o infer.o cmd_flags.o common.o document.o model.o accumulative_model.o sampler.o
	ar rcs liblda.a *.o


#lda: lda.cc cmd_flags.o common.o document.o model.o accumulative_model.o sampler.o
#	$(CC) $(CFLAGS) -c lda.cc cmd_flags.o common.o document.o model.o accumulative_model.o sampler.o -o lda.o

#infer: infer.cc cmd_flags.o common.o document.o model.o accumulative_model.o sampler.o
#	$(CC) $(CFLAGS) infer.cc cmd_flags.o common.o document.o model.o accumulative_model.o sampler.o -o infer

#mpi_lda: mpi_lda.cc cmd_flags.o common.o document.o model.o accumulative_model.o sampler.o
#	$(MPICC) $(CFLAGS) mpi_lda.cc cmd_flags.o common.o document.o model.o accumulative_model.o sampler.o -o mpi_lda


clean:
	rm -f *.o
	rm -f lda mpi_lda infer
	rm -f liblda.a

