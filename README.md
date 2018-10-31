# SQLite3-DBX

This repository was forked from https://github.com/newsoft/sqlite3-dbx.

## About

SQLite3 has database encryption support, but this seems to be not publicly available as explained here: http://www.sqlite.org/see/doc/trunk/www/readme.wiki.

However, a Google search for "7bb07b8d471d642e" magic reveals that part of the source code is available from the SQLite website:
* http://www.sqlite.org/slt/vpatch?from=10318b880cb756b2&to=1d627f5850e271cf (encryption added)
* http://www.sqlite.org/slt/vpatch?from=1d627f5850e271cf&to=f85e9769888f9e76 (encryption removed)
* http://www.sqlite.org/sqllogictest/ci/f85e9769888f9e762ef3c8d2f18121ea8307b433?sbs=1

This project is based on the following SQLite version:
```
Version: 3.7.0
Source Id: 2010-07-02 19:04:59 336ce7d29767f76c4a92aa4bbc46d21e19871667
```
## Compilation

No Makefile is provided. Compilation (in debug mode) is as easy as:
```
$ gcc -o sqlite3 -I. -DSQLITE_HAS_CODEC shell.c sqlite3.c -Wall -ggdb -ldl -lpthread
```

Tested and supported platforms are:

* Linux (Ubuntu 10.04 x86)
* Windows (Cygwin)
* Mac OS X (10.7)

**Warning:** on recent Ubuntu versions, GCC command-line arguments ordering matters.

"The --as-needed option also makes the linker sensitive to the ordering of libraries on the command-line." (see https://wiki.ubuntu.com/NattyNarwhal/ToolchainTransition#How_to_Fix_a_Problem)

## Usage

```
./sqlite3 -key 0123456789ABCDEF0123456789ABCDEF file.dbx
```

**Note:** The key length is only limited by the implementation size of `int`.

## Known limitations

* Encryption key put into ~/.sqliterc file will NOT be taken into account.
* ".backup" and ".restore" meta commands will NOT encrypt the /other/ database (would be easy to implement anyway).
* Rekeying is supported by the API, but not implemented (yet).
