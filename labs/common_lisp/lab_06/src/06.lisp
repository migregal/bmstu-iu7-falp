(defun select-between (from to lst)
  (mapcan #'(lambda (el)
              (and (< el to) (> el from) (list el)))
          lst))


(defun select-between-internal (from to lst acc)
  (cond ((null lst) acc)
        ((let ((head (car lst)))
          (select-between-internal
            from
            to
            (cdr lst)
            (cond
              ((and (< head to) (> head from)) (cons head acc))
              (acc)))))))

(defun select-between-rec (from to lst)
  (reverse (select-between-internal from to lst nil)))
