(use-package flycheck
  :init
  (global-flycheck-mode t)
  )

(eval-after-load 'flycheck
  '(custom-set-variables
   '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))
