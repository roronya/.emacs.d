(use-package eval-in-repl)

(use-package eval-in-repl-python
  :init
  (bind-key "<C-return>" 'eir-eval-in-python))
