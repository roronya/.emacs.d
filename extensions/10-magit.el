(global-unset-key "\C-x\C-v")
(use-package magit
  :init
  (add-hook 'magit-status-mode-hook
            (lambda ()
              (local-unset-key "\C-w")))
  (add-hook 'magit-diff-mode-hook
            (lambda ()
              (local-unset-key "\C-w")))
  (add-to-list 'process-coding-system-alist '("git" utf-8 . utf-8))
  (add-hook 'git-commit-mode-hook
            '(lambda ()
               (set-buffer-file-coding-system 'utf-8)))
  :bind
  (("C-x C-v C-s" . magit-status))
)
