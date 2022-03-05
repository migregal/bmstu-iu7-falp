(defun insert (lst ins)
  (cond
    ((not lst) nil)
    ((not (listp lst)) lst)
    ((not ins) lst)
    ((member ins lst :test `equal) lst)
    (T (cons ins lst))))
