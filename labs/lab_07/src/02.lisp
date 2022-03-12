(defun get-first-sublist (lst)
  (cond
    ((null lst) nil)
    ((cond ((listp (car lst)) (car lst))))
    ((get-first-sublist (cdr lst)))))
