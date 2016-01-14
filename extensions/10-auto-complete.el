(use-package auto-complete
  :init
  (global-auto-complete-mode t)
  :config
  (setq ac-use-menu-map t)
  (define-key ac-completing-map (kbd "C-j") 'ac-next)
  (define-key ac-completing-map (kbd "C-k") 'ac-previous)
  (setq ac-dwim t)
  )
