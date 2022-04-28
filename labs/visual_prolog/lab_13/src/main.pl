total_price(L, Total) :-
  own_price(L, building, Price1),
  own_price(L, sector, Price2),
  own_price(L, ship, Price3),
  own_price(L, car, Price4),
  Total = Price1 + Price2 + Price3 + Price4.

own_price(L, building, Price) :- own(L,  building(Price, _)), !.
own_price(L, sector, Price) :- own(L,  sector(Price, _)), !.
own_price(L, ship, Price) :- own(L,  ship(Price, _)), !.
own_price(L, car, Price) :- own(L,  car(_, _, Price)), !.
own_price(_, _, 0).

own_type(L, building, Price) :- own(L,  building(Price, _)).
own_type(L, sector, Price) :- own(L,  sector(Price, _)).
own_type(L, ship, Price) :- own(L,  ship(Price, _)).
own_type(L, car, Price) :- own(L,  car(_, _, Price)).

person("Andreev", "+79999999999", address("Moscow", "Lesnaya", 12, 2)).
person("Borisov", "+71111111111", address("Moscow", "Lesnaya", 13, 87)).
person("Dmitriev", "+73333333333", address("Ekaterinburg", "Kamennaya", 13, 87)).
person("Fedorov", "+66666666666", address("Moscow", "Hospital'naya", 123, 87)).

own("Andreev", car("bmw", "green", 1000)).
own("Borisov", sector(300000, 3000)).
own("Dmitriev", car("lada", "black", 20000)).
own("Dmitriev", ship(20000, "black")).
own("Fedorov", car("lada", "black", 20000)).
own("Fedorov", building(200000, 120)).

bank_depositor("Andreev", "Sber", 22, 1000).
bank_depositor("Borisov", "Sber", 33, 10000).
bank_depositor("Dmitriev", "Alfa", 44, 20000).
bank_depositor("Fedorov", "Sber", 238, 10).
bank_depositor("Borisov", "Maze", 1, 10000).
