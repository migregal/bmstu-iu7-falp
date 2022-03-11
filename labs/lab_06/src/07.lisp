(defun decart (lstA lstB)
    (mapcan #'(lambda (a)
                (mapcar #'(lambda (b)
                            (list x y)) lstB))
                                        lstA))

(defun decart-internal (cur-lst1 src-lst1 lst2 acc)
  (cond ((null lst2) acc)
        ((null cur-lst1) (decart-internal src-lst1 src-lst1 (cdr lst2) acc))
        ((decart-internal (cdr cur-lst1) src-lst1 lst2 (cons (cons (car cur-lst1) (car lst2)) acc)))))

(defun decart-rec (lst1 lst2)
  (and lst1 lst2 (reverse (decart-internal lst1 lst1 lst2 nil))))
