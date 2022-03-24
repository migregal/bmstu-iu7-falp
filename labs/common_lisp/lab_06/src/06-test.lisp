(load "06.lisp")

(ql:quickload "fiveam")

; select-between

(fiveam:test select-between-tests-1
  (fiveam:is (equal (select-between 0 0 nil) nil)))

(fiveam:test select-between-tests-2
  (fiveam:is (equal (select-between 0 1 nil) nil)))

(fiveam:test select-between-tests-3
  (fiveam:is (equal (select-between 0 0 '(1)) nil)))

(fiveam:test select-between-tests-4
  (fiveam:is (equal (select-between 0 1 '(1)) nil)))

(fiveam:test select-between-tests-5
  (fiveam:is (equal (select-between 0 2 '(1)) '(1))))

(fiveam:test select-between-tests-6
  (fiveam:is (equal (select-between 1 3 '(1 2 3 4 5 6)) '(2))))

(fiveam:test select-between-tests-7
  (fiveam:is (equal (select-between 1 5 '(1 2 3 4 5 6)) '(2 3 4))))

; select-between

; select-between-rec

(fiveam:test select-between-rec-tests-1
  (fiveam:is (equal (select-between-rec 0 0 nil) nil)))

(fiveam:test select-between-rec-tests-2
  (fiveam:is (equal (select-between-rec 0 1 nil) nil)))

(fiveam:test select-between-rec-tests-3
  (fiveam:is (equal (select-between-rec 0 0 '(1)) nil)))

(fiveam:test select-between-rec-tests-4
  (fiveam:is (equal (select-between-rec 0 1 '(1)) nil)))

(fiveam:test select-between-rec-tests-5
  (fiveam:is (equal (select-between-rec 0 2 '(1)) '(1))))

(fiveam:test select-between-rec-tests-6
  (fiveam:is (equal (select-between-rec 1 3 '(1 2 3 4 5 6)) '(2))))

(fiveam:test select-between-rec-tests-7
  (fiveam:is (equal (select-between-rec 1 5 '(1 2 3 4 5 6)) '(2 3 4))))

; select-between-rec

; (fiveam:run!)
