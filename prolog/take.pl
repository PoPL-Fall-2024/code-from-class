
take(List, N, Result) :- append(Result, _, List), length(Result, N).

takeBad(List, N, Result) :- length(Result, N), append(Result, _, List).

count([], 0).
count([_|T], N) :- count(T, Tlength), N is Tlength + 1.