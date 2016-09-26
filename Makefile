mds = $(wildcard paper/sections/*.md)
paper = paper/sections
site = https://raw.githubusercontent.com/ucb-stat159/stat159-fall-2016/master/projects/proj01/images/

all: paper.html


paper.html: $(mds)
	pandoc -s $(mds) -o paper/paper.md
	pandoc -s paper/paper.md -o paper/paper.html

images.png: 
	curl $(site)/git-logo.png -o images/git-logo.png
	curl $(site)/github-logo.png -o images/github-logo.png
	curl $(site)/markdown-logo.png -o images/markdown-logo.png
	curl $(site)/pandoc-logo.png -o images/pandoc-logo.png
	curl $(site)/stat159-logo.png -o images/stat159-logo.png

sections:
	touch $(paper)/00-abstract.md
	touch $(paper)/01-introduction.md
	touch $(paper)/02-discussion.md
	touch $(paper)/03-conclusion.md

clean:
	rm paper/paper.html
