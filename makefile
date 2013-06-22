#makefile
CC = gcc
WARNINGS = -Wall

all: Primes.dll

Primes.dll: linkedlist_ull.o Primes.o
	$(CC) -shared -o Primes.dll linkedlist_ull.o Primes.o -Wl,--out-implib,libmessage.a
	
linkedlist_ull.o: linkedlist_ull.c linkedlist_ull.h
	$(CC) -c linkedlist_ull.c
	
Primes.o: Primes.c Primes.h
	$(CC) -c -DBUILD_DLL Primes.c
	
clean:
	rm -rf *o Primes.dll
