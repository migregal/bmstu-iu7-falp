(defun set-equal-subset (lst1 lst2)
  (and
    (listp lst1)
    (listp lst2)
    (subsetp lst2 lst1)
    (subsetp lst1 lst2)
  )
)

(defun is-entry (el lst)
  (and
    (listp lst)
    (cond
      ( (null lst) nil )
      ( (eq el (car lst)) T )
      ( T (is-entry el (cdr lst)) )
    )
  )
)

(defun contains (lst1 lst2)
  (and
    (listp lst1)
    (listp lst2)
    (cond
      ( (null lst1) T )
      ( (is-entry (car lst1) lst2) (contains (cdr lst1) lst2))
      ( T nil )
    )
  )
)

(defun set-equal (lst1 lst2)
  (and
    (listp lst1)
    (listp lst2)
    (cond
      ( (and (null lst1) (null lst2) ) T )
      ( (or (null lst1) (null lst2) ) nil )
      ( T (and (contains lst1 lst2) (contains lst2 lst1)) )
    )
  )
)
