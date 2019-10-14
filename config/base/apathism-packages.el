(provide 'apathism-packages)

;; Setting up MELPA and installing use-package
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(setq package-enable-at-startup nil)
(package-initialize nil)

(unless (package-installed-p 'use-package)
  (message "%s" "Installing use-package...")
  (package-refresh-contents)
  (package-install 'use-package))

;; Use-package loading and settings
(require 'use-package)
(setq use-package-always-ensure t)

;; Remove annoying customize settings in a seperate file
(setq custom-file "~/.emacs.d/customize.el")
(load custom-file 'noerror)

;; Quelpa
(use-package quelpa-use-package
  :config
  (setq quelpa-update-melpa-p nil)
  )
