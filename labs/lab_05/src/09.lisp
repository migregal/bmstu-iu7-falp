(defun get-n (n lst acc)
  (cond ((or (null lst) (<= n 0)) (nreverse acc))
  (T (get-n (- n 1) (cdr lst) (cons (car lst) acc)))))

(defun select-between (from to lst)
  (sort (get-n (+ (- to from) 1) (nthcdr from lst) Nil) #'<))
