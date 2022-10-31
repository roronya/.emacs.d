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
    treemacs
    markdown-mode
    markdown-preview-mode
    vertico
    consult
    orderless
    marginalia
    mozc
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
   '(mozc-temp mozc-popup mozc migemo affe projectile treemacs hydra neotree emdark marginalia orderless consult popup-el auto-complete auto-completion vertico impatient-mode auto-save-buffers-enhanced auto-save-buffers-enhannced markdown-preview-mode markdown-mode use-package)))

;;; global
;; theme
(load-theme 'dichromacy)
;; 背景透過率
(set-frame-parameter nil 'alpha 90)
;; バックアップファイルを作らない
(setq backup-inhibitted t)
(setq make-backup-files nil)
;; 終了時にオートセーブファイルを消す
(setq auto-save-default nil)
(setq delete-auto-save-files t)
;; windowが横に分割されるのを防ぐ
(setq split-width-threshold nil)
;; emacsの起動画面を消す
(setq inhibit-startup-message t)
;; *scratch* bufferのメッセージをsetq
(setq initial-scratch-message nil)
;; カーソルをbarにする
(add-to-list 'default-frame-alist '(cursor-type . bar))
;; font
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Hiragino Maru Gothic ProN" :foundry "nil" :slant normal :weight normal :height 181 :width normal)))))
;; 行番号
(use-package linum-mode
  :commands linum-mode
  :init ;; global-linum-modeだと組み込みブラウザでも行表示されてしまうので、基本的にはオフにして行表示を有効にするモードはここで設定する
  (add-hook 'markdown-mode-hook 'linum-mode)
  (add-hook 'emacs-lisp-mode-hook 'linum-mode)
  (setq linum-format " %4d ") ;; デフォルトだと見づらいので
  )
;; 全角半角切り替え
(defun my/use-japanese-input-method ()
  (interactive)
  (set-input-method 'japanese-mozc))
(defun my/off-input-method ()
  (interactive)
  (deactivate-input-method))
;;; karabinerでleft-commandをs-jに、right-commandをs-eに割り当てている
(global-set-key (kbd "s-j") 'my/use-japanese-input-method)
(global-set-key (kbd "s-e") 'my/off-input-method)
;;; Emacsにフォーカスが映ったときにOSのIMEをeisuuにする
;;; ref: https://tottoto.net/mac-emacs-karabiner-elements-japanese-input-method-config/
(defun my/eisuu-key ()
  "英数キーのエミュレート"
  (interactive)
  (call-process "osascript" nil t nil "-e" "tell application \"System Events\" to key code 102"))
(add-hook 'focus-in-hook #'my/eisuu-key)
(use-package mozc
  :init
  (setq default-input-method "japanese-mozc")
  (setq mozc-helper-program-name "mozc_emacs_helper")
  (setq mozc-candidate-style 'echo-area)
  )

;; 日本語をローマ字で検索する
(use-package migemo
  :init
  (setq migemo-directory "/usr/local/Cellar/cmigemo/HEAD-e0f6145/share/migemo/utf-8")
  (setq migemo-command (executable-find "cmigemo"))
  (setq migemo-options '("-q" "--emacs" "--nonewline"))
  (setq migemo-dictionary (expand-file-name "migemo-dict" migemo-directory))
  (setq migemo-coding-system 'utf-8-unix)
  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (add-hook 'after-init-hook #'migemo-init))

;; custome mini buffer
(use-package vertico
  :init (vertico-mode)
  :config
  (setq vertico-count 30))
(use-package orderless
  :config
  (setq completion-styles '(orderless)))
(use-package consult
  :init
  (defun consult--migemo-regexp-compiler (input type ignore-case)
    (setq input (mapcar #'migemo-get-pattern (consult--split-escaped input)))
    (cons (mapcar (lambda (x) (consult--convert-regexp x type)) input)
          (when-let (regexps (seq-filter #'consult--valid-regexp-p input))
            (apply-partially #'consult--highlight-regexps regexps ignore-case))))

  :config
  ;;; -*- lexical-binding: t -*-
  (setq consult--regexp-compiler #'consult--migemo-regexp-compiler)
  ;; consultはarticles配下だけを検索する
  (setq consult-project-function (lambda (_) my/project-root))
  :bind
  ("C-x C-b" . consult-buffer)
  ("M-f" . consult-ripgrep))

;; filetree
(use-package treemacs
  :ensure t
  :defer t
  :init
  ;; filetreeに表示しないファイルリスト
  (defun treemacs-custome-filter (file _)
    (or
     (string-equal "node_modules" file)
     (string-equal ".gitignore" file)
     (string-equal "package.json" file)
     (string-equal "package-lock.json" file)
     (s-ends-with? ".html" file)))
  :config
  (add-to-list 'treemacs-ignored-file-predicates #'treemacs-custome-filter)
  (setq treemacs-width 80)
  (setq treemacs-sorting 'alphabetic-desc)
  (treemacs-filewatch-mode t)
  (treemacs-follow-mode t)
  :bind
  (:map global-map
	("M-1" . treemacs)))

;; for editing emacs-lisp
;;; auto complete
(use-package auto-complete-config
  :commands (auto-complete-mode)
  :init
  (add-hook 'emacs-lisp-mode-hook 'auto-complete-mode))

;; for editing markdown
(setq my/project-root "~/src/github.com/roronya/mynote/notes/")
(setq my/articles-root "~/src/github.com/roronya/mynote/articles/")
(defun my/format-current-time-string () (format-time-string "%Y_%m%d" (current-time)))
(defun my/generate-junk-filename () (concat (my/format-current-time-string) ".md")) ;; => e.g. 2022_0808.md
(defun my/open-file () (interactive) (find-file (concat my/project-root (my/generate-junk-filename))))
;; h1のヘッダがファイル内に1つで、1文字以上の長さを持つこと
(defun my/extract-header ()  (substring (shell-command-to-string (concat "grep \"^# \" \"" (buffer-name) "\"")) 2 -1))
;; ヘッダに日付をつけた文字列を生成する
(defun my/generate-named-filename ()
  (concat (my/format-current-time-string) "_" (my/extract-header) ".md"))
;; ヘッダが無いファイルは日付で名前を付ける
(defun my/determine-filename ()
  (if (string= (my/extract-header) "")
      (my/generate-junk-filename) (my/generate-named-filename)))
;; 保存時にzennの指定があったらarticlesにコピーする
(defun my/zenn-articles? ()
  (beginning-of-buffer)
  (string= "---" (buffer-substring-no-properties 1 4)))
;; slugを取得する
(defun my/get-zenn-slug ()
  (beginning-of-buffer)
  ;; いい方法がわからなかったので、ファイル先頭からslugの場所までの文字数を数えている
  (buffer-substring-no-properties 11 25))
(defun my/move-note-to-articles ()
  ;; my/zenn-articles?とmy/get-senn-slugでカーソル場所が動くので保存しておいて後で戻す
  (point-to-register 'r)
  (if (my/zenn-articles?)
      (let ((oldname (buffer-file-name))
	    (newname (concat my/articles-root (my/get-zenn-slug) ".md")))
	(copy-file oldname newname t)))
  (jump-to-register 'r))
;; 保存時にjunk filenameをmarkdownのh1で上書きする
(defun my/rename-file-and-buffer ()
  (let ((name (buffer-name))
	(filename (buffer-file-name))
	(new-name (my/determine-filename)))
    (if (not filename)
	(message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
	  (message "A buffer named '%s' already exists!" new-name)
	(progn
	  (rename-file filename new-name 1)
	  (rename-buffer new-name)
	  (set-visited-file-name new-name)
	  (set-buffer-modified-p nil))))))
(defun my/do-after-save ()
  (interactive)
  (when (eq major-mode 'markdown-mode)
    (my/rename-file-and-buffer)
    (my/move-note-to-articles)
    ;; 以下のやり方のmarkdown-preview-modeのリロードは、長文になると動作が遅くなって不便だったのでやめた
    ;; (markdown-preview-cleanup)
    ;; (markdown-preview-mode)
    ))
(add-hook 'after-save-hook 'my/do-after-save)
(use-package markdown-mode
  :config
  (setq markdown-indent-on-enter nil)
  (setq markdown-command "pandoc -s -c ~/.emacs.d/github-markdown.css --metadata pagetitle=preview")
  (setq markdown-preview-stylesheets nil) ;; defaultのCSSは汚いので無効化
  ;; デフォルトのブラウザをemacs組み込みブラウザにする(markdownのプレビューに使う)
  (setq browse-url-browser-function 'xwidget-webkit-browse-url)
  :bind
  ("C-c C-c C-p" . markdown-preview)
  ("M-]" . markdown-demote)
  ("M-[" . markdown-promote)
  ("M-n" . nil)
  )

;; keybind
(global-set-key (kbd "M-z") 'undo)
(global-set-key (kbd "M-Z") 'undo-redo)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-x C-h") 'windmove-left)
(global-set-key (kbd "C-x C-j") 'windmove-down)
(global-set-key (kbd "C-x C-k") 'windmove-up)
(global-set-key (kbd "C-x C-l") 'windmove-right)
(global-set-key (kbd "C-x C-n") 'my/open-file)
(setq mac-option-modifier 'super)

;; main
(my/open-file)
(split-window-horizontally)
(windmove-right)
(markdown-preview)
(windmove-left)
(treemacs)

