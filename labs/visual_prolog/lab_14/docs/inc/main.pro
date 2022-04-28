domains
	name = symbol.
	sex = symbol.

predicates	
	parent(name, name, sex).
	grand(name, name, sex, sex).
	
clauses
	parent("Kira", "Ila", "w").
	parent("Kira", "Vitya", "m").
	
	parent("Vitya", "Elena", "w").
	parent("Vitya", "Mike", "m").
	
	parent("Ila", "Olya", "w").
	parent("Ila", "Tim", "m").
	
	grand(Child, NameGrandmother, Line, Sex) :- 
			parent(Child, NameParent, Line), 
			parent(NameParent, NameGrandmother, Sex).
		
goal
	% Grandmothers
	% grand("Kira", NameGrandmotherR, _, "w").
	
	% Grandfathers
	% grand("Kira", NameGrandfatheR, _, "m").
	
	% Grandmothers and grandfathers
	% grand("Kira", NameGrand, _, _).
	
	% Maternal grandmother
	% grand("Kira", NameGrandmotherR, "w", "w").
	
	% Maternal grandparents
	grand("Kira", NameGrandmotherR, "w", _).
