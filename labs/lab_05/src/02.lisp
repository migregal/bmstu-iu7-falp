(defun set-equal-subset (lst1 lst2)
    (cond ((subsetp lst2 lst1) (subsetp lst1 lst2))))

(defun is-entry (el lst)
  (cond
    ((not lst) nil)
    ((not (listp lst)) nil)
    ((eq el (car lst)) T)
    ((is-entry el (cdr lst)))))

(defun contains (lst1 lst2)
  (cond
    ((null lst1) T)
    ((is-entry (car lst1) lst2) (contains (cdr lst1) lst2))))

(defun set-equal (lst1 lst2)
  (cond
    ((null lst1) (null lst2))
    ((and (contains lst1 lst2) (contains lst2 lst1)))))
