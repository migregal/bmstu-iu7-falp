(defun swap-to-left-append (lst)
  (and
    lst
    (listp lst)
    (let ((el (car lst)))
    (append (cdr lst) (list el)))))

(defun swap-to-left (lst)
  (and
    lst
    (listp lst)
    (let ((tail (cdr lst)) (head (car lst)))
      (nreverse (cons head (reverse tail))))))

(defun swap-to-right (lst)
  (and
    lst
    (listp lst)
    (let ((last-el (car (last lst))))
      (nreverse (cdr (reverse (cons last-el lst)))))))
