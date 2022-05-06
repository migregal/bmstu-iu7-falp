man_by_car(Mark, Color, Surname, City, Phone, Bank) :-
      car(Surname, Mark, Color, _),
      person(Surname, Phone, addr(City, _, _, _)),
      bank_depositor(Surname, Bank, _, _).

person("Andreev", "+79999999999", addr("Moscow", "Lesnaya", 12, 2)).
person("Borisov", "+71111111111", addr("Moscow", "Lesnaya", 13, 87)).
person("Dmitriev", "+73333333333", addr("Ekaterinburg", "Kamennaya", 13, 87)).
person("Fedorov", "+66666666666", addr("Moscow", "Hospital'naya", 123, 87)).

car("Andreev", "bmw", "green", 1000).
car("Andreev", "volkswagen", "red", 10000).
car("Dmitriev", "lada", "black", 20000).
car("Fedorov", "lada", "black", 20000).
car("Fedorov", "opel", "white", 10).

bank_depositor("Andreev", "Sber", 22, 1000).
bank_depositor("Borisov", "Sber", 33, 10000).
bank_depositor("Dmitriev", "Alfa", 44, 20000).
bank_depositor("Fedorov", "Sber", 238, 10).
bank_depositor("Borisob", "Maze", 1, 10000).
