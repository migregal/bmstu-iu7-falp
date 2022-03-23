(defun sol (a b &optional (c 1) (x 1))
  (let ((cx (mod (* a x) b)))
    (cond
      ((equal cx c) x)
      ((> x b) nil)
      ((sol a b c (1+ x))))))

(defstruct rns base n)

(defun new-rns (base)
  (make-rns :base (make-array (length base) :initial-contents base) :n (length base)))

(defun dec-to-rns (num rns)
  (map 'vector #'(lambda (x) (mod num x)) (rns-base rns)))

(defun gen-prefix (rns i &optional (cur 0))
    (cond ((zerop i) 1)
          (`(sol
                ,(aref (rns-base rns) cur)
                ,(aref (rns-base rns) i)))))

(declaim (ftype (function (vector rns number) t) gen-formula))

(defun gen-formula-int (rns-num rns i &optional (res (aref rns-num i)) (j (1- i)))
    (cond
      ((minusp j) res)
      ((gen-formula-int
        rns-num
        rns
        i
        `(*
            ,(gen-prefix rns i (- i j 1))
            ,`(-
                ,res
                ,(gen-formula rns-num rns (- i j 1))))
        (1- j)))))

(defun gen-formula (rns-num rns i)
    (cond ((zerop i) (aref rns-num 0))
          (`(mod
                ,(gen-formula-int rns-num rns i)
                ,(aref (rns-base rns) i)
            ))))

(defun gen-i (rns-num rns i &optional (res '()))
  (cond ((zerop i)
          (cond
            ((null res) 1)
            ((null (cdr res)) (car res))
            (t `(* ,@res))))
        ((gen-i
          rns-num
          rns
          (1- i)
          (cons
            (aref (rns-base rns) (1- i))
            res)))))

(defun rns-to-dec-int (rns-num rns &optional (cur 0) (res '()))
  (cond ((< cur (rns-n rns))
          (rns-to-dec-int
            rns-num
            rns
            (1+ cur)
            (cons
              `(*
                  ,(gen-i rns-num rns cur)
                  ,(gen-formula rns-num rns cur)
               )
              res)
          )
        )
        (t (reverse res))))

(defun rns-to-dec (rns-num rns)
  ; (print `(+ ,@(rns-to-dec-int rns-num rns)))
  (eval `(+ ,@(rns-to-dec-int rns-num rns))))

; tests

(ql:quickload "fiveam")

(defvar base0 (new-rns '(3 5 7)))

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
  (fiveam:is (equalp (dec-to-rns 10 base) '#(0 1 0 3)))
  (fiveam:is (equalp (dec-to-rns -1 base) '#(1 2 4 6)))
  (fiveam:is (equalp (dec-to-rns 128 base) '#(0 2 3 2)))
  (fiveam:is (equalp (dec-to-rns 10 base2) '#(0 1 0 3 10 10)))
  (fiveam:is (equalp (dec-to-rns -2 base2) '#(0 1 3 5 9 11)))
  (fiveam:is (equalp (dec-to-rns 17128 base2) '#(0 1 3 6 1 7))))

; tests:dec-to-rns

; tests:gen-formula-int

(fiveam:test gen-formula-int
  (fiveam:is (equalp
                (gen-formula-int #(0 1 0 3) base 1)
                '(* (SOL 2 3) (- 1 0))))
  (fiveam:is (equalp
                (gen-formula-int #(0 1 0 3) base 2)
                '(* (SOL 3 5) (- (* (SOL 2 5) (- 0 0)) (MOD (* (SOL 2 3) (- 1 0)) 3)))))
)

; tests:gen-formula-int

; tests:gen-prefix

(fiveam:test gen-prefix
  (fiveam:is (equalp (gen-prefix base 0) 1))
  (fiveam:is (equalp (gen-prefix base 1) '(SOL 2 3)))
  (fiveam:is (equalp (gen-prefix base 2) '(SOL 2 5))))

; tests:gen-prefix

; tests:gen-formula

(fiveam:test gen-formula
  (fiveam:is (equalp
              (gen-formula #(2 3 1) base0 0)
              2))
  (fiveam:is (equalp
              (gen-formula #(2 3 1) base0 1)
              '(MOD (* (SOL 3 5) (- 3 2)) 5)))
    (fiveam:is (equalp
              (gen-formula #(2 3 1) base0 2)
              '(MOD (* (SOL 5 7) (- (* (SOL 3 7) (- 1 2)) (MOD (* (SOL 3 5) (- 3 2)) 5))) 7))))

; tests:gen-formula

; tests:gen-i


(fiveam:test gen-i
  (fiveam:is (equalp
              (gen-i #(2 3 1) base0 0)
              1))
  (fiveam:is (equalp
              (gen-i #(2 3 1) base0 1)
              3))
  (fiveam:is (equalp
              (gen-i #(2 3 1) base0 2)
              '(* 3 5))))

; tests:gen-i

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
