;; package / apathism-flycheck

(use-package flycheck
  :init
  (global-flycheck-mode)
  (setq-default flycheck-disabled-checkers '(emacs-lisp  emacs-lisp-checkdoc)))

(provide 'apathism-flycheck)
