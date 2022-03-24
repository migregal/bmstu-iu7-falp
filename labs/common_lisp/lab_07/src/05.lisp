(defun check-border (x a b)
  (and (>= x a) (<= x b)) )

(defun select-between (lst a b)
  (cond
    ((null lst) ())
    ((check-border (car lst) a b)
      (cons (car lst) (select-between (cdr lst) a b)))
    ((select-between (cdr lst) a b))))

(defun compl-select-between (lst a b)
  (cond
    ((null lst) ())
    ((symbolp (car lst))
      (cons (car lst) (select-between (cdr lst) a b)))
    ((listp (car lst))
      (cons
        (select-between (car lst) a b)
        (select-between (cdr lst) a b)))
    ((check-border (car lst) a b)
      (cons (car lst) (select-between (cdr lst) a b)))
    ((select-between (cdr lst) a b))))
