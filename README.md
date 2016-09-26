#Author Name: Alexander Lee

##Project Structure

The final structure of the project should look something like this:

```
stat159-fall2016-project1/
	.gitignore
	README.md
	Makefile
	paper/
		sections/
			00-abstract.md
			01-introduction.md
			02-discussion.md
			03-conclusions.md
		paper.md
		paper.html
	images/
		git-logo.png
		github-logo.png
		markdown-logo.png
		pandoc-logo.png
		stat159-logo.png
```

##The Makefile

The Makefile is used to construct paper.md and paper.html, by compiling the .md files in sections/ using pandoc. The Makefile also holds a script "clean" that can be called to remove the .html file from the paper/ directory, a script to download all the relevant .png files, and a script to initialize the .md files used to compile paper.md. 
