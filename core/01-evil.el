;;(require 'evil)
;;(evil-mode 1)
(add-hook 'evil-normal-state-entry-hook
          '(lambda()
             (set-cursor-color "#00bfff")))
(add-hook 'evil-insert-state-entry-hook
          '(lambda()
             (set-cursor-color "#CC145B")))

(set-cursor-color "#CC145B")

;;; 物理行移動と論理行移動を入れ替え 
(defun evil-swap-key (map key1 key2)
  ;; MAP中のKEY1とKEY2を入れ替え
  "Swap KEY1 and KEY2 in MAP."
  (let ((def1 (lookup-key map key1))
        (def2 (lookup-key map key2)))
    (define-key map key1 def2)
    (define-key map key2 def1)))
(evil-swap-key evil-motion-state-map "j" "gj")
(evil-swap-key evil-motion-state-map "k" "gk")

(bind-keys :map evil-insert-state-map
           ("C-c" . evil-normal-state)
           ("C-h" . backward-char)
           ("C-j" . next-line)
           ("C-k" . previous-line)
           ("C-l" . forward-char))

