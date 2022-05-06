(load "utils.lisp")

(defstruct rns base n m b)

(defun new-rns (base)
  (let* ((n (reduce #'* base))
         (m (mapcar #'(lambda (x) (/ n x)) base))
         (b (mapcar #'(lambda (mi basei) (sol mi basei)) m base)))
      (make-rns :base base :n n :m m :b b)))

(defun dec-to-rns (num rns)
  (mapcar #'(lambda (x) (mod num x)) (rns-base rns)))

(defun rns-to-dec (rns-num rns)
  (mod
    (reduce #'+
      (mapcar
        #'(lambda (xi mi bi) (* xi mi bi))
        rns-num
        (rns-m rns)
        (rns-b rns)))
    (rns-n rns)))

; tests

(ql:quickload "fiveam")

(defvar base (new-rns '(2 3 5 7)))

(defvar base2 (new-rns '(2 3 5 7 11 13)))

; tests:sol

(fiveam:test sol
  (fiveam:is (equalp (sol 35 3) 2))
  (fiveam:is (equalp (sol 21 5) 1))
  (fiveam:is (equalp (sol 15 7) 1)))

; tests:sol

; tests:dec-to-rns

(fiveam:test dec-to-rns
  (fiveam:is (equalp (dec-to-rns 10 base) '(0 1 0 3)))
  (fiveam:is (equalp (dec-to-rns -1 base) '(1 2 4 6)))
  (fiveam:is (equalp (dec-to-rns 128 base) '(0 2 3 2)))
  (fiveam:is (equalp (dec-to-rns 10 base2) '(0 1 0 3 10 10)))
  (fiveam:is (equalp (dec-to-rns -2 base2) '(0 1 3 5 9 11)))
  (fiveam:is (equalp (dec-to-rns 17128 base2) '(0 1 3 6 1 7))))

; tests:dec-to-rns

; tests:rns-to-dec

(fiveam:test rns-to-dec
  (fiveam:is (equalp (rns-to-dec (dec-to-rns 10 base) base) 10))
  (fiveam:is (equalp (rns-to-dec (dec-to-rns -1 base) base) 209))
  (fiveam:is (equalp (rns-to-dec (dec-to-rns 128 base) base) 128))
  (fiveam:is (equalp (rns-to-dec (dec-to-rns 10 base2) base2) 10))
  (fiveam:is (equalp (rns-to-dec (dec-to-rns -2 base2) base2) 30028))
  (fiveam:is (equalp (rns-to-dec (dec-to-rns 17128 base2) base2) 17128)))

; tests:rns-to-dec

(fiveam:run!)

; tests
