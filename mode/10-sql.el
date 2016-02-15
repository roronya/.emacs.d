(custom-set-variables
 '(sql-product 'postgres))
(setq sql-indent-offset 2)
(eval-after-load "sql"
  '(load-library "sql-indent"))
