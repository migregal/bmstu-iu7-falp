domains
  name = string
  phone = integer
  surname = string

predicates
  entry(phone, name, surname)

clauses
  entry(111, "Alexandr", "Alexandrov").
  entry(222, "Boris", "Borisov").
  entry(333, "Michail", "Michailov").
  entry(444, "Nicholay", "Nickolaev").
  entry(500, "Oleg", "Olegov").
  entry(888, "Oleg", "Petrosyan").

goal
  entry(Phone, "Oleg", Surname).*/

/* LAB 11(2) */

/*domains
  name, surname, university = string

predicates
  student(name, surname, university)

clauses
  student("Andrey", "Andreev", "BMSTU").
  student("Andrey", "Andreev", "MSU").
  student("Boris", "Borisov", "BMSTU").
  student("Dmitriy", "Dmitriev", "BMSTU").
  student("Fedor", "Fedorov", "MSU").
  student("Petr", "Petrov", "BMSTU").
  student("Nikolay", "Nikolaev", University) :- student("Andrey", "Andreev", University), student("Fedor", "Fedorov", University).

goal
  %student(Name, Surname, "MSU").
  %student("Andrey", "Andreev", University).
  %student(Name, Surname, "ITMO").
  student("Nikolay", "Nikolaev", University).
