(load "03.lisp")

(defvar test_table '((Russia . Moscow) (Germany . Berlin) (Australia . Canberra)))

(ql:quickload "fiveam")

; capitals tests
(fiveam:test capital-assoc-1
  (fiveam:is (equal (get-cptl-assoc 'Russia test_table) 'Moscow)))

(fiveam:test capital-assoc-2
  (fiveam:is (equal (get-cptl-assoc 'Germany test_table) 'Berlin)))

(fiveam:test capital-assoc-3
  (fiveam:is (equal (get-cptl-assoc 'Australia test_table) 'Canberra)))

(fiveam:test capital-1
  (fiveam:is (equal (get-cptl 'Russia test_table) 'Moscow)))

(fiveam:test capital-2
  (fiveam:is (equal (get-cptl 'Germany test_table) 'Berlin)))

(fiveam:test capital-3
  (fiveam:is (equal (get-cptl 'Australia test_table) 'Canberra)))

(fiveam:test capital-to-assoc-1
  (fiveam:is (equal (get-cptl-assoc 'Russia test_table) (get-cptl 'Russia test_table))))

(fiveam:test capital-to-assoc-2
  (fiveam:is (equal (get-cptl-assoc 'Germany test_table) (get-cptl 'Germany test_table))))

(fiveam:test capital-to-assoc-2
  (fiveam:is (equal (get-cptl-assoc 'Australia test_table) (get-cptl 'Australia test_table))))

; capitals tests

; countries tests

(fiveam:test country-assoc-1
  (fiveam:is (equal (get-cntry-assoc 'Moscow test_table) 'Russia)))

(fiveam:test country-assoc-2
  (fiveam:is (equal (get-cntry-assoc 'Berlin test_table) 'Germany)))

(fiveam:test country-assoc-3
  (fiveam:is (equal (get-cntry-assoc 'Canberra test_table) 'Australia)))

(fiveam:test country-1
  (fiveam:is (equal (get-cntry 'Moscow test_table) 'Russia)))

(fiveam:test country-2
  (fiveam:is (equal (get-cntry 'Berlin test_table) 'Germany)))

(fiveam:test country-3
  (fiveam:is (equal (get-cntry 'Canberra test_table) 'Australia)))

(fiveam:test country-to-assoc-1
  (fiveam:is (equal (get-cntry-assoc 'Moscow test_table) (get-cntry 'Moscow test_table))))

(fiveam:test country-to-assoc-2
  (fiveam:is (equal (get-cntry-assoc 'Berlin test_table) (get-cntry 'Berlin test_table))))

(fiveam:test country-to-assoc-3
  (fiveam:is (equal (get-cntry-assoc 'Canberra test_table) (get-cntry 'Canberra test_table))))

; countries tests

; (fiveam:run!)
