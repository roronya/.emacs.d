(require 'cask "~/.cask/cask.el")
(cask-initialize)

(require 'use-package)

(exec-path-from-shell-initialize)

(require 'init-loader)
(init-loader-load "~/.emacs.d/core")
(init-loader-load "~/.emacs.d/site-lisp")

(show-paren-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fancy-splash-image "~/.emacs.d/shinchoku.xpm"))
