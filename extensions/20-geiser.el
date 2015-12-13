(use-package geiser
  :config
  (setq geiser-racket-binary "/usr/bin/racket")
  (setq geiser-active-implementations '(racket))
  )

(use-package ac-geiser
  :init
  (add-hook 'geiser-mode-hook 'ac-geiser-setup)
  (add-hook 'geiser-repl-mode-hook 'ac-geiser-setup)
  (eval-after-load "auto-complete"
    '(add-to-list 'ac-modes 'geiser-repl-mode)
    )
  )
