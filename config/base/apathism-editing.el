;; base / apathism-editing

(setq require-final-newline t)
(setq-default indent-tabs-mode t
              tab-width 4
			  c-basic-offset 4)
(define-key global-map (kbd "RET") 'newline-and-indent)
(setq-default show-trailing-whitespace t)

(provide 'apathism-editing)
