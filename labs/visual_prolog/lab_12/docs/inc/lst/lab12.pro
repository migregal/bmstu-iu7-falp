domains
  surname = string
  city, street = string
  house, flat = integer
  phone = string
  address = addr(city, street, house, flat)
  mark = string
  color = string
  price = integer
  bank = string
  id, amount = integer
  
predicates
  person(surname, phone, address)
  car(surname, mark, color, price)
  bank_depositor(surname, bank, id, amount)
  car_by_phone(phone, surname, mark, price)
  only_mark_by_phone(phone, mark)
  data_by_surname_and_city(surname, city, street, bank, phone)
  
clauses
  person("Andreev", "+79999999999", addr("Moscow", "Lesnaya", 12, 2)).
  person("Borisov", "+71111111111", addr("Moscow", "Lesnaya", 13, 87)).
  person("Dmitriev", "+73333333333", addr("Ekaterinburg", "Kamennaya", 13, 87)).
  person("Fedorov", "+66666666666", addr("Moscow", "Hospital'naya", 123, 87)).

  car("Andreev", "bmw", "green", 1000).
  car("Andreev", "volkswagen", "red", 10000).
  car("Dmitriev", "lada", "black", 20000).
  car("Fedorov", "opel", "white", 10).

  bank_depositor("Andreev", "Sber", 22, 1000).
  bank_depositor("Borisov", "Sber", 33, 10000).
  bank_depositor("Dmitriev", "Alfa", 44, 20000).
  bank_depositor("Fedorov", "Sper", 238, 10).
  bank_depositor("Borisob", "Maze", 1, 10000).
  
  car_by_phone(Phone, Surname, Mark, Price) :- 
  	person(Surname, Phone, _), 
  	car(Surname, Mark, _, Price).

  only_mark_by_phone(Phone, Mark) :- car_by_phone(Phone, _, Mark, _).

  data_by_surname_and_city(Surname, City, Street, Bank, Phone) :- 
  	person(Surname, Phone, addr(City, Street, _, _)), 
  	bank_depositor(Surname, Bank, _, _).
  
goal
  %car_by_phone("+79999999999", Surname, Mark, Price).
  only_mark_by_phone("+79999999999", Mark).
  %data_by_surname_and_city("Borisov", "Moscow", Street, Bank, Phone).
  

