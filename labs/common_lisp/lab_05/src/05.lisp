(defun replace-nth (lst i newelem)
  (cond
    ((null lst) nil)
    ((zerop i) (cons newelem (cdr lst)))
    ((cons (car lst) (replace-nth (cdr lst) (- i 1) newelem)))))

(defun swap-two-ellement (i1 i2 lst)
  (cond
    ((= i1 i2) lst)
    ((replace-nth
      (replace-nth lst i2 (nth i1 lst))
      i1
      (nth i2 lst)))))
