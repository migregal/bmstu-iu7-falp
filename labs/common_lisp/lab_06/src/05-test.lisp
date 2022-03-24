(load "05.lisp")

(ql:quickload "fiveam")

; sqrlist

(fiveam:test sqrlist-1
  (fiveam:is (equalp (sqrlist '()) '())))

(fiveam:test sqrlist-2
  (fiveam:is (equalp (sqrlist '(1)) '(1))))

(fiveam:test sqrlist-3
  (fiveam:is (equalp (sqrlist '(1 2)) '(1 4))))

(fiveam:test sqrlist-4
  (fiveam:is (equalp (sqrlist '(1 2 3)) '(1 4 9))))

; sqrlist

; (fiveam:run!)
