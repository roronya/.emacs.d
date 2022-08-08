all: emacs pandoc cmigemo

emacs:
	brew tap railwaycat/emacsmacport
	brew install emacs-mac --with-no-title-bars --with-xwidgets

# markdownのレンダリングに使う
pandoc:
	brew install pandoc

# 日本語をローマ字で検索するのに使う
cmigemo:
	brew install cmigemo --HEAD
