##
## /makefile
##
## Created by Paul Warkentin <paul@warkentin.email> on 31/10/2018.
## Updated by Paul Warkentin <paul@warkentin.email> on 31/10/2018.
##

CC = gcc
CFLAGS = -DSQLITE_HAS_CODEC -Wall -ggdb -ldl -lpthread

OBJECTS = src/shell.c src/sqlite3.c
INCLUDEDIR = include
BUILDDIR = build
EXECUTABLE = sqlite3-dbx

all: main

main: $(OBJECTS)
	mkdir -p $(BUILDDIR)
	$(CC) -o $(BUILDDIR)/$(EXECUTABLE) -I $(INCLUDEDIR) $(CFLAGS) $(OBJECTS)

clean:
	rm -rf $(BUILDDIR)