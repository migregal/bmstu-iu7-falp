(defun square-lst (lst)
  (cond
    ((null lst) Nil)
    ((cons
      (* (car lst) (car lst))
      (square-lst (cdr lst))))))

(defun square-lst-tail-internal (lst res)
  (cond
    ((null lst) res)
    ((square-lst-tail-internal (cdr lst) (cons (* (car lst) (car lst)) res)))))

(defun square-lst-tail (lst)
  (square-lst-tail-internal lst ()))
