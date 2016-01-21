(use-package web-mode
  :mode (("\\.php?\\'" . web-mode)
         ("\\.html?\\'" . web-mode)
         ("\\.twig?\\'" . web-mode)
         )
  :config
  (setq web-mode-markup-indent-offset 2)
  )
