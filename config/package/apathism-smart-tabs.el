(provide 'apathism-smart-tabs)

(use-package smart-tabs-mode
  :init
  (smart-tabs-insinuate
   'c
   'c++
   'java
   'javascript
   'python
   )
  )
