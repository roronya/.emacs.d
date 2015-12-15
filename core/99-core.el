;;; delete backup files
(setq backup-inhibited t)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq delete-auto-save-files t)

(require 'expand-region)
(require 'smartrep)
(require 'elscreen)
(require 'rotate)
(require 'golden-ratio)

;;; Region
(global-unset-key "\C-r")
(smartrep-define-key global-map "C-r"
  '(("C-r" . 'er/expand-region)
    ("M-r" . 'er/contract-region)
    ("C-d" . 'kill-region)
    ("C-c" . 'kill-ring-save)
    ("C-m" . 'set-mark-command)
    )
  )

;;; Window
(global-unset-key "\C-w")
(global-unset-key "\C-xo")
(smartrep-define-key global-map "C-w"
  '(("C-d" . 'delete-window)
    ("M-d" . 'delete-other-windows)
    ("C-e" . 'enlarge-window-horizontally)
    ("C-s" . 'shrink-window-horizontally)
    ("M-e" . 'enlarge-window)
    ("M-s" . 'shrink-window)
    ("C-f" . 'windmove-right)
    ("C-b" . 'windmove-left)
    ("C-p" . 'windmove-up)
    ("C-n" . 'windmove-down)
    ("C-v" . 'split-window-right)
    ("C-h" . 'split-window-below)
    ("C-=" . 'my/text-scale-increase)
    ("C--" . 'my/text-scale-decrease)
    ("<C-tab>" . 'rotate-layout)
    ("C-r" . 'rotate-window)
    )
  )
(golden-ratio-mode 1)

;;; Tab
(elscreen-start)
(global-unset-key "\C-t")
(smartrep-define-key global-map "C-t"
  '(("C-t" . 'elscreen-create)
    ("C-w" . 'elscreen-kill)
    ("C-n" . 'elscreen-next)
    ("C-p" . 'elscreen-previous)
    )
  )

;;; Search
(global-ace-isearch-mode t)
(bind-key* "C-v" 'vimlike-f)
(bind-key* "M-v" 'vimlike-F)
(bind-key* "C-;" 'vimlike-semicolon)

;;; kill-line
(setq kill-whole-line t)
(defun my/delete-region-or-char ()
  (interactive)
  (if (region-active-p)
      (kill-region (region-beginning) (region-end))
    (delete-char 1 nil)))
(bind-key* "C-d" 'my/delete-region-or-char)

;;; kill-word-at-point
(defun my/kill-word-at-point ()
      (interactive)
      (let ((char (char-to-string (char-after (point)))))
        (cond
         ((string= " " char) (delete-horizontal-space))
         ((string-match "[\t\n -@\[-`{-~]" char) (kill-word 1))
         (t (forward-char) (backward-word) (kill-word 1)))))
(bind-key* "M-d" 'my/kill-word-at-point)

;;; undo
(bind-key* "C-u" 'undo)

;;; scroll
(bind-key* "M-p" 'scroll-down)
(bind-key* "M-n" 'scroll-up)

;;; rename
(bind-key* "C-x C-w" 'rename-file-and-buffer)

;;; move
(bind-key* "C-M-a" 'beginning-of-defun)
(bind-key* "C-M-e" 'end-of-defun)

(defun my/forward-word+1 ()
  (interactive)
  (forward-word)
  (forward-char)
  )
(bind-key* "M-f" 'my/forward-word+1)

(defun my/goto-line-beginning-or-indent (&optional $position)
  (interactive)
  (or $position (setq $position (point)))
  (let (($starting-position (progn (back-to-indentation) (point))))
    (if (eq $starting-position $position)
      (move-beginning-of-line 1))))
(bind-key* "C-a" 'my/goto-line-beginning-or-indent)

;;; C-x C-c で終了しない
(bind-key* "C-x C-c" 'helm-M-x)

;;; language
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)
(set-default 'buffer-file-coding-system 'utf-8-with-signature)

;;; indent
(setq-default default-tab-width 4 indent-tabs-mode nil)

;;; describe
(bind-key* "C-x C-h C-f" 'describe-function)
(bind-key* "C-x C-h C-v" 'describe-variable)
(bind-key* "C-x C-h C-k" 'describe-key)

;;; favotite
