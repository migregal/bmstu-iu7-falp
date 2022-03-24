(defun get-cptl-assoc (cntry tbl)
  (let ((pair (assoc cntry tbl :test 'equal)))
    (cond (pair (cdr pair)))))

(defun get-cptl (cntry tbl)
  (cond
    ((eq cntry (caar tbl)) (cdar tbl))
    ((get-cptl cntry (cdr tbl)))))

(defun get-cntry-assoc (cptl tbl)
  (let ((pair (rassoc cptl tbl :test 'equal)))
    (cond (pair (car pair)))))

(defun get-cntry (cptl tbl)
  (cond
    ((eq cptl (cdar tbl)) (caar tbl))
    ((get-cntry cptl (cdr tbl)))))
