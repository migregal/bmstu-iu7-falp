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
        ((null el) (throw 'result 'wow))
        ((floats-rougly-equal-p el 0.0 1e-6)
          (get-first-non-zero-i (cdr m) i (1+ res)))
        (t res))))))

(defun replace-nth (lst i newelem)
  (cond
    ((null lst) nil)
    ((zerop i) (cons newelem (cdr lst)))
    ((cons (car lst) (replace-nth (cdr lst) (1- i) newelem)))))

(defun swap-two-ellement (i1 i2 lst)
  (cond
    ((= i1 i2) lst)
    ((replace-nth
      (replace-nth lst i2 (nth i1 lst))
      i1
      (nth i2 lst)))))

(defun move-zeroed-from-top (m v n)
  (cond
    ((null (cdr m)) (cons m v))
    ((floats-rougly-equal-p (nth n (car m)) 0.0 1e-6)
      (let ((idx (get-first-non-zero-i (cdr m) n)))
        (cond ((null idx) (throw 'result 'singular))
              ((cons
                (swap-two-ellement 0 (1+ idx) m)
                (swap-two-ellement 0 (1+ idx) v))))))
    (t (cons m v))))

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

(defun reduce-to-triangle-internal (m1 v1 n)
  (let* ((moved (move-zeroed-from-top m1 v1 n))
         (m (car moved))
         (v (cdr moved))
         (rel-car  (nth n (car m))))
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
  (reduce-to-triangle-internal m v 0))

(defun transose (m)
  (apply `mapcar `list m))

(defun rotate180 (m)
  (reverse (mapcar 'reverse m)))

(defun get-diagonal-matrix (m v)
  (let ((res (reduce-to-triangle m v)))
    (reduce-to-triangle (rotate180 (car res)) (reverse (cdr res)))))

(defun gauss (m v)
  (catch 'result
    (reverse (cdr (get-diagonal-matrix m v)))))
