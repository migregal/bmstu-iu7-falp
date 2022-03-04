(defun swap-to-left (lst)
  (let ((el (car lst)))
    (append (cdr lst) (list el))))

(defun swap-to-left (lst)
  (and
    lst
    (let ((tail (cdr lst)) (head (car lst)))
      (nreverse (cons head (reverse tail))))))

(defun swap-to-right (lst)
  (and lst
    (let ((last-el (car (last lst))))
      (nreverse (cdr (reverse (cons last-el lst)))))))
