(use-package helm
  :init
  (helm-mode 1)
  (bind-keys :map helm-read-file-map
             ("C-l" . helm-execute-persistent-action)
             ("C-h" . helm-find-files-up-one-level))
  
  :bind
  (("C-x C-b" . helm-buffers-list)))
