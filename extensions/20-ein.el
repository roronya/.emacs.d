(use-package ein:notebook-mode
  :init
  (add-hook 'ein:notebook-mode-hook
            '(lambda ()
               (define-key ein:notebook-mode-map (kbd "<C-return>") 'ein:worksheet-execute-cell)
               (define-key ein:notebook-mode-map (kbd "<S-return>") 'ein:worksheet-insert-cell-below)))
  )
