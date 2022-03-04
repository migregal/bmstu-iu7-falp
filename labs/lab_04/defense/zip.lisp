; (zip '((1 2 3) (4 5 6) (7 8 9))) ===> ((1 4 7) (2 5 8) (3 6 9))

(defun my-mapcar (fn arg)
    (and arg (cons (funcall fn (car arg)) (my-mapcar fn (cdr arg)))))

(defun zip (lists)
    (and
        lists
        (if (null (car lists))
            ()
            (cons (my-mapcar #'car lists) (zip (my-mapcar #'cdr lists))))))
