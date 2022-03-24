(load "09.lisp")

(ql:quickload "fiveam")

; sum-lens

(fiveam:test sum-lens-tests-1
  (fiveam:is (equal (sum-lens '()) 0)))

(fiveam:test sum-lens-tests-2
  (fiveam:is (equal (sum-lens '((1))) 1)))

(fiveam:test sum-lens-tests-3
  (fiveam:is (equal (sum-lens '((1 2) (3 4))) 4)))

; sum-lens

; sum-lens-rec

(fiveam:test sum-lens-rec-tests-1
  (fiveam:is (equal (sum-lens-rec '()) 0)))

(fiveam:test sum-lens-rec-tests-2
  (fiveam:is (equal (sum-lens-rec '((1))) 1)))

(fiveam:test sum-lens-rec-tests-3
  (fiveam:is (equal (sum-lens-rec '((1 2) (3 4))) 4)))

; sum-lens-rec

; (fiveam:run!)
