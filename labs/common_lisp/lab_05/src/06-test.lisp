(load "06.lisp")

(ql:quickload "fiveam")

; swap-to-left

(fiveam:test swap-to-left-tests-1
  (fiveam:is (equal (swap-to-left nil) nil )))

(fiveam:test swap-to-left-tests-2
  (fiveam:is (equal (swap-to-left `(1)) `(1) )))

(fiveam:test swap-to-left-tests-3
  (fiveam:is (equal (swap-to-left `(1 2 3)) `(2 3 1) )))

; swap-to-left

; swap-to-right

(fiveam:test swap-to-right-tests-1
  (fiveam:is (equal (swap-to-right nil) nil )))

(fiveam:test swap-to-right-tests-2
  (fiveam:is (equal (swap-to-right `(1)) `(1) )))

(fiveam:test swap-to-right-tests-3
  (fiveam:is (equal (swap-to-right `(1 2 3)) `(3 1 2) )))

; swap-to-right

; (fiveam:run!)
