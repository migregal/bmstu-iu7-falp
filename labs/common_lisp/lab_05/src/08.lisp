(defun mult-all-numbers (mult lst)
  (mapcar #'(lambda (el) (* el mult)) lst))

(defun compl-mult-all-numbers (mult lst)
  (mapcar
    #'(lambda (obj)
        (cond ((numberp obj) (* obj mult))
              ((listp obj) (compl-mult-all-numbers mult obj))
              (obj)))
    lst))
