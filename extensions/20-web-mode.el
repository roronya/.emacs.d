(use-package web-mode
  :mode (("\\.php?\\'" . web-mode)
	 ("\\.html?\\'" . web-mode)
	 ("\\.twig?\\'" . web-mode)
	 )
  :config
  (setq web-mode-html-offset 4)
  (setq web-mode-css-offset 4)
  (setq web-mode-script-offset 4)
  (setq web-mode-php-offset 4)
  (setq tab-width 4)
  )
