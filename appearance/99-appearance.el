(load-theme 'wombat)
(set-frame-parameter nil 'alpha 85)
(menu-bar-mode 0)
(tool-bar-mode 0)
(setq cursor-type 'box)
(set-cursor-color "#CC145B")
(if window-system
    (scroll-bar-mode 0))
(setq scroll-step 1)

;;; font
(add-to-list 'default-frame-alist '(font . "VL Gothic"))
(set-face-attribute 'default t :font "VL Gothic")
(set-face-attribute 'default nil :font "VL Gothic")
(set-frame-font "VL Gothic" nil t)

;;; linum
(global-linum-mode t)
(setq linum-format "%3d ")
(custom-set-faces
 '(col-highlight ((t (:background "#000000"))))
 '(linum ((t (:inherit (shadow default) :foreground "#FFFFFF" :background "#002259")))))

;;; shinchoku
(custom-set-variables
 '(fancy-splash-image "~/.emacs.d/appearance/shinchoku.xpm"))

;;; highlight
(global-hl-line-mode t)
(custom-set-faces
 '(hl-line ((t (:background "#000000")))))
