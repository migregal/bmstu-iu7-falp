(defun get-cptl-assoc (cntry tbl)
  (let
    ( (pair (assoc cntry tbl :test 'equal)) )
    (and
      pair
      (cdr pair)
    )
  )
)

(defun get-cptl (cntry tbl)
  (and
    (listp tbl)
    (cond
      ( (null tbl) nil )
      ( (eq cntry (caar tbl)) (cdar tbl) )
      ( T (get-cptl cntry (cdr tbl)) )
    )
  )
)

(defun get-cntry-assoc (cptl tbl)
  (let
    ( (pair (rassoc cptl tbl :test 'equal)) )
    (and
      pair
      (car pair)
    )
  )
)

(defun get-cntry (cptl tbl)
  (and
    (listp tbl)
    (cond
      ( (null tbl) nil )
      ( (eq cptl (cdar tbl)) (caar tbl) )
      ( T (get-cntry cptl (cdr tbl)) )
    )
  )
)
