(defun rec-nth (n lst)
  (cond
    ((null lst) nil)
    ((= n 0) (car lst))
    ((rec-nth (- n 1) (cdr lst)))))
