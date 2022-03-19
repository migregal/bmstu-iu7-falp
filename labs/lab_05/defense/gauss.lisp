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


(defun reduce-to-triangle-internal (m v n)
  (move-zeroed-from-top m v n)
  (cond
    ((null (cdr m))
      (let ((el (nth n (car m))))
        (cons
          (cons (normalize-by el (car m)) nil)
          (cons (/ (car v) el) nil))))
    ((let*
      ((first-a  (nth n (car m)))
      (vector-a  (/ (car v) first-a))
      (first-row (normalize-by first-a (car m)))
      (s (extract-vector
            (mapcar
              #'(lambda (r b)
                  (let ((first-b (nth n r)))
                    (cond ((zerop first-b) (cons r b))
                          ((cons
                              (mapcar #'- (normalize-by first-b r) first-row)
                              (- (/ b first-b) vector-a))))))
              (cdr m)
              (cdr v))))
        (res (reduce-to-triangle-internal (car s) (cdr s) (1+ n))))
      (cons
        (cons first-row (car res))
        (cons vector-a (cdr res)))))))


(defun reduce-to-triangle (m v)
  (reduce-to-triangle-internal (copy-list m) (copy-list v) 0))

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
