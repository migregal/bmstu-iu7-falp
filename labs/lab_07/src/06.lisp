(defun rec-add-internal (lst sum)
  (cond
    ((null lst) sum)
    ((rec-add-internal
      (cdr lst)
      (cond
        ((numberp (car lst)) (+ sum (car lst)))
        (sum))))))

(defun rec-add (lst)
	(rec-add-internal lst 0))

(defun compl-rec-add-internal (lst sum)
  (cond
    ((null lst) sum)
    ((numberp (car lst))
      (compl-rec-add-internal (cdr lst) (+ sum (car lst))))
    ((null (car lst))
      (compl-rec-add-internal (cdr lst) sum))
    ((compl-rec-add-internal
      (cons (caar lst) (cons (cdar lst) (cdr lst)))
      sum))))

(defun compl-rec-add (lst)
  (compl-rec-add-internal lst 0))

; (compl-rec-add '(1 2 3 (4 5 (6))))
