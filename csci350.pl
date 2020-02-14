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

