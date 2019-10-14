;; package / apathism-gdb

(use-package gdb-mi
  :quelpa (gdb-mi :fetcher git
				  :url "https://github.com/weirdNox/emacs-gdb.git"
				  :files ("*.el" "*.c" "*.h" "Makefile"))
  :init
  (fmakunbound 'gdb)
  (fmakunbound 'gdb-enable-debug)
  )

(defun apathism/gdb-setup-windows (session)
  (with-selected-frame (gdb--session-frame session)
    (delete-other-windows)
    (let* ((top-left (selected-window))
           (middle-left (split-window))
           (bottom-left (split-window middle-left))
           (top-right (split-window top-left nil t))
           (middle-right (split-window middle-left nil t))
           (bottom-right (split-window bottom-left nil t)))
      (balance-windows)
      (gdb--set-window-buffer top-left     (gdb--comint-get-buffer session))
      (gdb--set-window-buffer top-right    (gdb--inferior-io-get-buffer session))
      (gdb--set-window-buffer middle-left  (gdb--breakpoints-get-buffer session))
      (gdb--set-window-buffer middle-right (gdb--frames-get-buffer session))
      (gdb--set-window-buffer bottom-left  (gdb--watchers-get-buffer session))
      (gdb--set-window-buffer bottom-right (gdb--variables-get-buffer session))
      (gdb--display-source-buffer top-left))))

(setq gdb-window-setup-function #'apathism/gdb-setup-windows)

(defun apathism/toggle-gdb-session ()
  (interactive)
  (call-interactively
   (if (gdb--infer-session) 'gdb-kill-session 'gdb-executable)))

(global-set-key (kbd "C-c C-g") 'apathism/toggle-gdb-session)

(provide 'apathism-gdb)
