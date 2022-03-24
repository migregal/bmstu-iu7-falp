(defun select-between-internal (from to lst acc)
  (cond ((null lst) acc)
        ((let ((head (car lst)))
          (cond ((and (< head to) (> head from))
                 (select-between-internal from to (cdr lst) (cons head acc)))
                ((select-between-internal from to (cdr lst) acc)))))))

(defun select-between-rec (from to lst)
  (reverse (select-between-internal from to lst nil)))

(defun all-between-internal (lst a b result)
  (cond
    ((null lst) result)
    ((all-between-internal
        (cdr lst)
        a
        b
        (cond
          ((cond
            ((>= (car lst) a) (<= (car lst) b)))
             (cons (car lst) result))
          (result))))))

(defun all-between (lst a b)
  (all-between-internal lst a b nil))
