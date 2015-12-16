(global-unset-key "\C-x\C-v")
(use-package magit
  :init
  (add-hook 'magit-mode
            (lambda ()
              (local-unset-key "\C-w")))  
  :bind
  (("C-x C-v C-s" . magit-status)))
