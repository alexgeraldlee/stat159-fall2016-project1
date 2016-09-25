mds = $(wildcard paper/sections/*.md)

all: paper.html


paper.html: $(mds)
	pandoc -s $(mds) -o paper/paper.md
	pandoc -s paper/paper.md -o paper/paper.html


clean:
	rm paper/paper.html
