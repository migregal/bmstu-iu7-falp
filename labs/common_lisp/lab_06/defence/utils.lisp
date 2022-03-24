(defun sol (a b &optional (c 1) (x 1))
  (let ((cx (mod (* a x) b)))
    (cond
      ((equal cx c) x)
      ((> x b) nil)
      ((sol a b c (1+ x))))))
