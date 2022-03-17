(defun normalize-by (value lst)
  (mapcar #'(lambda (l) (funcall #'/ l value)) lst))

(defun extract-vector (m)
  (cons (mapcar #'car m) (mapcar #'cdr m)))

(defun reduce-to-triangle (m v)
  (cond ((null (cdr m)) (cons m v ))
    ((let*
      ((first-a   (find-if-not #'zerop (car m)))
       (vector-a  (/ (car v) first-a))
       (first-row (normalize-by first-a (car m)))
       (s (extract-vector
            (mapcar
              #'(lambda (r b)
                  (let ((first-b (find-if-not #'zerop r)))
                    (cons
                      (mapcar #'- (normalize-by first-b r) first-row)
                      (- (/ b first-b) vector-a))))
              (cdr m)
              (cdr v))))
        (res (reduce-to-triangle (car s) (cdr s))))
      (cons
        (cons (car m) (car res))
        (cons (car v) (cdr res)))))))

(defun transose (m)
  (apply `mapcar `list m))

(defun rotate180 (m)
  (reverse (transose (reverse (transose m)))))

(defun get-diagonal-matrix (m v)
  (let ((res (reduce-to-triangle m v)))
    (reduce-to-triangle (rotate180 (car res)) (reverse (cdr res)))))

(defun gauss (m v)
  (catch 'result
    (reverse
      (let ((res (get-diagonal-matrix m v)))
      (mapcar
        #'(lambda (r b)
          (let ((pivot (find-if-not #'zerop r)))
                (if pivot (/ b pivot) (throw 'result 'singular))))
        (car res)
        (cdr res))))))

; tests

(ql:quickload "fiveam")

(load "3x3.lisp")
(load "5x5.lisp")
(load "10x10.lisp")
(load "20x20.lisp")

(defun floats-rougly-equal-p (f1 f2 &optional (precision 1e-4))
  (< (abs (- f1 f2)) precision))

(defun float-lists-eq (l1 l2)
  (every (lambda (a b) (floats-rougly-equal-p a b)) l1 l2))

(defun float-matrix-eq (m1 m2)
  (every (lambda (ra rb) (float-lists-eq ra rb)) m1 m2))

; rotate180

(fiveam:test rotate180
  (fiveam:is (equalp (rotate180 '((1))) '((1))))
  (fiveam:is (equalp (rotate180 '((1) (2))) '((2) (1))))
  (fiveam:is (equalp (rotate180 '((1 2) (3 4))) '((4 3) (2 1))))
  (fiveam:is (equalp
                (rotate180 m3x3)
                '((2.0 3.0 -2.0) (2.0 1.0 2.0) (4.5 -1.0 1.0)))))

; rotate180

; get-diagonal-matrix

(fiveam:test get-diagonal-matrix
  (fiveam:is (equalp (get-diagonal-matrix '((1)) '(2)) '(((1)) 2)))
  (fiveam:is (equalp
                (get-diagonal-matrix '((1 2) (3 4)) '(2 5))
                '(((-2/3 0) (0 1/2)) -1/3 1/2)))
  (fiveam:is (float-matrix-eq (car (get-diagonal-matrix m3x3 v3x3)) m3x3diagonal))
  (fiveam:is (float-matrix-eq (car (get-diagonal-matrix m5x5 v5x5)) m5x5diagonal))
  (fiveam:is (float-matrix-eq (car (get-diagonal-matrix m10x10 v10x10)) m10x10diagonal))
)

; (car (get-diagonal-matrix m20x20 v20x20))

; get-diagonal-matrix

; reduce-to-triangle

(fiveam:test reduce-to-triangle
  (fiveam:is (equalp (reduce-to-triangle '() '()) '(nil)))
  (fiveam:is (equalp (reduce-to-triangle '(1) '(1)) '((1) 1)))
  (fiveam:is (equalp (reduce-to-triangle '((1)) '(2)) '(((1)) 2)))
  (fiveam:is (equalp
                (reduce-to-triangle '((1) (3)) '(2 4))
                '(((1) (0)) 2 -2/3)))
  (fiveam:is (equalp
                (reduce-to-triangle m3x3 v3x3)
                (cons m3x3tr v3x3tr)))
  (fiveam:is (float-matrix-eq (car (reduce-to-triangle m5x5 v5x5)) m5x5tr))
  (fiveam:is (float-lists-eq (cdr (reduce-to-triangle m5x5 v5x5)) v5x5tr))
  (fiveam:is (float-matrix-eq (car (reduce-to-triangle m10x10 v10x10)) m10x10tr))
  (fiveam:is (float-lists-eq (cdr (reduce-to-triangle m10x10 v10x10)) v10x10tr))
)

; reduce-to-triangle

; gauss

(fiveam:test gauss
  (fiveam:is (equalp (gauss '((1)) '(2)) '(2)))
  (fiveam:is (equalp (gauss '((1 2) (3 4)) '(2 5)) '(1 1/2)))
  (fiveam:is (float-lists-eq (gauss m3x3 v3x3) solution3x3))
  (fiveam:is (float-lists-eq (gauss m5x5 v5x5) solution5x5))
  (fiveam:is (float-lists-eq (gauss m10x10 v10x10) solution10x10))
  (fiveam:is (float-lists-eq (gauss m20x20 v20x20) solution20x20))
)

; gauss

(fiveam:run!)
