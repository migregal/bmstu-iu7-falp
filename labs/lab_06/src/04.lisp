(defun my-subsetp (s1 s2)
  (every
    #'(lambda (a) (some #'(lambda (b) (= a b)) s2))
    s1))

; (defun my-subsetp (set1 set2)
;   (reduce
;     #'(lambda (acc1 set1-el)
;       (and acc1 (reduce
;         #'(lambda (acc2 set2-el)
;           (or acc2 (= set2-el set1-el))) set2 :initial-value Nil)))
;   set1 :initial-value T))

(defun set-equal (set1 set2)
  (cond
    ((/= (length set1) (length set2)) nil)
    ((my-subsetp set1 set2) (my-subsetp set2 set1))))
