(load "05.lisp")

(ql:quickload "fiveam")

; swap-two-ellement

(fiveam:test swap-tests-1
  (fiveam:is (equal (swap-two-ellement 0 0 nil) nil )))

(fiveam:test swap-tests-2
  (fiveam:is (equal (swap-two-ellement 0 0 'a) 'a )))

(fiveam:test swap-tests-3
  (fiveam:is (equal (swap-two-ellement 200 0 '()) nil )))

(fiveam:test swap-tests-4
  (fiveam:is (equal (swap-two-ellement 0 200 '()) nil )))

(fiveam:test swap-tests-5
  (fiveam:is (equal (swap-two-ellement 100 101 '(1 2 3)) '(1 2 3) )))

(fiveam:test swap-tests-6
  (fiveam:is (equal (swap-two-ellement 0 0 '()) '() )))

(fiveam:test swap-tests-7
  (fiveam:is (equal (swap-two-ellement 1 2 '()) '() )))

(fiveam:test swap-tests-8
  (fiveam:is (equal (swap-two-ellement 0 0 '(1)) '(1) )))

(fiveam:test swap-tests-9
  (fiveam:is (equal (swap-two-ellement 0 1 '(1)) '(Nil) )))

(fiveam:test swap-tests-10
  (fiveam:is (equal (swap-two-ellement 0 1 '(1 2)) '(2 1) )))

(fiveam:test swap-tests-11
  (fiveam:is (equal (swap-two-ellement 0 2 '(1 2 3)) '(3 2 1) )))

(fiveam:test swap-tests-12
  (fiveam:is (equal (swap-two-ellement 1 3 '(1 2 3 4 5)) '(1 4 3 2 5) )))

; swap-two-ellement

; (fiveam:run!)
