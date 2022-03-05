(load "07.lisp")

(ql:quickload "fiveam")

; insert

(fiveam:test insert-tests-1
  (fiveam:is (equal (insert nil nil) nil )))

(fiveam:test insert-tests-2
  (fiveam:is (equal (insert '(1 2 3) nil) '(1 2 3) )))

(fiveam:test insert-tests-3
  (fiveam:is (equal (insert '((1 2) (3 4)) '(1 2)) '((1 2) (3 4)) )))

(fiveam:test insert-tests-4
  (fiveam:is (equal (insert '((1 2) (3 4)) '(1 3)) '((1 3) (1 2) (3 4)) )))

; insert

; (fiveam:run!)
