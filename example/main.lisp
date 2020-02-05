(in-package :cl-user)
(defpackage :example/main
  (:use :cl)
  (:import-from :example/components) ; nothing will be imported
  (:import-from :example/router :dispatch))

(defun main ()
  (funcall (elt 2 (dispatch "/" :GET))))
