(in-package :cl-user)
(defpackage :example/router
  (:use :cl)
  (:export :*route* :defroute :dispatch))
(in-package :example/router)

(defparameter *route* nil)

(defun defroute (path method handler)
  (push (list path method handler) *route*))

(defun dispatch (path method)
  (find-if
   #'(lambda (handler) (and (string= (elt handler 0) path)
                            (eq (elt handler 1) method)))
   *route*))
