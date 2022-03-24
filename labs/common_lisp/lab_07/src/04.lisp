(defun mulall-internal (lst num res)
  (cond ((null lst) res)
        ((mulall-internal
            (cdr lst)
            num
            (cons (* num (car lst)) res)))))

(defun mulall (lst num)
  (mulall-internal lst num ()))

; (mulall '(1 2 3 4 5) 2)

(defun mulall-internal (lst num res)
  (cond
    ((null lst) res)
    ((symbolp (car lst))
      (mulall-internal (cdr lst) num (cons (car lst) res)))
    ((numberp (car lst))
      (mulall-internal
        (cdr lst)
        num
        (cons (* num (car lst)) res)))
    ((consp (car lst))
      (mulall-internal
        (cdr lst)
        num
        (cons
          (mulall-internal (car lst) num ())
          res)))))

(defun mulall (lst num)
  (mulall-internal lst num ()))


; (mulall '((1 2 3) 4 5 6) 2)
; (defun mulall (lst num)
; (cond ((null lst) ())
;       ((symbolp (car lst))
;         (cons (car lst) (mulall (cdr lst) num)))
;       ((listp (car lst))
;         (cons
;           (mulall (car lst) num)
;           (mulall (cdr lst) num)))
;       ((cons
;         (* num (car lst))
;         (mulall (cdr lst) num)))))

; (mulall '(1 2 (a 2 3) 3 4 5 (b)) 2)
