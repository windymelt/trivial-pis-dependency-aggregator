(in-package :cl-user)
(defpackage :example/components/component1
  (:use :cl)
  (:import-from :example/router :defroute))
(in-package :example/components/component1)

(defroute "/" :GET #'(lambda () '(200 (:Content-Type "text/plain") "Hello, Component 1!")))
