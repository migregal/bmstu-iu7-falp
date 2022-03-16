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

(ql:quickload "fiveam")

; reduce-to-triangular-form

(fiveam:test reduce-to-triangular-form-1
  (fiveam:is (equalp (reduce-to-triangular-form '()) '())))

(fiveam:test reduce-to-triangular-form-2
  (fiveam:is (equalp (reduce-to-triangular-form '(1)) '(1))))

(fiveam:test reduce-to-triangular-form-3
  (fiveam:is (equalp (reduce-to-triangular-form '((1))) '((1)))))

(fiveam:test reduce-to-triangular-form-4
  (fiveam:is (equalp (reduce-to-triangular-form '((1 2))) '((1 2)))))

(fiveam:test reduce-to-triangular-form-5
  (fiveam:is (equalp
                (reduce-to-triangular-form '((1 2) (3 4)))
                '((1 2) (0 -2)))))

(fiveam:test reduce-to-triangular-form-6
  (fiveam:is (equalp
                (reduce-to-triangular-form '((1 1 2) (2 3 3)))
                '((1 1 2) (0 1 -1)))))

; reduce-to-triangular-form

; reflect

(fiveam:test reflect-1
  (fiveam:is (equalp (reflect `()) nil)))

(fiveam:test reflect-2
  (fiveam:is (equalp (reflect `(())) '(nil))))

(fiveam:test reflect-3
  (fiveam:is (equalp (reflect `((1))) '((1)))))

(fiveam:test reflect-4
  (fiveam:is (equalp (reflect `((1 2))) '((1 2)))))

(fiveam:test reflect-5
  (fiveam:is (equalp (reflect `((1) (2))) '((2) (1)))))

(fiveam:test reflect-6
  (fiveam:is (equalp (reflect `((1 2) (3 5))) '((3 5) (1 2)))))

(fiveam:test reflect-7
  (fiveam:is (equalp (reflect `((1 2 3))) '((2 1 3)))))

(fiveam:test reflect-8
  (fiveam:is (equalp (reflect `((1 2 3) (4 5 6))) '((5 4 6) (2 1 3)))))

; reflect

; get-diagonal-matrix

(fiveam:test get-diagonal-matrix-1
  (fiveam:is (equalp (get-diagonal-matrix '()) nil)))

(fiveam:test get-diagonal-matrix-2
  (fiveam:is (equalp (get-diagonal-matrix '(())) '(nil))))

(fiveam:test get-diagonal-matrix-3
  (fiveam:is (equalp (get-diagonal-matrix '((1))) '((1)))))

(fiveam:test get-diagonal-matrix-4
  (fiveam:is (equalp (get-diagonal-matrix '((1 2))) '((1 2)))))

(fiveam:test get-diagonal-matrix-5
  (fiveam:is (equalp (get-diagonal-matrix '((1 2) (3 4))) '((0 -2) (0 2)))))

(fiveam:test get-diagonal-matrix-6
  (fiveam:is (equalp
                (get-diagonal-matrix '((1 2 2) (3 4 5)))
                '((-2 0 -1) (0 -2 -2)))))

; get-diagonal-matrix

; gauss

(fiveam:test gauss-1
  (fiveam:is (equalp (gauss '()) nil)))

(fiveam:test gauss-2
  (fiveam:is (equalp (gauss '((1 2))) '(2))))

(fiveam:test gauss-3
  (fiveam:is (equalp (gauss '((1 2 2) (3 4 5))) '(1 1/2))))

; gauss

; (fiveam:run!)
