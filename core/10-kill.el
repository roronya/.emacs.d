(defun kill-line-or-region()
  "kill region if active only or kill line normally"
  (interactive)
  (if (region-active-p)
      (call-interactively 'kill-region)
    (call-interactively 'kill-line)))

(bind-key "C-k" 'kill-line-or-region)
