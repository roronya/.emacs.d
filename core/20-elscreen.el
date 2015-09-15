(require 'elscreen)
(elscreen-start)
(elscreen-separate-buffer-list-mode 1)
(setq elscreen-tab-display-control nil)
(setq elscreen-prefix-key (kbd "M-C-]"))
(setq elscreen-display-tab nil) ; disable tabs display

;; get-alist was removed somewhere along the line
;; You can try substituting all instances of get-alist with assoc-default
;; instead of using defalias and see if that works; I haven't tried.
(defalias 'get-alist 'assoc-default) ; get-alist is gone

;; Put tabs display in your frame title bar instead.
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

(bind-keys ("C-t" . elscreen-create)
           ("C-w" . elscreen-kill)
           ("<C-tab>" . elscreen-next)
           ("<C-iso-lefttab>" . elscreen-previous))
