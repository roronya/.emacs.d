(global-unset-key "\C-x\C-v")
(use-package magit
  :init
  (add-hook 'magit-status-mode-hook
            (lambda ()
              (local-unset-key "\C-w")))
  (add-hook 'magit-diff-mode-hook
            (lambda ()
              (local-unset-key "\C-w")))
  :bind
  (("C-x C-v C-s" . magit-status)))
