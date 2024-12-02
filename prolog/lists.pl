
%% Lists
%% You can get the head and tail of a list
%% using pattern matching, similar to Haskell
%% syntax: [H | T]
%% H = the first element in the list
%% T = the rest of the list

%% member - tells if item is an element in a list

ourMember(X, [X | _]).
ourMember(X, [_ | T]) :- ourMember(X, T).

%% append - true if first two arguments concatenated
%%          are the third argument

ourAppend([], A, A).
ourAppend([H | T], A, [H | L]) :- ourAppend(T, A, L).

%% write a rule that is true if the second argument
%% is the middle element of an odd-length list

middleElement(List, Middle) :-
    append(X, [Middle | Y], List),
    length(X, XLength),
    length(Y, XLength).

%% Gives the middle 2 elements of an even-length list
middleElement(List, [M1, M2]) :-
    append(X, [M1, M2 | Y], List),
    length(X, XLength),
    length(Y, XLength).
    
%% Write a relation lastElement(List, Element) that uses append
%% to make it true if Element is the last element of List
lastElement(List, Element) :- append(_, [Element], List).

%% Write allButLast(List, AllBut) that is true if AllBut is
%% all elements of List besides the last one
allButLast(List, AllBut) :- append(AllBut, [_], List).

%% Gives all prefixes of List
prefixes(List, Prefix) :- append(Prefix, _, List).

%% true if List is some list concatenated with Suffix
suffixes(List, Suffix) :- append(_, Suffix, List).


% ?- foo(x, y) = foo(W, z).
% false.

% ?- =(foo(a, b), foo(X, Y)).
% X = a,
% Y = b.

% ?- L = [a, b, c].
% L = [a, b, c].

% ?- [a,b,c] = L.
% L = [a, b, c].

% ?- L = [a | [b,c]].
% L = [a, b, c].

% ?- L = [a,b | [c,d]].
% L = [a, b, c, d].

% ?- [a,b,c,d] = [H | T].
% H = a,
% T = [b, c, d].

% ?- [a,b,c,d] = [X,Y | Z].
% X = a,
% Y = b,
% Z = [c, d].

% ?- length([a,b,c], X).
% X = 3.

% ?- length([a,b,c]).
% ERROR: Unknown procedure: length/1
% ERROR:     However, there are definitions for:
% ERROR:         length/2
% false.

% ?- length(Y, 3).
% Y = [_, _, _].

% ?- length(Y, 3), Y = [a | T].
% Y = [a, _A, _B],
% T = [_A, _B].

% ?- member(b, [a,b,c,d]).
% true ;
% false.

% ?- member(b, [a,b,c,b]).
% true ;
% true.

% ?- member(b, [a,b,c,d]).
% true .

% ?- member(X, [a,b,c,d]).
% X = a ;
% X = b ;
% X = c ;
% X = d.

% ?- member(a, List).
% List = [a|_] ;
% List = [_, a|_] ;
% List = [_, _, a|_] ;
% List = [_, _, _, a|_] ;
% List = [_, _, _, _, a|_] ;
% List = [_, _, _, _, _, a|_] ;
% List = [_, _, _, _, _, _, a|_] ;
% List = [_, _, _, _, _, _, _, a|_] ;
% List = [_, _, _, _, _, _, _, _, a|...] ;
% List = [_, _, _, _, _, _, _, _, _|...] ;
% List = [_, _, _, _, _, _, _, _, _|...] .

% ?- [lists].
% ERROR: /workspaces/cs220/code-from-class-220/prolog/lists.pl:12:41: Syntax error: Unexpected end of file
% true.

% ?- [lists].
% true.

% ?- ourMember(b, [a,b,c,d]).
% true .

% ?- ourMember(b, [a,b,c,d]).
% true ;
% false.

% ?- ourMember(b, [a,c,d]).
% false.

% ?- ourMember(R, [a,c,d]).
% R = a ;
% R = c ;
% R = d ;
% false.

% ?- ourMember(a, List).
% List = [a|_] ;
% List = [_, a|_] ;
% List = [_, _, a|_] ;
% List = [_, _, _, a|_] ;
% List = [_, _, _, _, a|_] ;
% List = [_, _, _, _, _, a|_] ;
% List = [_, _, _, _, _, _, a|_] ;
% List = [_, _, _, _, _, _, _, a|_] ;
% List = [_, _, _, _, _, _, _, _, a|...] ;
% List = [_, _, _, _, _, _, _, _, _|...] 
% ERROR: Type error: `character_code' expected, found `-1' (an integer)
% ERROR: In:
% ERROR:   [11] char_code(_10790,-1)
% ERROR:   [10] '$in_reply'(-1,'?h') at /usr/lib/swi-prolog/boot/init.pl:1012
% ?- append([a,b], [c,d], [a,b,c,d]).
% true.

