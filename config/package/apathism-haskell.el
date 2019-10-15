;; package / apathism-haskell

(use-package haskell-mode)

(use-package flycheck-haskell
  :after flycheck
  :hook (haskell-mode . flycheck-haskell-setup))

(provide 'apathism-haskell)
