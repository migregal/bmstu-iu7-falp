(defun my-reverse-internal (lst res)
  (cond ((null lst) res)
        ((my-reverse-internal (cdr lst) (cons (car lst) res)))) )

(defun my-reverse (lst)
  (my-reverse-internal lst ()))
