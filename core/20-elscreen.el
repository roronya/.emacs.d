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
