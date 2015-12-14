(use-package yasnippet
  :init
  (yas-global-mode t)
  :config
  (setq yas-snippet-dirs
	'("~/.emacs.d/mysnippets"))
  :bind
  (("C-x C-y C-n" . yas-new-snippet)
   ("C-x C-y C-v" . yas-visit-snippet-file))
  )

(use-package helm-c-yasnippet
  :init
  (setq helm-yas-space-metch-any-greedy t)
  :bind
  (("C-x C-y C-y" . helm-yas-complete))
  )
