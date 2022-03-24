(defun get-n (n lst acc)
  (cond ((or (null lst) (<= n 0)) acc)
  ((get-n (1- n) (cdr lst) (cons (car lst) acc)))))

(defun select-between (from to lst)
  (sort (get-n (1+ (- to from)) (nthcdr from lst) Nil) #'<))
