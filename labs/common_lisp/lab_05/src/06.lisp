(defun swap-to-left (lst)
  (cond
    (lst (let ((tail (cdr lst)) (head (car lst)))
         (nreverse (cons head (reverse tail)))))))

(defun swap-to-right (lst)
  (cond
    (lst (let ((last-el (car (last lst))))
         (nreverse (cdr (reverse (cons last-el lst))))))))
