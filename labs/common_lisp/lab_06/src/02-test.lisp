(load "02.lisp")

(ql:quickload "fiveam")

; mult-all-numbers

(fiveam:test mult-all-numbers-1
  (fiveam:is (equalp (mult-all-numbers 2 '()) '())))

(fiveam:test mult-all-numbers-2
  (fiveam:is (equalp (mult-all-numbers 2 '(1)) '(2))))

(fiveam:test mult-all-numbers-3
  (fiveam:is (equalp (mult-all-numbers 3 '(1 2 3)) '(3 6 9))))

; mult-all-numbers

; compl-mult-all-numbers

(fiveam:test compl-mult-all-numbers-1
  (fiveam:is (equalp (compl-mult-all-numbers 2 '()) '())))

(fiveam:test compl-mult-all-numbers-2
  (fiveam:is (equalp (compl-mult-all-numbers 2 '(1)) '(2))))

(fiveam:test compl-mult-all-numbers-3
  (fiveam:is (equalp (compl-mult-all-numbers 3 '(1 2 3)) '(3 6 9))))

(fiveam:test compl-mult-all-numbers-4
  (fiveam:is (equalp (compl-mult-all-numbers 3 '(1 (2 . 3) 4)) '(3 (6 . 9) 12))))

(fiveam:test compl-mult-all-numbers-5
  (fiveam:is (equalp (compl-mult-all-numbers 3 '(1 (2 . 3) 4)) '(3 (6 . 9) 12))))

(fiveam:test compl-mult-all-numbers-6
  (fiveam:is (equalp (compl-mult-all-numbers 3 '(1 ((2 . 3) . 4) 4)) '(3 ((6 . 9) . 12) 12))))

(fiveam:test compl-mult-all-numbers-7
  (fiveam:is (equalp (compl-mult-all-numbers 3 '(1 (2 3 . 4) 4)) '(3 (6 9 . 12) 12))))

(fiveam:test compl-mult-all-numbers-8
  (fiveam:is (equalp (compl-mult-all-numbers 3 '(1 (2 3 4) 4)) '(3 (6 9 12) 12))))

; compl-mult-all-numbers


; (fiveam:run!)
