.PHONY: test check

build:
	dune build

utop:
	OCAMLRUNPARAM=b dune utop src

play:
	OCAMLRUNPARAM=b dune exec bin/main.exe