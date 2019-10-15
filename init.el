;; Gargbage collector temporary threshhold for init phase
(let ((gc-cons-threshold most-positive-fixnum))
  ;; Base configuration
  (add-to-list 'load-path "~/.emacs.d/config/base")
  (require 'apathism-backups)
  (require 'apathism-identity)
  (require 'apathism-ui)
  (require 'apathism-themes)
  (require 'apathism-editing)
  (require 'apathism-compile)
  (require 'apathism-packages)

  ;; Package configuration
  (add-to-list 'load-path "~/.emacs.d/config/package")
  (require 'apathism-smart-tabs)
  (require 'apathism-sudo-edit)
  (require 'apathism-doom-modeline)
  (require 'apathism-neotree)
  (require 'apathism-ivy)

  (require 'apathism-markdown)
  (require 'apathism-yaml)
  (require 'apathism-git)
  (require 'apathism-gdb)
  (require 'apathism-haskell)
)

(provide 'init)
