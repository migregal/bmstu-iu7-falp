(defun floats-rougly-equal-p (f1 f2 &optional (precision 1e-4))
  (< (abs (- f1 f2)) precision))

(defun float-lists-eq (l1 l2)
  (every (lambda (a b) (floats-rougly-equal-p a b)) l1 l2))

(defun float-matrix-eq (m1 m2)
  (every (lambda (ra rb) (float-lists-eq ra rb)) m1 m2))

(defun identity-mat (n)
  (cond
    ((= n 1) (cons (cons 1 nil) nil))
    ((let
      ((r (identity-mat (1- n))))
      (cons
        (cons 1 (cons 0 (cdar r)))
        (mapcar #'(lambda (x) (cons 0 x)) r))))))
