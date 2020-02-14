%Helper Functions

%Append Function 
append([], X, X).
append([X | Y], Z, [X | W]) :-
	append(Y,Z,W). 
	
%Remove Characters Function 
remove([], List, List). 
remove([Head | Tail], L2, Return) :-
	not(number(Head)) -> remove(Tail, L2, Return);
	number(Head) -> remove(Tail, [Head | L2], Return). 
	
%Remove Minimum Function 
remove-min([Head | Tail], Min, NewList)
	Head =:= Min -> NewList = Tail;
	append(Tail, [Head], New), 
	remove-min(New, Min, NewList). 
	
%Minimum Function 
min([Head | Tail], Minimum) :- 
	min(Tail, Head, Minimum). 
min([], Minimum, Minimum). 
min([Head | Tail, Minimum, Mini) :-
	(Head < Minimum -> min(Tail, Head, Mini); min(Tail, Minimum, Mini)). 
	
%1. Summing of Numbers in List Excuding Nested Lists 
sum-up-numbers-simple([], 0).
sum-up-numbers-simple([Head | Tail], N) :-
	not(number(Head)) -> sum-up-numbers-simple(Tail, N);
	sum-up-numbers-simple(Tail, N1),
	N is Head + N1.
	
%2. Summing of Numbers in List Including Nested Lists
sum-up-numbers-general([], 0).
sum-up-numbers-general([Head | Tail], N) :-
	is_list(Head) - > append([Head | Tail], Head, [Head | NewList]),
	sum-up-numbers-general(NewList, N);
	not(number(Head)) ->  sum-up-numbers-general(Tail, N);
    sum-up-numbers-general(Tail, N1), 
    N is Head + N1. 
    
%3. Minimum Above Minimum Function that compares to see if the min in list1 is greater than the min in list2 
min-above-min([], L2, false). 
min-above-min([Head | Tail], [], Result) :-
	not(number(Head)) -> min-above-min(Tail, [], Result);
	(number(Head) -> remove([Head | Tail], [], Removed),  
	min(Removed, Result));
	(length(Tail, 0) -> Result is Head;
	min([Head | Tail], Result)). 
min-above-min([Head | Tail], [H2 | T2], Result) :-
	(remove([Head | Tail], [], Removed),
	length(Removed, 0) -> Removed = false);  
	remove([Head | Tail], [], Removed),
	length(Removed, 1) ->  remove([H2 | T2], [], Rem),
		min(Removed, Min1), 
		min(Rem, Min2), 
		(Min1 =:= Min2 -> Result = false;
		Min1 > Min2 -> Result = Min1); 
	remove([Head | Tail], [], Removed), 
	not(length(Removed, 1)) -> remove([H2 | T2], [], Rem), 
		min(Removed, Min1), 
		min(Rem, Min2),
		(Min1 =:= Min2 -> remove-min(Removed, Min1, NewList),
		min-above-min(NewList, [H2 | T2], Result); 
		Min1> Min2 -> Result = Min1). 
		
%Returning the common elements in two lists 
common-unique-elements([], [], []).
common-unique-elements([], L2, []). 
common-unique-elements(L2, [], []). 
common-unique-elements([Head | Tail], L2, NewList) :-
        member(Head, L2),
        !,
         NewList = [Head | N1tail],
        common-unique-elements(Tail, L2, N1tail).
common-unique-elements([_| Tail], L2, NewList) :-
        common-unique-elements(Tail, L2, NewList). 
