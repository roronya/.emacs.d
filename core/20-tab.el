(require 'elscreen)
(elscreen-start)
(setq elscreen-tab-display-control nil)
(setq elscreen-display-tab nil)
(defalias 'get-alist 'assoc-default)
(defun elscreen-frame-title-update ()
  (when (elscreen-screen-modified-p 'elscreen-frame-title-update)
    (let* ((screen-list (sort (elscreen-get-screen-list) '<))
           (screen-to-name-alist (elscreen-get-screen-to-name-alist))
           (title (concat "| " (mapconcat
                                (lambda (screen)
                                  (format "%d%s %s |"
                                          screen (elscreen-status-label screen)
                                          (get-alist screen screen-to-name-alist)))
                                screen-list " "))))
      (if (fboundp 'set-frame-name)
          (set-frame-name title)
        (setq frame-title-format title)))))
(eval-after-load "elscreen"
  '(add-hook 'elscreen-screen-update-hook 'elscreen-frame-title-update))

(global-unset-key "\M-t")
(smartrep-define-key global-map "M-t"
  '(("t" . 'elscreen-create)
    ("d" . 'elscreen-kill)
    ("l" . 'elscreen-next)
    ("h" . 'elscreen-previous)
    ("c" . 'elscreen-clone)
    )
  )

(defun elscreen-insert-internal (screen)
  (elscreen-clone screen)
  (elscreen-kill-internal screen))

(defun elscreen-get-gap-next ()
  (let ((screen-list (sort (elscreen-get-screen-list) '<))
    (screen 0))
    (while (eq (nth screen screen-list) screen)
      (setq screen (+ screen 1)))
    (nth screen screen-list)))

(defun elscreen-get-packed-num ()
  (let ((screen-list (sort (elscreen-get-screen-list) '<))
    (current-screen (elscreen-get-current-screen))
    (screen 0))
    (while (not (eq (nth screen screen-list) current-screen))
      (setq screen (+ screen 1)))
    screen))

(defun elscreen-pack-list ()
  (interactive)
  (let ((next (elscreen-get-gap-next))
    (pack (elscreen-get-packed-num)))
    (while next
      (elscreen-insert-internal next)
      (setq next (elscreen-get-gap-next)))
    (elscreen-goto pack)
    (elscreen-notify-screen-modification 'force)))

;killしたらpackする
(add-hook 'elscreen-kill-hook 'elscreen-pack-list)

;swap前後で同じバッファを表示
(defadvice elscreen-swap
  (after elscreen-swap-jump activate)
  (elscreen-goto (elscreen-get-previous-screen)))
