(defun mult-all-numbers (mult lst)
  (mapcar #'(lambda (el) (* el mult)) lst))

(defun compl-mult-all-numbers-rec (mult obj)
  (cond ((numberp obj) (* obj mult))
        ((consp obj)
          (cons
            (compl-mult-all-numbers-rec mult (car obj))
            (compl-mult-all-numbers-rec mult (cdr obj))))
        (obj)))

(defun compl-mult-all-numbers (mult lst)
  (mapcar #'(lambda (x) (compl-mult-all-numbers-rec mult x)) lst))
