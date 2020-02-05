(in-package :cl-user)
(defpackage :example/components/component2
  (:use :cl)
  (:import-from :example/router :defroute))
(in-package :example/components/component2)

(defroute "/about" :GET #'(lambda () '(200 (:Content-Type "text/plain") "Hello, Component 2!")))
