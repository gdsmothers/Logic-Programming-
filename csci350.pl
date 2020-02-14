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
	
