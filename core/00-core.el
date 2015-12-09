;;; delete backup files
(setq backup-inhibited t)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq delete-auto-save-files t)

(require 'expand-region)
(require 'smartrep)
(require 'elscreen)

;;; Region
(global-unset-key "\C-r")
(smartrep-define-key global-map "C-r"
  '(("C-r" . 'er/expand-region)
    ("M-r" . 'er/contract-region)
    ("C-d" . 'kill-region)
    ("C-c" . 'kill-ring-save)
    )
  )

;;; Window
(global-unset-key "\C-w")
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
    )
  )

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

;;; kill-line
(setq kill-whole-line t)
(defun my/delete-region-or-char ()
  (interactive)
  (if (region-active-p)
      (kill-region (region-beginning) (region-end))
    (delete-char 1 nil)))
(bind-key "C-d" 'my/delete-region-or-char)

;;; kill-word-at-point
(defun my/kill-word-at-point ()
      (interactive)
      (let ((char (char-to-string (char-after (point)))))
        (cond
         ((string= " " char) (delete-horizontal-space))
         ((string-match "[\t\n -@\[-`{-~]" char) (kill-word 1))
         (t (forward-char) (backward-word) (kill-word 1)))))
(bind-key "M-d" 'my/kill-word-at-point)

;;; undo
(bind-key "C-u" 'undo)

;;; scroll
(bind-key "M-p" 'scroll-down)
(bind-key "M-n" 'scroll-up)
