
% To start SWI Prolog interpreter:
% > swipl

% to load a fil;e:
% [intro].

% after a query:
% - hit enter to stop
% - hit spacebar to get next answer
% - (hit ??? to get all answers) - turns out this isn't supported by SWIPL,
%                I was thinking about GNU Prolog, which I used to use.

% simple knowledge base:

% facts:
age(helmuth, 38).
age(lebron, 39).
age(eliza, 7).
age(princeWilliam, 42).
age(sadie, 7).

birthplace(helmuth, usa).
birthplace(lebron, usa).
birthplace(eliza, usa).
birthplace(princeWilliam, england).

% rules:
eligibleForPresident(X) :-
    birthplace(X, usa),
    age(X, Years),
    Years >= 35.

%% more facts
mother(anita, claire).
mother(claire, janice).
mother(janice, laura).
mother(janice, zoe).
mother(zoe, gertrude).
mother(janice, kendra).
mother(janice, francine).
mother(francine, heather).

% How can we define an ancestor relation?
% Write a rule that tells if X is the ancestor of Y

ancestor(X, Y) :- mother(X, Y).
ancestor(X, Y) :- mother(X, Z), ancestor(Z, Y). % this is a recursive rule



%%%  From the prolog interpreter:

% ?- [intro].
% true.

% ?- age(helmuth, 50).
% false.

% ?- age(helmuth, 38).
% true.

% ?- age(eliza, Age).
% Age = 7.

% ?- age(Name, Age).
% Name = helmuth,
% Age = 38 ;
% Name = lebron,
% Age = 39 ;
% Name = eliza,
% Age = 7 ;
% Name = princeWilliam,
% Age = 42.

% ?- [intro].
% true.

% ?- age(Name, 7).
% Name = eliza ;
% Name = sadie.

% ?- age(Name, 7).
% Name = eliza .

% ?- age(Name, 7).
% Name = eliza ;
% Name = sadie.

% ?- age(Name, Age).
% Name = helmuth,
% Age = 38 .

% ?- age(Name, Age).
% Name = helmuth,
% Age = 38 
% Name = lebron,
% Age = 39 ;
% Name = eliza,
% Age = 7 ;
% Name = princeWilliam,
% Age = 42 ;
% Name = sadie,
% Age = 7.

% ?- age(Name, Age), Age > 38.
% Name = lebron,
% Age = 39 ;
% Name = princeWilliam,
% Age = 42 ;
% false.

% ?- [intro].
% true.

% ?- birthplace(Name, usa).
% Name = helmuth ;
% Name = lebron ;
% Name = eliza.

% ?- [intro].
% true.

% ?- eligibleForPresident(helmuth)
% |    .
% true .

% ?- eligibleForPresident(lebron).
% true ;
% false.

% ?- eligibleForPresident(eliza).
% false.

% ?- eligibleForPresident(princeWilliam).
% false.

% ?- eligibleForPresident(Name).
% Name = helmuth ;
% Name = lebron ;
% false.

% ?- eligibleForPresident(lebron).
% true ;
% false.

% ?- eligibleForPresident(helmuth).
% true ;
% false.

% ?- birthplace(X, Place), age(X, Years).
% X = helmuth,
% Place = usa,
% Years = 38 ;
% X = lebron,
% Place = usa,
% Years = 39 ;
% X = eliza,
% Place = usa,
% Years = 7 ;
% X = princeWilliam,
% Place = england,
% Years = 42.

% ?- birthplace(NAME_weird, usa).
% NAME_weird = helmuth ;
% NAME_weird = lebron ;
% NAME_weird = eliza.

% ?- [intro].
% true.

% ?- mother(Mother, Daughter).
% Mother = anita,
% Daughter = claire ;
% Mother = claire,
% Daughter = janice ;
% Mother = janice,
% Daughter = laura ;
% Mother = janice,
% Daughter = zoe ;
% Mother = zoe,
% Daughter = gertrude ;
% Mother = janice,
% Daughter = kendra ;
% Mother = janice,
% Daughter = francine ;
% Mother = francine,
% Daughter = heather.

% ?- [intro].
% true.

% ?- ancestor(X, heather).
% X = francine ;
% X = anita ;
% X = claire ;
% X = janice ;
% false.

% ?- ancestor(claire, Descendant).
% Descendant = janice ;
% Descendant = laura ;
% Descendant = zoe ;
% Descendant = kendra ;
% Descendant = francine ;
% Descendant = gertrude ;
% Descendant = heather ;
% false.

% ?- ancestor(M, N).
% M = anita,
% N = claire ;
% M = claire,
% N = janice ;
% M = janice,
% N = laura ;
% M = janice,
% N = zoe ;
% M = zoe,
% N = gertrude ;
% M = janice,
% N = kendra ;
% M = janice,
% N = francine ;
% M = francine,
% N = heather ;
% M = anita,
% N = janice ;
% M = anita,
% N = laura ;
% M = anita,
% N = zoe ;
% M = anita,
% N = kendra ;
% M = anita,
% N = francine ;
% M = anita,
% N = gertrude ;
% M = anita,
% N = heather ;
% M = claire,
% N = laura ;
% M = claire,
% N = zoe ;
% M = claire,
% N = kendra ;
% M = claire,
% N = francine ;
% M = claire,
% N = gertrude ;
% M = claire,
% N = heather ;
% M = janice,
% N = gertrude ;
% M = janice,
% N = heather ;
% false.