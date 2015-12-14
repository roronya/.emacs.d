(use-package yasnippet
  :conig
  (setq yas-snippet-dirs
	'("~/.emacs.d/mysnippets"
	  "~/.emacs.d/yasnippets"))
  :bind
  (("C-x C-y") 'yas-insert-snippet)
  )
