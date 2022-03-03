(defun polyndromp-reverse (lst)
  (and
    (listp lst)
    (equal lst (reverse lst))
  )
)

(defun reversed (lst)
  (and
    (listp lst)
    (cond
      ( (null lst) nil )
      ( T (append (reversed (cdr lst)) (list (car lst))) )
    )
  )
)

(defun polyndromp (lst)
  (and
    (listp lst)
    (equal lst (reversed lst))
  )
)
