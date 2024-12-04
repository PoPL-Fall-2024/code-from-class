%% These are my implementations of the lab problems.
%% There are certainly other ways to implement these!

%% Pre-lab: a2b
a2b([],[]).
a2b([a|Ta], [b|Tb]) :- a2b(Ta, Tb).
a2b([X|Ta], [X|Tb]) :- X \== a, X \== b, a2b(Ta, Tb).

%% Occurs twice
occursTwice(X, [X | T]) :- member(X, T).
occursTwice(X, [_ | T]) :- occursTwice(X, T).

%% Halves
halves(Start, End, Whole) :- append(Start, End, Whole),
			     length(Start, S),
			     length(End, S).

%% Tails. Either of the following will work (note second is called tails2)
tails(X, [H|T]) :- append(_, [H|T], X).

tails2(X, T) :-
    append(_, T, X),
    length(T, LengthT),
    LengthT > 0.

%% Thrice
thrice(Shorter, Longer) :- append(Shorter, Shorter, Medium),
                           append(Medium, Shorter, Longer).

%% Sorted
sorted([]).
sorted([_]).
sorted([X,Y | T]) :- X < Y, sorted([Y | T]).

%% Distinct -- this one is tricky because you need both recursive cases
distinct([], []).
distinct([H|T], TailDeduped) :-
    distinct(T, TailDeduped),
    member(H, TailDeduped).
distinct([H|T], [H|TailDeduped]) :-
    distinct(T, TailDeduped),
    \+(member(H, TailDeduped)).
