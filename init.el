(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)

(package-install 'use-package)
(package-install 'init-loader)
(package-install 'helm)
(package-install 'exec-path-from-shell)
(package-install 'expand-region)
(package-install 'smartrep)
(package-install 'elscreen)

(exec-path-from-shell-initialize)

(require 'use-package)
(require 'init-loader)
(custom-set-variables
 '(init-loader-show-log-after-init 'error-only))
(init-loader-load "~/.emacs.d/core")
(init-loader-load "~/.emacs.d/extensions")
