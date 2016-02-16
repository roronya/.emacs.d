(require 'undo-tree)
(global-undo-tree-mode)
(bind-key "C-x C-u" 'undo-tree-visualize)

(require 'undohist)
(undohist-initialize)
;;; 永続化を無視するファイル名の正規表現
(setq undohist-ignored-files
      '("/tmp/" "COMMIT_EDITMSG"))
