;;; auto reload
(global-auto-revert-mode t)

;;; C-x C-c で終了しない
(bind-key* "C-x C-c" 'helm-M-x)
