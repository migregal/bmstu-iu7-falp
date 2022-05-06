(load "08.lisp")

(ql:quickload "fiveam")

; mult-all-numbers

(fiveam:test mult-all-numbers-tests-1
  (fiveam:is (equal (mult-all-numbers nil nil) nil )))

(fiveam:test mult-all-numbers-tests-2
  (fiveam:is (equal (mult-all-numbers 1 nil) nil )))

(fiveam:test mult-all-numbers-tests-3
  (fiveam:is (equal (mult-all-numbers nil '(1 2 3)) '(1 2 3) )))

(fiveam:test mult-all-numbers-tests-4
  (fiveam:is (equal (mult-all-numbers 2 '(1 2 3)) '(2 4 6) )))

; mult-all-numbers

; compl-mult-all-numbers

(fiveam:test compl-mult-all-numbers-tests-1
  (fiveam:is (equal (compl-mult-all-numbers nil nil) nil )))

(fiveam:test compl-mult-all-numbers-tests-2
  (fiveam:is (equal (compl-mult-all-numbers 1 nil) nil )))

(fiveam:test compl-mult-all-numbers-tests-3
  (fiveam:is (equal (compl-mult-all-numbers nil '(1 2 3)) '(1 2 3) )))

(fiveam:test compl-mult-all-numbers-tests-4
  (fiveam:is (equal (compl-mult-all-numbers 2 '(1 2 3)) '(2 4 6) )))

(fiveam:test compl-mult-all-numbers-tests-5
  (fiveam:is (equal (compl-mult-all-numbers 2 '(1 2 a)) '(2 4 a) )))

(fiveam:test compl-mult-all-numbers-tests-6
  (fiveam:is (equal (compl-mult-all-numbers 2 '((1 2) 3)) '((2 4) 6) )))

(fiveam:test compl-mult-all-numbers-tests-7
  (fiveam:is (equal (compl-mult-all-numbers 2 '(1 (1 2) 3)) '(2 (2 4) 6) )))

(fiveam:test compl-mult-all-numbers-tests-8
  (fiveam:is (equal (compl-mult-all-numbers 2 '((1) (1 2) (3) (4 5 6))) '((2) (2 4) (6) (8 10 12)) )))

; compl-mult-all-numbers

; (fiveam:run!)
