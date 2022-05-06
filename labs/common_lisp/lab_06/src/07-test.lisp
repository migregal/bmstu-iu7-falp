(load "07.lisp")

(ql:quickload "fiveam")

; decart

(fiveam:test decart-tests-1
  (fiveam:is (equal (decart '() '()) nil)))

(fiveam:test decart-tests-2
  (fiveam:is (equal (decart '(1) '(1)) '((1 1)))))

(fiveam:test decart-tests-3
  (fiveam:is (equal (decart '(1 2) '(1)) '((1 1) (2 1)))))

(fiveam:test decart-tests-4
  (fiveam:is (equal (decart '(1 2) '(1 a)) '((1 1) (1 A) (2 1) (2 A)))))

; decart

; decart-rec

(fiveam:test decart-rec-tests-1
  (fiveam:is (equal (decart-rec '() '()) nil)))

(fiveam:test decart-rec-tests-2
  (fiveam:is (equal (decart-rec '(1) '(1)) '((1 . 1)))))

(fiveam:test decart-rec-tests-3
  (fiveam:is (equal (decart-rec '(1 2) '(1)) '((1 . 1) (2 . 1)))))

(fiveam:test decart-rec-tests-4
  (fiveam:is (equal
                (decart-rec '(1 2) '(1 a))
                '((1 . 1) (1 . A) (2 . 1) (2 . A)))))

; decart-rec

; (fiveam:run!)
