(use-package web-mode
  :mode (("\\.php?\\'" . web-mode)
         ("\\.html?\\'" . web-mode)
         ("\\.twig?\\'" . web-mode)
         )
  :config
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  )
