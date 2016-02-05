(require 'package)
(package-initialize)

(exec-path-from-shell-initialize)

(require 'use-package)
(require 'init-loader)
(init-loader-load "~/.emacs.d/core")
(init-loader-load "~/.emacs.d/appearance")
(init-loader-load "~/.emacs.d/utility")
(init-loader-load "~/.emacs.d/mode")

;;; language 上書きされがちなので一番最後に設定する
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)
(setq default-process-coding-system 'utf-8)
(setq default-input-method "japanese-mozc")
(setq mozc-candidate-style 'overlay)
