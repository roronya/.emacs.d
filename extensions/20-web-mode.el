(use-package web-mode
  :init
  (defun my-web-mode-hook ()
    (setq web-mode-enable-auto-pairing nil))

  (add-hook 'web-mode-hook  'my-web-mode-hook)

  (defun sp-web-mode-is-code-context (id action context)
    (and (eq action 'insert)
         (not (or (get-text-property (point) 'part-side)
                  (get-text-property (point) 'block-side)))))

  (sp-local-pair 'web-mode "<" nil :when '(sp-web-mode-is-code-context))
  :mode (("\\.php?\\'" . web-mode)
         ("\\.html?\\'" . web-mode)
         ("\\.twig?\\'" . web-mode)
         )
  :config
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 4)
  )
