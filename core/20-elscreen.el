(require 'elscreen)
(elscreen-start)
(elscreen-separate-buffer-list-mode 1)

(setq elscreen-prefix-key (kbd "M-C-]"))
(bind-keys ("C-t" . elscreen-create)
           ("C-w" . elscreen-kill)
           ("<C-tab>" . elscreen-next)
           ("<C-iso-lefttab>" . elscreen-previous))
