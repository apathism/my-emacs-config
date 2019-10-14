(provide 'apathism-ivy)

(use-package counsel
  :diminish ivy-mode counsel-mode
  :hook ((after-init . ivy-mode)
		 (ivy-mode . counsel-mode))
  :init
  (setq enable-recursive-minibuffers t)
  (setq ivy-count-format "(%d/%d) "
		ivy-use-virtual-buffers t)
  )
