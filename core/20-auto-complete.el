(require 'auto-complete)
(global-auto-complete-mode t)
(setq ac-use-menu-map t)
(define-key ac-completing-map (kbd "C-j") 'ac-next)
(define-key ac-completing-map (kbd "C-k") 'ac-previous)
(setq ac-dwim t)
