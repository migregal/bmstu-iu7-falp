(defun nswap-first-last (lst)
  (cond
    (lst (let ((el1 (car lst)) (last-el (last lst)))
           (setf (car lst) (car last-el))
           (setf (car last-el) el1)
           lst))))

(defun swap-first-last (lst)
  (let ((el1 (car lst)) (last-el (car (last lst))))
    (nreverse
      (cons el1 (cdr (reverse (cons last-el (cdr lst))))))))
