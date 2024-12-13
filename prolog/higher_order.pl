mother(anita, claire).
mother(claire, janice).
mother(janice, laura).
mother(janice, zoe).
mother(zoe, gertrude).
mother(janice, kendra).
mother(janice, francine).
mother(francine, heather).
mother(kate, heather).

%% Higher-order predicates

%% findall(Object, Condition, List)
%% Creates List of all Objects that satisfy Condition

mothers(Moms) :- findall(X, mother(X, _), Moms).

daughtersOf(Mother, Daughters) :-
    findall(X, mother(Mother, X), Daughters).

%% findall is a bit weird in that it won't tell you individual
%% unifications for the first two arguments to it

%% bagof is the same, except does give individual unifications

daughtersOfBetter(Mother, Daughters) :-
    bagof(X, mother(Mother, X), Daughters).

%% maplist - similar to map in other languages:
%% Takes a predicate with 2 arguments, a list, and a result list
%% Each element in the list is passed as the first argument to
%% the predicate, and the resulting second arguments are collected
%% in the result list

%% We can write our own maplist:
%% call allows us to call a predicate that is passed as a variable
ourMapList(_, [], []).
ourMapList(Predicate, [H|T], [ResultH | ResultT]) :-
     call(Predicate, H, ResultH),
     ourMapList(Predicate, T, ResultT).

%% include - similar to filter in other languages
%% Takes a predicate with 1 argument, a list, and a result list
%% Each element of the list is passed to the predicate, and the result
%% will be a list of those arguments that make the predicate true

even(X) :- 0 =:= mod(X, 2).

janiceMother(X) :- mother(janice, X).

% We'll write our own include and name it filter
filter(_, [], []).
filter(Predicate, [H|T], [H|ResultT]) :-
    call(Predicate, H),
    filter(Predicate, T, ResultT).
filter(Predicate, [H|T], ResultT) :-
    \+ call(Predicate, H),
    filter(Predicate, T, ResultT).