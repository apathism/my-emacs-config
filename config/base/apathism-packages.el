;; base / apathism-packages

;; Setting up MELPA and installing use-package
(setq package-enable-at-startup nil)
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (message "%s" "Installing use-package...")
  (package-refresh-contents)
  (package-install 'use-package))

;; Use-package loading and settings
(setq use-package-always-ensure t)
(require 'use-package)

;; Remove annoying customize settings in a seperate file
(setq custom-file "~/.emacs.d/customize.el")
(load custom-file 'noerror)

;; Quelpa
(use-package quelpa-use-package
  :config (setq quelpa-update-melpa-p nil))

(provide 'apathism-packages)
