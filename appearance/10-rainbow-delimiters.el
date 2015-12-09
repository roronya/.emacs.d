(use-package rainbow-delimiters
  :init
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(col-highlight ((t (:background "#000000"))))
   '(hl-line ((t (:background "#000000"))))
   '(linum ((t (:inherit (shadow default) :foreground "#FFFFFF" :background "#002259"))))
   '(rainbow-delimiters-depth-1-face ((t (:foreground "#F5B2B2"))))
   '(rainbow-delimiters-depth-2-face ((t (:foreground "#F4B4D0"))))
   '(rainbow-delimiters-depth-3-face ((t (:foreground "#CFA7CD"))))
   '(rainbow-delimiters-depth-4-face ((t (:foreground "#A59ACA"))))
   '(rainbow-delimiters-depth-5-face ((t (:foreground "#A3BCE2"))))
   '(rainbow-delimiters-depth-6-face ((t (:foreground "#9FD9F6"))))
   '(rainbow-delimiters-depth-7-face ((t (:foreground "#A2D7D4"))))
   '(rainbow-delimiters-depth-8-face ((t (:foreground "#A5D4AD"))))
   '(rainbow-delimiters-depth-9-face ((t (:foreground "#D7E7AF")))))
  )
