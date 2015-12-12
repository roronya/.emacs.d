(use-package popwin)
(popwin-mode t)

(push '("*quickrun*" :height 20) popwin:special-display-config)
(push '("*Backtrace*" :height 20) popwin:special-display-config)
(push '("*Codic Result*" :height 20) popwin:special-display-config)

(bind-key "C-x C-d" 'codic)
