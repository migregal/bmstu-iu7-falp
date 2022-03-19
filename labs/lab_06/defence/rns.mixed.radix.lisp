(load "utils.lisp")

(defstruct rns base n)

(defun new-rns (base)
  (make-rns :base (make-array (length base) :initial-contents base) :n (length base)))

(defvar base (new-rns '(3 5 7)))

(defun dec-to-rns (num rns)
  (mapcar #'(lambda (x) (mod num x)) (rns-base rns)))

(defun get-a-a (rns arr x_i j p_i)
  (cond
    ((minusp j) x_i)
    ((*
      (solver (aref (rns-base rns) j) p_i)
      (- (get-a-a rns arr x_i (1- j) p_i) (aref arr j))))))

(defun get-a (rns-num rns arr i)
  (cond
    ((zerop i) (car rns-num))
    ((not (zerop (aref arr i))) (aref arr i))
    ((mod
      (*
        (solver
          (aref (rns-base rns) (1- i))
          (aref (rns-base rns) i))
        (-
          (get-a-a rns arr (nth i rns-num) (- i 2) (aref (rns-base rns) i))
          (get-a rns-num rns arr (1- i))))
      (aref (rns-base rns) i)
    ))
  )
)

(defun temp-int (rns-num rns res cur)
  (cond
    ((eq cur (rns-n rns)) res)
    ((and
      (setf
        (aref res cur)
        (get-a rns-num rns res cur))
      (temp-int rns-num rns res (1+ cur))
      res
      ))))

(defun temp (rns-num rns)
  (temp-int rns-num rns (make-array (rns-n rns)) 0))

; (temp '(1 0) base)

; (temp '(2 3 1) base)
