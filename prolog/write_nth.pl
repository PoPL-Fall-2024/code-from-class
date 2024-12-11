
% write/1
% always true, but also prints to the screen
% note: will print every time the prolog search gets to that write
% so, it might print multiple times as the program backtracks

% ?- write(hello).
% hello
% true.

% ?- write([a,b,c]).
% [a,b,c]
% true.

% ?- write(X).
% _108236
% true.

% ?- write(hello), nl, write(world).
% hello
% world
% true.

% nth0
% true if first arg is the index of the third argument in the second arg

% ?- nth0(2, [a,b,c,d,e], X).
% X = c.

% ?- nth0(Index, [a, b, a, c, d, e, a], a).
% Index = 0 ;
% Index = 2 ;
% Index = 6.

% ?- nth0(Index, [a, b, a, c, d, e, a], Element).
% Index = 0,
% Element = a ;
% Index = 1,
% Element = b ;
% Index = 2,
% Element = a ;
% Index = 3,
% Element = c ;
% Index = 4,
% Element = d ;
% Index = 5,
% Element = e ;
% Index = 6,
% Element = a.

% ?- nth1(2, [a,b,c,d,e], X).
% X = b.

nthZero(0, [H|_], H).
nthZero(Index, [_|T], Element) :-
    integer(Index),
    DecIndex is Index - 1,
    % write(T), write(" "), write(Index), nl,
    nthZero(DecIndex, T, Element).
%% This version allows us to find the index of an element:
nthZero(Index, [_|T], Element) :-
    var(Index), % uninstantiated variable
    nthZeroHelper(1, Index, T, Element).

% We'll use a helper predicate to build up the result using
% tail recursion
nthZeroHelper(Ind, Ind, [Element|_], Element).
nthZeroHelper(Ind, Result, [_|T], Element) :-
    NextIndex is Ind + 1,
    nthZeroHelper(NextIndex, Result, T, Element).
