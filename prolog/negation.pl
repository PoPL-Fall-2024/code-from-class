
inNewYork(clinton).
inNewYork(utica).

% ?- inNewYork(clinton).
% true.

% ?- \+ inNewYork(clinton).
% false.

% ?- inNewYork(syracuse).
% false.

% ?- \+ inNewYork(syracuse).
% true.

outsideNewYork(X) :- \+ inNewYork(X).

% Negation as failure is a result of the Closed World Assumption
%  - Everything that is true can be proven from the program
%  - Everything that cannot be proven must be false

hamiltonLocation(clinton).

% ?- inNewYork(X), \+ hamiltonLocation(X).
% X = utica.

% ?- \+ hamiltonLocation(X), inNewYork(X).
% false.

%% Why did this happen?
%% Should give the same results (because logically equivalent), but they don't.
%% What prolog does:
%%  - When a goal that Prolog is trying to meet fails, it backtracks the search
%%  - When Prolog backtracks, it indoes any variable instantiation
%%  - For \+P to succeed, P must fail, which undoes any variable instantiations

%% How to use negation:
%% 1. Substitutions can be communicated from a positive goal into a negated goal
%% 2. Substitutions cannot be communicated out of a negated goal
%% This means the order of subgoals in a rule is important.

location(clinton).
location(utica).
location(boston).