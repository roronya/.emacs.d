L = setup.el

emacs : $L
	emacs -Q --batch -l $L
