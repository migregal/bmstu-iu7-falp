; (zip '((1 2 3) (4 5 6) (7 8 ))) ===> ((1 4 7) (2 5 8) (3 6 9))

(defun min-len (lst)
    (cond
        ((null (car lst)) 0)
        ((null (cdr lst)) (length (car lst)))
        (t (min
            (length (car lst))
            (min-len (cdr lst))))))

(defun my-mapcar-internal (fn arg n)
    (and
        arg
        (cons
            (funcall fn (subseq (car arg) 0 n))
            (my-mapcar-internal fn (cdr arg) n))))

(defun my-mapcar (fn arg)
    (let ((len (min-len arg)))
        (and
            arg
            (my-mapcar-internal fn arg len))))

(defun zip (lists)
    (and
        lists
        (if (null (car lists))
            ()
            (cons (my-mapcar #'car lists) (zip (my-mapcar #'cdr lists))))))