% ?- append([a,b], [c,d], X).
% X = [a, b, c, d].

% ?- append(X, [c,d], [a,b,c,d]).
% X = [a, b] ;
% false.

% ?- append(X, [c,d], [a,b,c,d,e]).
% false.

% ?- append([a,b], Y, [a,b,c,d]).
% Y = [c, d].

% ?- append(X, Y, [a,b,c,d]).
% X = [],
% Y = [a, b, c, d] ;
% X = [a],
% Y = [b, c, d] ;
% X = [a, b],
% Y = [c, d] ;
% X = [a, b, c],
% Y = [d] ;
% X = [a, b, c, d],
% Y = [] ;
% false.

% ?- [lists].
% true.

% ?- ourAppend(X, [c,d], [a,b,c,d]).
% X = [a, b] ;
% false.

% ?- ourAppend(X, Y, [a,b,c,d]).
% X = [],
% Y = [a, b, c, d] ;
% X = [a],
% Y = [b, c, d] ;
% X = [a, b],
% Y = [c, d] ;
% X = [a, b, c],
% Y = [d] ;
% X = [a, b, c, d],
% Y = [] ;
% false.

% ?- [lists].
% true.

% ?- middleElement([1,2,3,4,5,6,7], X).
% X = 4 ;
% false.

% ?- middleElement([a,b,c], Y).
% Y = b ;
% false.

% ?- middleElement([a,b,c,d], Y).
% false.

% ?- middleElement(X, r).
% X = [r] ;
% X = [_, r, _] ;
% X = [_, _, r, _, _] ;
% X = [_, _, _, r, _, _, _] ;
% X = [_, _, _, _, r, _, _, _, _] ;
% X = [_, _, _, _, _, r, _, _, _|...] ;
% X = [_, _, _, _, _, _, r, _, _|...] ;
% X = [_, _, _, _, _, _, _, r, _|...] .

% ?- [lists].
% true.

% ?- middleElement([a,b,c], Y).
% Y = b ;
% false.

% ?- middleElement([1,2,3,4,5,6,7], X).
% X = 4 ;
% false.

% ?- middleElement([a,b,c,d], Y).
% Y = [b, c] ;
% false.

% ?- [lists].
% Warning: /workspaces/cs220/code-from-class-220/prolog/lists.pl:36:
% Warning:    Singleton variables: [X]
% true.

% ?- [lists].
% Warning: /workspaces/cs220/code-from-class-220/prolog/lists.pl:36:
% Warning:    Singleton variables: [X]
% true.

% ?- lastElement([a,b,c,d], E).
% E = [d] ;
% false.

% ?- [lists].
% true.

% ?- lastElement([a,b,c,d], E).
% E = d ;
% false.

% ?- lastElement(L, w).
% L = [w] ;
% L = [_, w] ;
% L = [_, _, w] ;
% L = [_, _, _, w] ;
% L = [_, _, _, _, w] ;
% L = [_, _, _, _, _, w] ;
% L = [_, _, _, _, _, _, w] 
% Unknown action: q (h for help)
% Action? .

% ?- lastElement([a,b,c,X], f).
% X = f ;
% false.

% ?- [lists].
% true.

% ?- allButLast([a,b,c,d], X).
% X = [a, b, c] ;
% false.

% ?- allButLast(Y, [q,w,e]).
% Y = [q, w, e, _].

% ?- [lists].
% true.

% ?- allButLast([a,b,c,d], X).
% X = [] ;
% X = [a] ;
% X = [a, b] ;
% X = [a, b, c] ;
% X = [a, b, c, d] ;
% false.

% ?- [lists].
% true.

% ?- prefixes([a,b,c,d], Y).
% Y = [] ;
% Y = [a] ;
% Y = [a, b] ;
% Y = [a, b, c] ;
% Y = [a, b, c, d] ;
% false.

% ?- prefixes(Y, [a,b,c]).
% Y = [a, b, c|_].

% ?- prefixes(Y, X).
% X = [] ;
% Y = [_A|_],
% X = [_A] ;
% Y = [_A, _B|_],
% X = [_A, _B] ;
% Y = [_A, _B, _C|_],
% X = [_A, _B, _C] ;
% Y = [_A, _B, _C, _D|_],
% X = [_A, _B, _C, _D] ;
% Y = [_A, _B, _C, _D, _E|_],
% X = [_A, _B, _C, _D, _E] ;
% Y = [_A, _B, _C, _D, _E, _F|_],
% X = [_A, _B, _C, _D, _E, _F] ;
% Y = [_A, _B, _C, _D, _E, _F, _G|_],
% X = [_A, _B, _C, _D, _E, _F, _G] .

% ?- [lists].
% true.

% ?- suffixes([a,b,c], Q).
% Q = [a, b, c] ;
% Q = [b, c] ;
% Q = [c] ;
% Q = [] ;
% false.