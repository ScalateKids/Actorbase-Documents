[![Build Status](https://travis-ci.org/ScalateKids/Actorbase-Documents.svg)](https://travis-ci.org/ScalateKids/Actorbase-Documents)

# Actorbase-Documents

Documentation for Actorbase, a NoSQL DB based on the Actor model

## Cheatsheet Make

Check errors, glossary words, build al documents and finally calculate
readability stats.

```sh
$ make all
```

Build all documents into build folder

```sh
$ make build
```

Verify errors

```sh
$ make verify
```

Verify glossary words not enclosed by \gloss

```sh
$ make verifygloss
```

Find all glossary words
```sh
$ make findgloss
```

Calculate readability stats

```sh
$ make readability
```

Calculate readability stats alternative scripts

```sh
$ make readability2
```
