(provide 'apathism-sudo-edit)

(defun apathism/maybe-sudo-edit ()
  (when (and (not (file-writable-p buffer-file-name))
			 (y-or-n-p "File not writable. Open as root?"))
	(let ((obuf (current-buffer)))
	  (sudo-edit)
	  (unless (equal (current-buffer) obuf)
		(let (kill-buffer-query-functions kill-buffer-hook)
		  (kill-buffer obuf))))))

(use-package sudo-edit
  :bind (:map ctl-x-map ("M-s" . sudo-edit))
  :hook ((find-file . apathism/maybe-sudo-edit))
  )
