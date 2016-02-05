(require 'helm)
(helm-mode t)
(bind-key "C-x C-f" 'helm-find-files)
(bind-key "M-x" 'helm-M-x)
(bind-key "C-x C-b" 'helm-buffers-list)

(bind-keys :map helm-find-files-map
           ("C-l" . helm-execute-persistent-action)
           ("C-h" . helm-find-files-up-one-level))

(bind-keys :map helm-map
           ("C-j" . helm-next-line)
           ("C-k" . helm-previous-line))

(defun evil-swap-key (map key1 key2)
  ;; MAP中のKEY1とKEY2を入れ替え
  "Swap KEY1 and KEY2 in MAP."
  (let ((def1 (lookup-key map key1))
        (def2 (lookup-key map key2)))
    (define-key map key1 def2)
    (define-key map key2 def1)))
(evil-swap-key evil-motion-state-map "j" "gj")
(evil-swap-key evil-motion-state-map "k" "gk")
