(use-package popwin)
(popwin-mode t)

(push '("*quickrun*" :height 20) popwin:special-display-config)
(push '("*Backtrace*" :height 20) popwin:special-display-config)
