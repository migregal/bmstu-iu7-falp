(defvar m1 '((1.00  -1.00  4.5)
             (2.00   1.00  2.00)
             (-2.00  3.00  2.00)))

(defvar v1 '(-5.00 -7.00 -1.00))

(defvar m2 '((16.0d0  14.0d0  14.0d0  8.0d0   8.0d0   0.0d0   14.0d0  19.0d0  12.0d0  29.0d0  6.0d0   13.0d0  20.0d0  12.0d0  23.0d0  2.0d0   3.0d0   30.0d0  21.0d0  13.0d0)
             (14.0d0  1.0d0   0.0d0   11.0d0  3.0d0   3.0d0   13.0d0  1.0d0   11.0d0  29.0d0  24.0d0  14.0d0  11.0d0  29.0d0  17.0d0  3.0d0   5.0d0   28.0d0  20.0d0  1.0d0 )
             (10.0d0  4.0d0   7.0d0   9.0d0   9.0d0   25.0d0  30.0d0  8.0d0   0.0d0   23.0d0  25.0d0  19.0d0  28.0d0  20.0d0  7.0d0   1.0d0   30.0d0  2.0d0   3.0d0   17.0d0)
             (21.0d0  9.0d0   9.0d0   11.0d0  20.0d0  7.0d0   21.0d0  12.0d0  5.0d0   19.0d0  24.0d0  3.0d0   0.0d0   10.0d0  28.0d0  24.0d0  1.0d0   4.0d0   11.0d0  2.0d0 )
             (23.0d0  10.0d0  30.0d0  12.0d0  14.0d0  1.0d0   16.0d0  5.0d0   17.0d0  20.0d0  30.0d0  4.0d0   13.0d0  25.0d0  22.0d0  10.0d0  6.0d0   23.0d0  22.0d0  24.0d0)
             (12.0d0  28.0d0  3.0d0   14.0d0  7.0d0   17.0d0  7.0d0   1.0d0   22.0d0  12.0d0  16.0d0  13.0d0  13.0d0  11.0d0  21.0d0  13.0d0  5.0d0   28.0d0  4.0d0   30.0d0)
             (19.0d0  13.0d0  21.0d0  27.0d0  30.0d0  27.0d0  9.0d0   6.0d0   11.0d0  13.0d0  11.0d0  10.0d0  3.0d0   1.0d0   7.0d0   8.0d0   11.0d0  0.0d0   19.0d0  27.0d0)
             (20.0d0  17.0d0  19.0d0  20.0d0  17.0d0  17.0d0  24.0d0  17.0d0  25.0d0  3.0d0   6.0d0   29.0d0  6.0d0   10.0d0  10.0d0  18.0d0  21.0d0  23.0d0  30.0d0  4.0d0 )
             (16.0d0  27.0d0  17.0d0  12.0d0  25.0d0  8.0d0   22.0d0  12.0d0  24.0d0  20.0d0  2.0d0   6.0d0   10.0d0  16.0d0  14.0d0  3.0d0   29.0d0  11.0d0  10.0d0  21.0d0)
             (27.0d0  8.0d0   23.0d0  3.0d0   7.0d0   14.0d0  29.0d0  3.0d0   22.0d0  7.0d0   20.0d0  5.0d0   15.0d0  6.0d0   7.0d0   8.0d0   4.0d0   8.0d0   18.0d0  26.0d0)
             (9.0d0   16.0d0  2.0d0   23.0d0  7.0d0   1.0d0   12.0d0  3.0d0   23.0d0  20.0d0  23.0d0  6.0d0   9.0d0   23.0d0  25.0d0  13.0d0  12.0d0  3.0d0   8.0d0   5.0d0 )
             (3.0d0   28.0d0  20.0d0  22.0d0  28.0d0  28.0d0  28.0d0  12.0d0  14.0d0  27.0d0  3.0d0   17.0d0  22.0d0  21.0d0  1.0d0   20.0d0  25.0d0  5.0d0   15.0d0  23.0d0)
             (11.0d0  11.0d0  17.0d0  9.0d0   24.0d0  12.0d0  24.0d0  13.0d0  10.0d0  17.0d0  2.0d0   28.0d0  30.0d0  7.0d0   20.0d0  27.0d0  22.0d0  29.0d0  5.0d0   4.0d0 )
             (28.0d0  3.0d0   8.0d0   28.0d0  7.0d0   17.0d0  18.0d0  24.0d0  8.0d0   23.0d0  30.0d0  27.0d0  5.0d0   1.0d0   29.0d0  20.0d0  14.0d0  21.0d0  11.0d0  0.0d0 )
             (8.0d0   13.0d0  3.0d0   14.0d0  7.0d0   14.0d0  23.0d0  16.0d0  26.0d0  13.0d0  8.0d0   5.0d0   16.0d0  0.0d0   11.0d0  7.0d0   19.0d0  24.0d0  4.0d0   11.0d0)
             (22.0d0  6.0d0   7.0d0   18.0d0  26.0d0  26.0d0  27.0d0  15.0d0  6.0d0   11.0d0  19.0d0  24.0d0  28.0d0  23.0d0  26.0d0  11.0d0  20.0d0  14.0d0  17.0d0  17.0d0)
             (22.0d0  20.0d0  5.0d0   12.0d0  24.0d0  25.0d0  14.0d0  1.0d0   9.0d0   15.0d0  23.0d0  15.0d0  24.0d0  22.0d0  23.0d0  20.0d0  27.0d0  2.0d0   20.0d0  2.0d0 )
             (13.0d0  1.0d0   29.0d0  16.0d0  0.0d0   1.0d0   28.0d0  15.0d0  18.0d0  23.0d0  0.0d0   18.0d0  18.0d0  29.0d0  10.0d0  0.0d0   12.0d0  15.0d0  5.0d0   10.0d0)
             (13.0d0  15.0d0  26.0d0  10.0d0  6.0d0   9.0d0   5.0d0   6.0d0   26.0d0  25.0d0  22.0d0  19.0d0  24.0d0  1.0d0   3.0d0   18.0d0  2.0d0   26.0d0  7.0d0   27.0d0)
             (18.0d0  22.0d0  12.0d0  19.0d0  7.0d0   23.0d0  0.0d0   22.0d0  21.0d0  10.0d0  30.0d0  1.0d0   28.0d0  15.0d0  30.0d0  10.0d0  8.0d0   28.0d0  2.0d0   0.0d0 )))

