(load "utils.lisp")

(defstruct rns base n)

(defun new-rns (base)
  (make-rns :base (make-array (length base) :initial-contents base) :n (length base)))

(defun dec-to-rns (num rns)
  (map 'vector #'(lambda (x) (mod num x)) (rns-base rns)))

(defun get-a-a (rns arr x_i j p_i)
  (cond
    ((minusp j) x_i)
    ((*
      (solver (aref (rns-base rns) j) p_i)
      (- (get-a-a rns arr x_i (1- j) p_i) (aref arr j))))))

(defun get-a (rns-num rns arr i)
  (cond
    ((zerop i) (aref rns-num 0))
    ((not (zerop (aref arr i))) (aref arr i))
    ((mod
      (*
        (solver
          (aref (rns-base rns) (1- i))
          (aref (rns-base rns) i))
        (-
          (get-a-a rns arr (aref rns-num i) (- i 2) (aref (rns-base rns) i))
          (get-a rns-num rns arr (1- i))))
      (aref (rns-base rns) i)))))

(defun rns-to-dec-int (rns-num rns res cur)
  (cond
    ((eq cur (rns-n rns)) res)
    ((and
      (setf
        (aref res cur)
        (get-a rns-num rns res cur))
      (rns-to-dec-int rns-num rns res (1+ cur))))))

(defun first-n-prod (arr n &optional (initial-value 1))
  (cond ((zerop n) initial-value)
        ((first-n-prod arr (1- n) (* (aref arr (1- n)) initial-value)))))

(defun get-all-sum (arr rns &optional (n 0) (initial-value 0))
  (cond ((eq (rns-n rns) n) initial-value)
        ((get-all-sum
          arr
          rns
          (1+ n)
          (+
            initial-value
            (*
              (first-n-prod (rns-base rns) n)
              (aref arr n)))))))

(defun rns-to-dec (rns-num rns)
  (let
    ((arr (rns-to-dec-int rns-num rns (make-array (rns-n rns)) 0)))
    (get-all-sum arr rns)))

; tests

(ql:quickload "fiveam")

(defvar base (new-rns '(2 3 5 7)))

(defvar base2 (new-rns '(2 3 5 7 11 13)))

; tests:solver

(fiveam:test solver
  (fiveam:is (equalp (solver 35 3) 2))
  (fiveam:is (equalp (solver 21 5) 1))
  (fiveam:is (equalp (solver 15 7) 1)))

; tests:solver

; tests:dec-to-rns

(fiveam:test dec-to-rns
  (fiveam:is (equalp (dec-to-rns 10 base) '#(0 1 0 3)))
  (fiveam:is (equalp (dec-to-rns -1 base) '#(1 2 4 6)))
  (fiveam:is (equalp (dec-to-rns 128 base) '#(0 2 3 2)))
  (fiveam:is (equalp (dec-to-rns 10 base2) '#(0 1 0 3 10 10)))
  (fiveam:is (equalp (dec-to-rns -2 base2) '#(0 1 3 5 9 11)))
  (fiveam:is (equalp (dec-to-rns 17128 base2) '#(0 1 3 6 1 7))))

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
