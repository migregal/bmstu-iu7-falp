(defun insert (lst ins)
  (cond
    ((member ins lst :test `equal) lst)
    ((cons ins lst))))
