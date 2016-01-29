;;; indnet
(setq-default tab-width 4 indent-tabs-mode nil)

;;; delete backup files
(setq backup-inhibited t)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq delete-auto-save-files t)

;;; auto reload
(global-auto-revert-mode t)

;;; scroll
(bind-key* "M-p" 'scroll-down)
(bind-key* "M-n" 'scroll-up)

;;; rename
(bind-key* "C-x C-w" 'rename-file-and-buffer)

;;; move
(bind-key* "C-M-a" 'beginning-of-defun)
(bind-key* "C-M-e" 'end-of-defun)

;;; C-x C-c で終了しない
(bind-key* "C-x C-c" 'helm-M-x)

;;; describe
(bind-key* "C-x C-h C-f" 'describe-function)
(bind-key* "C-x C-h C-v" 'describe-variable)
(bind-key* "C-x C-h C-k" 'describe-key)
(bind-key* "C-x C-h C-m" 'describe-mode)

;;; patoronage
(bind-key* "C-x C-p C-e" 'ein:notebooklist-open)
