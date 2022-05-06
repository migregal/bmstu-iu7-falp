(load "09.lisp")

(ql:quickload "fiveam")

; select-between

(fiveam:test select-between-tests-1
  (fiveam:is (equal (select-between 0 0 nil) nil )))

(fiveam:test select-between-tests-2
  (fiveam:is (equal (select-between 0 1 nil) nil )))

(fiveam:test select-between-tests-3
  (fiveam:is (equal (select-between 2 0 '(1)) nil )))

(fiveam:test select-between-tests-4
  (fiveam:is (equal (select-between 0 0 '(1)) '(1) )))

(fiveam:test select-between-tests-5
  (fiveam:is (equal (select-between 0 1 '(1)) '(1) )))

(fiveam:test select-between-tests-6
  (fiveam:is (equal (select-between 1 3 '(1 2 3 4 5 6)) '(2 3 4) )))

; select-between

; (fiveam:run!)
