;; disable backup
(setq backup-inhibited t)

;; disable autosave
(setq auto-save-default nil)

;; disable annoying modified buffers alert
(defun my-save-buffers-kill-emacs (&optional arg)
  "Offer to save each buffer(once only), then kill this Emacs process.
With prefix ARG, silently save all file-visiting buffers, then kill."
  (interactive "P")
  (save-some-buffers arg t)
  (and (or (not (fboundp 'process-list))
       ;; process-list is not defined on MSDOS.
       (let ((processes (process-list))
         active)
         (while processes
           (and (memq (process-status (car processes)) '(run stop open listen))
            (process-query-on-exit-flag (car processes))
            (setq active t))
           (setq processes (cdr processes)))
         (or (not active)
         (progn (list-processes t)
            (yes-or-no-p "Active processes exist; kill them and exit anyway? ")))))
       ;; Query the user for other things, perhaps.
       (run-hook-with-args-until-failure 'kill-emacs-query-functions)
       (or (null confirm-kill-emacs)
       (funcall confirm-kill-emacs "Really exit Emacs? "))
       (kill-emacs)))
(fset 'save-buffers-kill-emacs 'my-save-buffers-kill-emacs)

; Tab width
(setq-default c-basic-offset 8
	      c-indent-level 8
	      c-argdecl-indent 0
              tab-width 8
              indent-tabs-mode t
	      c-tab-always-indent t
	      c-default-style "bsd")

(setq backward-delete-char-untabify-method nil)
(electric-indent-mode -1)

; Git blame
(autoload 'mo-git-blame-file "mo-git-blame" nil t)
(autoload 'mo-git-blame-current "mo-git-blame" nil t)
(global-set-key [?\C-c ?g ?c] 'mo-git-blame-current)
(global-set-key [?\C-c ?g ?f] 'mo-git-blame-file)

; New line at the end of the file
(setq require-final-newline t)

; D Mode
(require 'cl)
(autoload 'd-mode "d-mode" "Major mode for editing D code." t)
(add-to-list 'auto-mode-alist '("\\.d[i]?\\'" . d-mode))

(setq pascal-auto-lineup nil)

; Rust Mode
(autoload 'rust-mode "rust-mode" "Mode for editing Rust code." t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

;; Diff mode custom colors
(defun custom-diff-colors ()
  "update the colors for diff faces"
  (set-face-attribute
   'diff-added nil :foreground "green4")
  (set-face-attribute
   'diff-removed nil :foreground "red3")
  (set-face-attribute
   'diff-header nil :background "blue")
  (set-face-attribute
   'diff-file-header nil :background "blue")
  (set-face-attribute
   'diff-context nil :foreground "white"))
(eval-after-load "diff-mode" '(custom-diff-colors))

;; Python
   (add-hook 'python-mode-hook 'guess-style-guess-tabs-mode)
   (add-hook 'python-mode-hook (lambda ()
                                    (guess-style-guess-tab-width)))
