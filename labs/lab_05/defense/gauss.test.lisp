(load "gauss.lisp")

(ql:quickload "fiveam")

(load "3x3.lisp")
(load "5x5.lisp")
(load "10x10.lisp")
(load "20x20.lisp")
(load "20x20.2.lisp")
(load "40x40.lisp")
(load "100x100.lisp")

; rotate180

(fiveam:test rotate180
  (fiveam:is (equalp (rotate180 '((1))) '((1))))
  (fiveam:is (equalp (rotate180 '((1) (2))) '((2) (1))))
  (fiveam:is (equalp (rotate180 '((1 2) (3 4))) '((4 3) (2 1))))
  (fiveam:is (equalp
                (rotate180 m3x3)
                '((2.0 3.0 -2.0) (2.0 1.0 2.0) (4.5 -1.0 0.0)))))

; rotate180

; get-diagonal-matrix

(fiveam:test get-diagonal-matrix
  (fiveam:is (equalp (get-diagonal-matrix '((1)) '(2)) '(((1)) 2)))
  (fiveam:is (equalp
                (get-diagonal-matrix '((1 2) (3 4)) '(2 5))
                '(((1 0) (0 1)) 1/2 1)))
  (fiveam:is (float-matrix-eq (car (get-diagonal-matrix m3x3 v3x3)) m3x3diagonal))
  (fiveam:is (float-matrix-eq (car (get-diagonal-matrix m5x5 v5x5)) m5x5diagonal))
  (fiveam:is (float-matrix-eq (car (get-diagonal-matrix m10x10 v10x10)) m10x10diagonal)))

; get-diagonal-matrix

; reduce-to-triangle

(fiveam:test reduce-to-triangle
  (fiveam:is (equalp (reduce-to-triangle '((1)) '(2)) '(((1)) 2)))
  (fiveam:is (equalp
                (reduce-to-triangle m3x3 v3x3)
                (cons m3x3tr v3x3tr)))
  (fiveam:is (float-matrix-eq (car (reduce-to-triangle m5x5 v5x5)) m5x5tr))
  (fiveam:is (float-lists-eq (cdr (reduce-to-triangle m5x5 v5x5)) v5x5tr))
  (fiveam:is (float-matrix-eq (car (reduce-to-triangle m10x10 v10x10)) m10x10tr))
  (fiveam:is (float-lists-eq (cdr (reduce-to-triangle m10x10 v10x10)) v10x10tr)))

; reduce-to-triangle

; gauss

(fiveam:test gauss
  (fiveam:is (equalp (gauss '((1)) '(2)) '(2)))
  (fiveam:is (equalp (gauss '((1 2) (3 4)) '(2 5)) '(1 1/2)))
  (fiveam:is (float-lists-eq (gauss m3x3 v3x3) solution3x3))
  (fiveam:is (float-lists-eq (gauss m5x5 v5x5) solution5x5))
  (fiveam:is (float-lists-eq (gauss m10x10 v10x10) solution10x10))
  (fiveam:is (float-lists-eq (gauss m20x20 v20x20) solution20x20))
  (fiveam:is (float-lists-eq (gauss m20x20.2 v20x20.2) solution20x20.2))
  (fiveam:is (float-lists-eq (gauss m40x40 v40x40) solution40x40))
  (fiveam:is (float-lists-eq (gauss m100x100 v100x100) solution100x100)))

; gauss

(fiveam:run!)
