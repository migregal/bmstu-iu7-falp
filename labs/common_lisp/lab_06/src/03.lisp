(defun palindromp (lst)
  (every #'equal lst (reverse lst)))
