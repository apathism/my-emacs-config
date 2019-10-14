(provide 'init)

;; Base configuration
(add-to-list 'load-path "~/.emacs.d/config/base")
(require 'apathism-backups)
(require 'apathism-identity)
(require 'apathism-ui)
(require 'apathism-themes)
(require 'apathism-editing)
(require 'apathism-packages)

;; Package configuration
(add-to-list 'load-path "~/.emacs.d/config/package")
(require 'apathism-smart-tabs)
(require 'apathism-doom-modeline)
(require 'apathism-neotree)
(require 'apathism-git)
(require 'apathism-ivy)
(require 'apathism-haskell)
