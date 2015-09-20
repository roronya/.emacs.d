(use-package python-mode
  :init
  (add-hook 'python-hook
            '(lambda()
               (jedi:setup)
               (rainbow-delimiters-mode)
               (hs-minor-mode)
               ))
  :config
  (setq jedi:complete-on-dot t)
  (setq indent-tabs-mode nil)
  (setq indent-level 4)
  (setq tab-width 4)
  (setq python-indent 4)
  :mode
  (("\\.py?\\'" . python-mode))
  )
