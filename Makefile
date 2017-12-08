default: compiler interp

.all: compiler interp clean example test

CC = gcc
CFLAGS = -g -O2 -Wall
OCAMLLDFLAGS = -warn-error -31
COMPILER = min-caml
INTERPRETER = min-camli

PACKS = ounit,str

TESTCASES = jitTest interpTest pypysampleTest

EXAMPLES = print sum-tail gcd sum fib ack even-odd adder \
funcomp cls-rec cls-bug cls-bug2 cls-reg-bug shuffle \
spill spill2 spill3 join-stack join-stack2 join-stack3 \
join-reg join-reg2 non-tail-if non-tail-if2 inprod inprod-rec \
inprod-loop matmul matmul-flat manyargs fib-tail array array2 \
float tuple

SUBDIRS = src

.PHONY: compiler
compiler:
	ocamlbuild src/float.o
	ocamlbuild -I src -pkgs str,ounit -lflags -custom,src/float.o src/main.byte
	@mv main.byte min-caml

.PHONY: interp
interp:
	ocamlbuild -Is src,test -pkgs $(PACKS) src/interpMain.byte
	mv interpMain.byte min-camli

clean:
	@for dir in $(SUBDIRS); do \
		cd $$dir; $(MAKE) clean -s; cd ..;\
	done
	ocamlbuild -clean

.PHONY: test
test:
	@for case in $(TESTCASES); do \
	  ocamlbuild -Is src,test -pkgs $(PACKS) test/$$case.byte; \
	  ./$$case.byte; \
	done

.PHONY: example
example: $(EXAMPLES:%=example/%.cmp)

.PRECIOUS: example/%.s example/% example/%.res example/%.ans example/%.cmp
TRASH = $(EXAMPLES:%=example/%.s) $(EXAMPLES:%=example/%) $(EXAMPLES:%=example/%.res) $(EXAMPLES:%=example/%.ans) $(EXAMPLES:%=example/%.cmp)

example/%.s: compiler example/%.ml
	./$(COMPILER) example/$*
example/%: example/%.s src/libmincaml.S src/stub.c
	$(CC) $(CFLAGS) -m32 $^ -lm -o $@
example/%.res: example/%
	$< > $@
example/%.ans: example/%.ml
	ocaml $< > $@
example/%.cmp: example/%.res example/%.ans
	diff $^ > $@
