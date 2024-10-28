CFLAGS = -g
CC = gcc217

all: testlist testhash

testlist: testsymtable.c symtable.h symtablelist.c
	$(CC) -E symtablelist.c > symtablelist.i
	$(CC) -S symtablelist.i
	$(CC) -c symtablelist.s
	$(CC) -c testsymtable.c
	$(CC) symtablelist.o testsymtable.o -o $@

testhash: testsymtable.c symtable.h symtablehash.c
	$(CC) -E symtablehash.c > symtablehash.i
	$(CC) -S symtablehash.i
	$(CC) -c symtablehash.s
	$(CC) -c testsymtable.c
	$(CC) symtablehash.o testsymtable.o -o $@

clobber: clean
	rm -rf *~\#*\#
clean:
	rm -rf testhash testlist *.o
.PHONY: all clobber clean
