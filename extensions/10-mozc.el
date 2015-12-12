(use-package mozc
  :init
  (set-language-environment "Japanese")
  (setq default-input-method "japanese-mozc")
  (setq mozc-candidate-style 'overlay)
  )

(add-hook 'input-method-activate-hook
          (lambda () (set-cursor-color "blue")))

(add-hook 'input-method-inactivate-hook
	  (lambda () (set-cursor-color "#CC145B")))
