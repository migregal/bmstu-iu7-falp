(load "04.lisp")

(defvar test_lst '(a b c d e f))

(ql:quickload "fiveam")

; swap-first-last

(fiveam:test swap-tests-1
  (fiveam:is (equal (swap-first-last '()) '() )))

(fiveam:test swap-tests-2
  (fiveam:is (equal (swap-first-last '(1)) '(1) )))

(fiveam:test swap-tests-3
  (fiveam:is (equal (swap-first-last '(1 2)) '(2 1) )))

(fiveam:test swap-tests-4
  (fiveam:is (equal (swap-first-last test_lst) '(f b c d e a) )))

; swap-first-last

; nswap-first-last

(fiveam:test nswap-tests-1
  (fiveam:is (equal (nswap-first-last '()) '() )))

(fiveam:test nswap-tests-2
  (fiveam:is (equal (nswap-first-last '(1)) '(1) )))

(fiveam:test nswap-tests-3
  (fiveam:is (equal (nswap-first-last '(1 2)) '(2 1) )))

(fiveam:test nswap-tests-4
  (fiveam:is (equal (nswap-first-last test_lst) '(f b c d e a) )))

; nswap-first-last

; (fiveam:run!)
