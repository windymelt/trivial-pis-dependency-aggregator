(in-package :cl-user)
(defpackage trivial-pis-dependency-aggregator-asd
  (:use :cl :asdf))
(in-package :trivial-pis-dependency-aggregator-asd)

;; to read non-latin code for description
#+sbcl(setf sb-impl::*default-external-format* :utf-8)
#+sbcl(setf sb-alien::*default-c-string-external-format* :utf-8)

(defsystem trivial-pis-dependency-aggregator
  :version "0.1"
  :author "Windymelt"
  :license "MIT"
  :depends-on (:alexandria)
  :components ((:file "main"))
  :description ""
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.md"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  )
