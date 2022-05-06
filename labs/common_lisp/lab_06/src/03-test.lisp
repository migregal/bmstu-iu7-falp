(load "03.lisp")

(ql:quickload "fiveam")

; palindrom

(fiveam:test palindrom-1
  (fiveam:is (palindromp '())))

(fiveam:test palindrom-2
  (fiveam:is (palindromp '(1))))

(fiveam:test palindrom-3
  (fiveam:is (palindromp '(1 2 1))))

(fiveam:test palindrom-4
  (fiveam:is (palindromp '(1 a b b c b b a 1))))

(fiveam:test not-palindrom-1
  (fiveam:is (not (palindromp '(1 2)))))

(fiveam:test not-palindrom-2
  (fiveam:is (not (palindromp '(1 a)))))

; palindrom

; (fiveam:run!)
