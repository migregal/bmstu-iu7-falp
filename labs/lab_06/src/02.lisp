(defun mult-all-numbers (mult lst)
  (mapcar #'(lambda (el) (* el mult)) lst))

(defun compl-mult-all-numbers (mult lst)
  (mapcar
    #'(lambda (el)
        (cond ((listp el) (compl-mult-all-numbers mult el))
              ((* el mult))))
    lst))
