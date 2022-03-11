; (defvar m1 '((1.00 0.00 0.00  0.00  0.00   0.00   -0.01)
;              (1.00 0.63 0.39  0.25  0.16   0.10    0.61)
;              (1.00 1.26 1.58  1.98  2.49   3.13    0.91)
;              (1.00 1.88 3.55  6.70 12.62  23.80    0.99)
;              (1.00 2.51 6.32 15.88 39.90 100.28    0.60)
;              (1.00 3.14 9.87 31.01 97.41 306.02    0.02)))

(defvar m1 '((1.00 -1.00  -5.00)
             (2.00  1.00  -7.00)))

(defmacro mapcar-1 (fn n lst)
  `(mapcar #'(lambda (l) (funcall ,fn ,n l)) ,lst) )

(defun reduce-to-triangular-form (m)
  (cond
    ((null (cdr m)) m)
    ((cons
      (car m)
      (mapcar-1
        #'cons
        0
        (reduce-to-triangular-form
          (mapcar
            #'cdr
            (mapcar
              #'(lambda (r)
                (mapcar #'- (mapcar-1 #'* (caar m) r)
                            (mapcar-1 #'* (car r) (car m))))
              (cdr m)))))))))

(defun reflect (m)
  (reverse (mapcar #'(lambda (r) (append (reverse (butlast r)) (last r))) m)))

(defun get-diagonal-matrix (m)
  (reduce-to-triangular-form (reflect (reduce-to-triangular-form m))))

(defun gauss (m)
  (catch 'result
    (reverse
      (mapcar
        #'(lambda (r)
          (let ((pivot (find-if-not #'zerop r)))
                (if pivot (/ (car (last r)) pivot) (throw 'result 'singular))))
        (get-diagonal-matrix m)))))
