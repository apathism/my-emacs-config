;; base / apathism-compile

(require 'compile)

(defvar apathism/cf-compile-flags "-Wall -Wextra -std=c++17 -g \
-fsanitize=address -fsanitize=undefined -fno-sanitize-recover")

(make-variable-buffer-local 'apathism/cf-compile-flags)
(put 'apathism/cf-compile-flags 'safe-local-variable #'stringp)

(defun apathism/cf-compile ()
  (interactive)
  (let ((filename (file-relative-name buffer-file-name)))
	(compile
	 (concat "g++ " apathism/cf-compile-flags
			 " -o " (file-name-sans-extension filename)
			 " " filename)
	 )
	)
  )

(add-hook 'c-mode-common-hook
		  (lambda ()
			(define-key
			  c-mode-base-map
			  (kbd "C-c C-c")
			  'apathism/cf-compile
			  )
			)
		  )

(provide 'apathism-compile)
