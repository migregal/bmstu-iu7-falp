(defun insert (lst ins)
  (cond
   ((member ins lst :test `equal) lst)
   (T (cons ins lst))))
