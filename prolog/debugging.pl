
mother(arlene, charlotte).
mother(arlene, becca).
mother(becca, sarah).
mother(sarah, natalie).

ancestor(A, D) :- mother(A, D).
ancestor(A, D) :- mother(A, M), ancestor(M, D).
