(in-package :cl-user)
(defpackage :trivial-pis-dependency-aggregator
  (:use :cl)
  (:import-from :alexandria :make-keyword)
  (:export :define-dependency-aggregator-package))

(in-package :trivial-pis-dependency-aggregator)

(defparameter *asdf-pathname-value* #P"./"
  "Specify :PATHNAME of your system e.g. #P\"src/\".")

(defun dependency-source-dir () (merge-pathnames trivial-pis-dependency-aggregator::*asdf-pathname-value* (uiop:getcwd)))
(defun define-dependency-aggregator-package (name)
  "Defines package which has dependency to packages inside directory named NAME. Directory \"NAME\" should be placed aside of caller of this function."
  (let ((file-names-without-ext
          (mapcar #'pathname-name
                  (uiop:directory-files
                   (merge-pathnames (pathname (format nil "~A/" (string-downcase (subseq (symbol-name name) (1+ (position #\/ (symbol-name name) :from-end t)))))) (trivial-pis-dependency-aggregator::dependency-source-dir))))))
    `(defpackage ,name
       (:use :cl)
       ,@(mapcar #'(lambda (f) (list :import-from (make-keyword (string-upcase (format nil "~A/~A" name f))))) file-names-without-ext))))
