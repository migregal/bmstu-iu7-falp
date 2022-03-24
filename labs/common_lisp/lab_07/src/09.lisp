(defun first-odd (lst)
  (cond
    ((null lst) nil)
    ((numberp (car lst))
      (cond
        ((oddp (car lst)) (car lst))
        ((first-odd (cdr lst)))))
    ((consp (car lst))
      (first-odd (cons (caar lst) (cons (cdar lst) (cdr lst)))))
    ((first-odd (cdr lst)))))
