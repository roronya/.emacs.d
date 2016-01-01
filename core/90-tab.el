(require 'elscreen)

(elscreen-start)
(global-unset-key "\M-t")
(smartrep-define-key global-map "M-t"
  '(("t" . 'elscreen-create)
    ("d" . 'elscreen-kill)
    ("l" . 'elscreen-next)
    ("h" . 'elscreen-previous)
    ("c" . 'elscreen-clone)
    )
  )
