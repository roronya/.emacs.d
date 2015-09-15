(require 'cask "~/.cask/cask.el")
(cask-initialize)

(require 'use-package)

(exec-path-from-shell-initialize)

(require 'init-loader)
(init-loader-load "~/.emacs.d/core")
(init-loader-load "~/.emacs.d/site-lisp")

(show-paren-mode 1)
