(defun set-values (lst i1 i2 v1 v2)
  (cond
    ((not lst) nil)
    ((and (minusp i1) (minusp i2)) lst)
    (T
      (cons
        (cond
          ((zerop i1) v1)
          ((zerop i2) v2)
          (T (car lst)))
        (set-values (cdr lst) (- i1 1) (- i2 1) v1 v2)))))

(defun swap-two-ellement (i1 i2 lst)
  (cond
    ((not (listp lst)) lst)
    ((= i1 i2) lst)
    (T (set-values lst i1 i2 (nth i2 lst) (nth i1 lst)))))
