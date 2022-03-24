(defun alloddr (lst)
  (cond
    ((null lst) T)
    ((oddp (car lst)) (alloddr (cdr lst)))))

(defun compl-alloddr (lst)
  (cond
    ((null lst) T)
    ((symbolp (car lst)) (compl-alloddr (cdr lst)))
    ((listp (car lst)) (and (compl-alloddr (car lst)) (compl-alloddr (cdr lst))))
    ((evenp (car lst)) nil)
    ((compl-alloddr (cdr lst)))))
