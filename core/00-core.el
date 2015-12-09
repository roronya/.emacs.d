;;; delete backup files
(setq backup-inhibited t)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq delete-auto-save-files t)

(require 'expand-region)
(require 'smartrep)
(require 'elscreen)

;;; 範囲系
(global-unset-key "\C-r")
(smartrep-define-key global-map "C-r"
  '(("C-r" . 'er/expand-region)
    ("M-r" . 'er/contract-region)
    ("C-d" . 'kill-region)
    ("C-c" . 'kill-ring-save)
    )
  )

;;; Window 系
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

;;; Tab 系
(elscreen-start)
(global-unset-key "\C-t")
(smartrep-define-key global-map "C-t"
  '(("C-t" . 'elscreen-create)
    ("C-w" . 'elscreen-kill)
    ("C-n" . 'elscreen-next)
    ("C-p" . 'elscreen-previous)
    )
  )

(setq kill-whole-line t)
(bind-keys
 ("C-u" . undo)
 
 ("M-p" . scroll-down)
 ("M-n" . scroll-up)
)
