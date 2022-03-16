(defun sum-lens (list-of-lists)
  (reduce #'(lambda (acc lst) (+ acc (length lst)))
          list-of-lists :initial-value 0))

(defun sum-lens-rec-internal (lol acc)
  (cond ((null lol) acc)
        (T (sum-lens-rec-internal (cdr lol) (+ acc (length (car lol)))))))

(defun sum-lens-rec (list-of-lists)
  (cond ((listp list-of-lists) (sum-lens-rec-internal list-of-lists 0))))
