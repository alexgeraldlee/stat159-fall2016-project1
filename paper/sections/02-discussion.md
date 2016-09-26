#Utilities of Reproducible Workflows


##What is a Makefile?

A Makefile is a document that is used in running Make, a Unix utility. 
A Makefile contains shell commands, and when "make" is called in the
terminal the specified shell commands are run, updating old files as
necessary. A Makefile can be used to show the various shell commands 
that are used in the process of making a project, which are often not
shown in standard files because they are not code per se. Preserving
the shell commands allows the project owner to return to the project
after some time away, and still be able to recreate many of the files
that are necessary for the project. Additionally,by including a Makefile
in the project specs others who want to reproduce the project can run 
the Makefile to perform exactly the same actions as the author, exactly 
the way the author performed them; thus, the process of exactly 
reproducing the project and its results is much simpler andmistakes
in the process can be more easily identified. 


A Makefile uses special syntax, somewhat akin to functions, that tells the
system what command string to run. This is implemented by a "function" name,
followed by a ":"; all lines below that are indented with a "\t" (a tab space)
will be executed when the Makefile is run. Variables can also be created, and
will stand in for any string of text within the Makefile; this is useful when
there is a text string that appears multiple times within the Makefile,
especially a long one like a file extension. These variables can be called
within the Makefile by substituting the string with $(variable name). 
When the user uses the make command in the shell, the Makefile will run the 
all: function, which runs the function(s) that follow the colon. Other functions
may be defined, but do not have to be called by all:; instead, the user can run
"make (function name)" in the shell to run that series of command lines. A basic 
implementation of a Makefile may look something like this:


```
files = ~/Desktop/folder1/

all: removefile

removefile:
	rm $(files)/file1.txt

createfile:
	touch file1.txt
```

##What is Git?

![](../images/git-logo.png "This is Git's Logo")

Git is a version control system that logs the changes made to the files
a project is using. Git stores this information in the form of snapshots
of the file system at given points; this allows a user to not only store 
the process they took to build the project but also allows them to revert 
to an older version of the project, which may be necessary if the current
version no longer works or the user made a fatal error in editing the files
or their structure.


Git is run through the shell. A user begins by initializing a directory as
a Git repository; once the user makes changes to this repository, such as by
adding files or directories, the user can then add those changes to the 
"staging area," which notes the changes in the repository that have yet to be
saved. The user then commits these changes, and Git takes a snapshot of the
respository and all the files it was following; now this version of the 
respository can be recalled at a later time. A general outline of the use of
Git, from initialization to first commit, will look something like this:


```
#assuming you are in the directory that is to become the respository
>git init #initializes the directory as a Git repository
>touch file1.txt
>git status #to check the files that have changed and need to be added to the staging area
>git add file1.txt #Git now tracks file1.txt for changes
>git commit -m "First commit" #use -m to add a message - good commit messages help people understand how this version is different from the previous one
```


The user can check differences between the current version and the latest saved
version of a file by calling:

```
>git diff HEAD~X <file>
```


This will show the changes made to the file since the specified commit. X can be any 
number here, but if X == 0 then the ~ is omitted. X denotes the number of commits
in the past the user wants to compare; for example, if there have been three commits and the user
wants to see the difference between the current version and the original version, the user would call:

```
>git diff HEAD~2 <file>
```


If the user has made a change that they do not want to commit, the user can call:

```
>git checkout -- <file>
```


This will revert the file to its previous state (the state it was in after the
last commit); however, this command won't remove the file from the staging area
if it's already there. If the file is already in the staging area, the user can call:

```
>git reset HEAD <file>
```


This removes the file from the staging area, but does not revert it to its last version.


##What is GitHub?

![](../images/github-logo.png "This is GitHub's Logo. Isn't it cute?")

GitHub is an online storage location for Git repositories; that is, it
stores all the snapshots online, allowing for access across different
machines. This is exceptionally useful when a project has multiple
collaborators, all making different changes to the project files; each
user may commit changes to the online repository, and each user can pull
the latest versions of the project to their local machine so that they
always have an updated version of the project. For this project, GitHub
acts as a storage area for the project so that the instructors can view
the files in my "submission", and also serves as an online repository
to save my progress should anything happen to my local files.


GitHub is largely accessed through the site, github.com. After making
an account users can create a repository on the account, which has almost
exactly the same function as a local Git repository. Users can bind the
GitHub repository to their local repository via the commands:

```
>git remote add origin <link>
>git push -u origin master
```

This will connect the local repository to the GitHub repository, and as
the user makes commits they can then use the second line to push those 
changes to the GitHub repository online. If there are multiple collaborators
on a project and several people are pushing their code to the GitHub
repository, a user can call:

```
>git pull
```


This will pull the latest updates from the GitHub repository, if there
have been commits that do not match the local commits.


##What is Pandoc?

![](../images/pandoc-logo.png "This is Pandoc's site header")

Pandoc is a Unix utility that facilitates file conversion between a wide
variety of files. Pandoc allows users to easily convert files into different
formats, which allows them to be posted on different platforms and more
easily transmit them to other machines. 


##What is Markdown?

![](../images/markdown-logo.png "M-down")

Markdown is a "text-to-HTML conversion tool for web writers," which allows 
anyone to write in plain text and convert it automatically to formatted HTML.

