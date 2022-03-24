(load "04.lisp")

(ql:quickload "fiveam")

; set-equal

(fiveam:test set-equal-1
  (fiveam:is (set-equal '() '())))

(fiveam:test set-equal-2
  (fiveam:is (set-equal '(1) '(1))))

(fiveam:test set-equal-3
  (fiveam:is (set-equal '(1 2 3) '(3 1 2))))

(fiveam:test set-equal-4
  (fiveam:is (set-equal '(1 a 3) '(3 1 a))))

(fiveam:test not-set-equal-1
  (fiveam:is (not (set-equal '(1 2 3) '(4)))))

(fiveam:test not-set-equal-2
  (fiveam:is (not (set-equal '(1 2 3) '(4 5)))))

(fiveam:test not-set-equal-3
  (fiveam:is (not (set-equal '(1 2 3) '(4 6)))))

; set-equal

; (fiveam:run!)
