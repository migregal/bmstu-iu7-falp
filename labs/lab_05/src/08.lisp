(defun mult-all-numbers (mult lst)
  (cond
    ((not (numberp mult)) lst)
    ((not (listp lst)) lst)
    (T (mapcar #'(lambda (el) (* el mult)) lst))))

(defun compl-mult-all-numbers (mult lst)
  (cond
    ((not (numberp mult)) lst)
    ((not (listp lst)) lst)
    (T (mapcar
      #'(lambda (el)
          (cond ((listp el) (compl-mult-all-numbers mult el))
                ((numberp el) (* el mult))
                (T el)))
      lst))))
