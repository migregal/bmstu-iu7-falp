(defun palindromp (lst)
  (every #'= lst (reverse lst)))
