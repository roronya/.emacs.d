(use-package yasnippet
  :init
  (yas-global-mode t)
  :config
  (setq yas-snippet-dirs
	'("~/.emacs.d/mysnippets"))
  :bind
  (("C-c C-s C-n" . yas-new-snippet)
   ("C-c C-s C-v" . yas-visit-snippet-file))
  )

(use-package helm-c-yasnippet
  :init
  (setq helm-yas-space-metch-any-greedy t)
  :bind
  (("C-c C-s C-y" . helm-yas-complete))
  )
