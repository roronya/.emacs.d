(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'ein:notebook-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
