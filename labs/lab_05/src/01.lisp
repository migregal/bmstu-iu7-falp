(defun polyndromp-reverse (lst)
  (equal lst (reverse lst)))

(defun reversed (lst)
  `(,@(reversed (cdr lst)) ,(car lst)))

(defun polyndromp (lst)
  (equal lst (reversed lst)))
