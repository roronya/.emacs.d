;;; indnet
(setq-default tab-width 4 indent-tabs-mode nil)

;;; delete backup files
(setq backup-inhibited t)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq delete-auto-save-files t)

;;; scroll
(bind-key* "M-p" 'scroll-down)
(bind-key* "M-n" 'scroll-up)

;;; rename
(bind-key* "C-x C-w" 'rename-file-and-buffer)

;;; move
(bind-key* "C-M-a" 'beginning-of-defun)
(bind-key* "C-M-e" 'end-of-defun)

(defun my/goto-line-beginning-or-indent (&optional $position)
  (interactive)
  (or $position (setq $position (point)))
  (let (($starting-position (progn (back-to-indentation) (point))))
    (if (eq $starting-position $position)
      (move-beginning-of-line 1))))
(bind-key* "C-a" 'my/goto-line-beginning-or-indent)

;;; C-x C-c で終了しない
(bind-key* "C-x C-c" 'helm-M-x)

;;; describe
(bind-key* "C-x C-h C-f" 'describe-function)
(bind-key* "C-x C-h C-v" 'describe-variable)
(bind-key* "C-x C-h C-k" 'describe-key)
(bind-key* "C-x C-h C-m" 'describe-mode)

;;; patoronage
(bind-key* "C-x C-p C-e" 'ein:notebooklist-open)