(defvar v2 '(7.0d0 11.0d0 24.0d0 1.0d0 26.0d0 1.0d0 20.0d0 24.0d0 4.0d0 27.0d0 16.0d0 6.0d0 21.0d0 15.0d0 9.0d0 15.0d0 8.0d0 12.0d0 11.0d0 12.0d0))

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
        (cdr res)
        )))))

; tests

(ql:quickload "fiveam")

(defun floats-rougly-equal-p (f1 f2 &optional (precision 1e-6))
  (< (abs (- f1 f2)) precision))

(defun float-lists-eq (l1 l2)
  (every (lambda (a b) (floats-rougly-equal-p a b)) l1 l2))


; rotate180

(fiveam:test rotate180-1
  (fiveam:is (equalp (rotate180 '((1))) '((1)))))

(fiveam:test rotate180-2
  (fiveam:is (equalp (rotate180 '((1) (2))) '((2) (1)))))

(fiveam:test rotate180-3
  (fiveam:is (equalp (rotate180 '((1 2) (3 4))) '((4 3) (2 1)))))

(fiveam:test rotate180-4
  (fiveam:is (equalp
                (rotate180 '((1 2 3) (4 5 6) (7 8 9)))
                '((9 8 7) (6 5 4) (3 2 1)))))

; rotate180

; get-diagonal-matrix

(fiveam:test get-diagonal-matrix-1
  (fiveam:is (equalp (get-diagonal-matrix '((1)) '(2)) '(((1)) 2))))

(fiveam:test get-diagonal-matrix-2
  (fiveam:is (equalp
                (get-diagonal-matrix '((1 2) (3 4)) '(2 5))
                '(((-2/3 0) (0 1/2)) -1/3 1/2))))

; get-diagonal-matrix

; reduce-to-triangle

(fiveam:test reduce-to-triangle-1
  (fiveam:is (equalp (reduce-to-triangle '() '()) '(nil))))

(fiveam:test reduce-to-triangle-2
  (fiveam:is (equalp (reduce-to-triangle '(1) '(1)) '((1) 1))))

(fiveam:test reduce-to-triangle-3
  (fiveam:is (equalp (reduce-to-triangle '((1)) '(2)) '(((1)) 2))))

(fiveam:test reduce-to-triangle-4
  (fiveam:is (equalp
                (reduce-to-triangle '((1) (3)) '(2 4))
                '(((1) (0)) 2 -2/3))))

(fiveam:test reduce-to-triangle-5
  (fiveam:is (equalp
                (reduce-to-triangle '((1 1) (2 3)) '(2 3))
                '(((1 1) (0 1/2)) 2 -1/2))))

; reduce-to-triangle

; gauss

(fiveam:test gauss-1
  (fiveam:is (equalp (gauss '((1)) '(2)) '(2))))

(fiveam:test gauss-2
  (fiveam:is (equalp (gauss '((1 2) (3 4)) '(2 5)) '(1 1/2))))

(fiveam:test gauss-3
  (fiveam:is (float-lists-eq (gauss m1 v1) '(-2.05 -1.1 -0.9))))

; gauss

; (fiveam:run!)
