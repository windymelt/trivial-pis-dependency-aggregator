(in-package :cl-user)
(defpackage :example-asd
  (:use :cl :asdf))
(in-package :example-asd)

(defsystem example
  :class :package-inferred-system
  :defsystem-depends-on (:asdf-package-system :trivial-pis-dependency-aggregator)
  :depends-on (:example/main))
