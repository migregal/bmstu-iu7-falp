(load "02.lisp")

(ql:quickload "fiveam")

; set-equal-subset

(fiveam:test equal-sets-subset-1
  (fiveam:is (set-equal-subset `() `())))

(fiveam:test equal-sets-subset-2
  (fiveam:is (set-equal-subset `(1) `(1))))

(fiveam:test equal-sets-subset-3
  (fiveam:is (set-equal-subset `(1 a) `(1 a))))

(fiveam:test equal-sets-subset-4
  (fiveam:is (set-equal-subset `(1 a) `(a 1))))

(fiveam:test equal-sets-subset-5
  (fiveam:is (set-equal-subset `(1 a a a) `(1 a 1 1))))

(fiveam:test not-equal-sets-subset-1
  (fiveam:is (not (set-equal-subset `(1) `(2)))))

(fiveam:test not-equal-sets-subset-2
  (fiveam:is (not (set-equal-subset `(a) `(2)))))

(fiveam:test not-equal-sets-subset-3
  (fiveam:is (not (set-equal-subset `(1) `(b)))))

(fiveam:test not-equal-sets-subset-4
  (fiveam:is (not (set-equal-subset `(1 a) `(2 b)))))

(fiveam:test not-equal-sets-subset-5
  (fiveam:is (not (set-equal-subset `(1 a) `(2 1)))))

; set-equal-subset

; set-equal

(fiveam:test equal-sets-1
  (fiveam:is (set-equal `() `())))

(fiveam:test equal-sets-2
  (fiveam:is (set-equal `(1) `(1))))

(fiveam:test equal-sets-3
  (fiveam:is (set-equal `(1 a) `(1 a))))

(fiveam:test equal-sets-4
  (fiveam:is (set-equal `(1 a) `(a 1))))

(fiveam:test equal-sets-5
  (fiveam:is (set-equal `(1 a a a) `(1 a 1 1))))

(fiveam:test not-sets-1
  (fiveam:is (not (set-equal `(1) 2))))

(fiveam:test not-sets-2
  (fiveam:is (not (set-equal `(a) 2))))

(fiveam:test not-sets-3
  (fiveam:is (not (set-equal `(1) `a))))

(fiveam:test not-equal-sets-1
  (fiveam:is (not (set-equal `(1) `(2)))))

(fiveam:test not-equal-sets-2
  (fiveam:is (not (set-equal `(a) `(2)))))

(fiveam:test not-equal-sets-3
  (fiveam:is (not (set-equal `(1) `(b)))))

(fiveam:test not-equal-sets-4
  (fiveam:is (not (set-equal `(1 a) `(2 b)))))

(fiveam:test not-equal-sets-5
  (fiveam:is (not (set-equal `(1 a) `(2 1)))))

; set-equal

; (fiveam:run!)
