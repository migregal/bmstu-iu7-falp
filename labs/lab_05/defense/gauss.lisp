(load "utils.lisp")

(defun normalize-by (value lst)
  (mapcar #'(lambda (l) (funcall #'/ l value)) lst))

(defun extract-vector (m)
  (cons (mapcar #'car m) (mapcar #'cdr m)))

(defun get-first-non-zero-i (m i &optional (res 0))
  (cond
    ((null m) nil)
    ((let
      ((el (nth i (car m))))
      (cond
        ((floats-rougly-equal-p el 0.0 1e-6)
          (get-first-non-zero-i (cdr m) i (1+ res)))
        (t res))))))

(defun move-zeroed-from-top (m v n)
  (cond
    ((null (cdr m)) nil)
    ((floats-rougly-equal-p (nth n (car m)) 0.0 1e-6)
      (let ((idx (1+ (get-first-non-zero-i (cdr m) n))))
        (or (rotatef (nth 0 m) (nth idx m))
            (rotatef (nth 0 v) (nth idx v)))))))

(defun zerofy-col (m v rel rel-v col_i)
  (extract-vector
    (mapcar
      #'(lambda (r b)
          (let ((r-frst (nth col_i r)))
            (cond ((zerop r-frst) (cons r b))
                  ((cons
                      (mapcar #'- (normalize-by r-frst r) rel)
                      (- (/ b r-frst) rel-v))))))
      (cdr m)
      (cdr v))))

(defun reduce-to-triangle-internal (m v &optional (n 0))
  (move-zeroed-from-top m v n)
  (let ((rel-car (nth n (car m))))
    (cond
      ((null (cdr m))
        (cons
          (cons (normalize-by rel-car (car m)) nil)
          (cons (/ (car v) rel-car) nil)))
      ((let*
        ((norm-rel (normalize-by rel-car (car m)))
         (vec-car  (/ (car v) rel-car))
         (s (zerofy-col m v norm-rel vec-car n))
         (res (reduce-to-triangle-internal (car s) (cdr s) (1+ n))))
        (cons
          (cons norm-rel (car res))
          (cons vec-car (cdr res))))))))


(defun reduce-to-triangle (m v)
  (reduce-to-triangle-internal (copy-list m) (copy-list v)))

(defun transose (m)
  (apply `mapcar `list m))

(defun rotate180 (m)
  (reverse (transose (reverse (transose m)))))

(defun get-diagonal-matrix (m v)
  (let ((res (reduce-to-triangle m v)))
    (reduce-to-triangle (rotate180 (car res)) (reverse (cdr res)))))

(defun gauss (m v)
  (reverse (cdr (get-diagonal-matrix m v))))
