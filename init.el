;; パッケージ管理
(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ;; ("melpa-stable" . "https://stable.melpa.org/packages/")
        ("org" . "https://orgmode.org/elpa/")
        ("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)
;; install dependencies
(defvar my/dependencies
     '(
       use-package
       auto-complete
       markdown-mode
       markdown-preview-mode
       vertico
       ))
(dolist (package my/dependencies)
  (unless (package-installed-p package)
    (package-install package)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(popup-el auto-complete auto-completion vertico impatient-mode auto-save-buffers-enhanced auto-save-buffers-enhannced markdown-preview-mode markdown-mode use-package)))

;;; global setting
;; keybind
(global-set-key (kbd "C-h") 'delete-backward-char)
;; theme
(load-theme 'dichromacy)
;; 背景透過率
(set-frame-parameter nil 'alpha 90)
;; バックアップファイルを作らない
(setq backup-inhibitted t)
;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)
;; font
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Hiragino Maru Gothic ProN" :foundry "nil" :slant normal :weight normal :height 181 :width normal)))))
;; カレント行をハイライトする
(global-hl-line-mode)
;; 行番号
(use-package linum-mode
  :commands linum-mode
  :init ;; global-linum-modeだと組み込みブラウザでも行表示されてしまうので、基本的にはオフにして行表示を有効にするモードはここで設定する
  (add-hook 'markdown-mode-hook 'linum-mode)
  (add-hook 'emacs-lisp-mode-hook 'linum-mode)
  (setq linum-format " %4d ") ;; デフォルトだと見づらいので
  )
;; auto complete
(use-package auto-complete-config
  :init (ac-config-default)
  )

;;; custome mini buffer
(use-package vertico
  :init (vertico-mode)
  )

;;; for editing markdown
(use-package markdown-mode
  :config
  (setq markdown-command "pandoc -s -c ~/.emacs.d/github-markdown.css --metadata pagetitle=preview")
  (setq markdown-preview-stylesheets nil) ;; defaultのCSSは汚いので無効化
  ;; デフォルトのブラウザをemacs組み込みブラウザにする(markdownのプレビューに使う)
  (setq browse-url-browser-function 'xwidget-webkit-browse-url)
  )

