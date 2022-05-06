(load "01.lisp")

(ql:quickload "fiveam")

; polyndromp-reverse

(fiveam:test polyndrom-reverse-1
  (fiveam:is (polyndromp-reverse `())))

(fiveam:test polyndrom-reverse-2
  (fiveam:is (polyndromp-reverse `(1))))

(fiveam:test polyndrom-reverse-3
  (fiveam:is (polyndromp-reverse `(1 2 1))))

(fiveam:test polyndrom-reverse-4
  (fiveam:is (polyndromp-reverse `(1 a b b c b b a 1))))

(fiveam:test not-polyndrom-reverse-1
  (fiveam:is (not (polyndromp-reverse `(1 2)))))

(fiveam:test not-polyndrom-reverse-2
  (fiveam:is (not (polyndromp-reverse `(1 a)))))

; polyndromp-reverse

; polyndrom


(fiveam:test polyndrom-1
  (fiveam:is (polyndromp `())))

(fiveam:test polyndrom-2
  (fiveam:is (polyndromp `(1))))

(fiveam:test polyndrom-3
  (fiveam:is (polyndromp `(1 2 1))))

(fiveam:test polyndrom-4
  (fiveam:is (polyndromp `(1 a b b c b b a 1))))

(fiveam:test not-polyndrom-1
  (fiveam:is (not (polyndromp `(1 2)))))

(fiveam:test not-polyndrom-2
  (fiveam:is (not (polyndromp `(1 a)))))

; polyndrom

; (fiveam:run!)
