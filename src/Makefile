all: linreg.so

linreg.so: linreg.cpp
	$(R_HOME)/bin/Rscript --vanilla -e "TMB::compile('linreg.cpp', '-O1 -g', safebounds = FALSE, safeunload = FALSE, DLLFLAGS = '')"

clean:
	rm -rf *.o
	rm -rf *.so
