
% The = predicate is based on unification

% tuple = a compound term without a functor

% ?- a = a.
% true.

% ?- a = b.
% false.

% ?- X = a.
% X = a.

% ?- a = X.
% X = a.

% ?- X = Y.
% X = Y.

% ?- X = Y, Y = lion.
% X = Y, Y = lion.

% ?- X = Y, Y = lion, X = zebra.
% false.

% ?- foo(a, b) = foo(A, B).
% A = a,
% B = b.

% ?- foo(a, b) = foo(X).
% false.

% ?- foo(a, X) = foo(Y, b).
% X = b,
% Y = a.

% ?- foo(a,b) = bar(a,b).
% false.

% ?- (X, true, van) = (car, Y, Z).
% X = car,
% Y = true,
% Z = van.