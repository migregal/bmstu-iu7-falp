(load "01.lisp")

(ql:quickload "fiveam")

; minus10

(fiveam:test minus10-1
  (fiveam:is (equalp (minus10 '()) nil)))

(fiveam:test minus10-2
  (fiveam:is (equalp (minus10 '(1)) '(-9))))

(fiveam:test minus10-3
  (fiveam:is (equalp (minus10 '(1 2 3)) '(-9 -8 -7))))

; minus10

; (fiveam:run!)
