(add-hook 'input-method-activate-hook
          (lambda () (set-cursor-color "blue")))

(add-hook 'input-method-inactivate-hook
	  (lambda () (set-cursor-color "#CC145B")))
