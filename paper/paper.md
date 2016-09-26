Abstract
========

This report discusses the function, use, and importance of five tools
that address the lack of reproducible research: Make, Git, GitHub,
pandoc, and Markdown. This report will also detail the resources used to
generate it, comment on the ease or difficulty of producing the project,
and note the purpose of creating this project along with its take-home
messages.

Introduction
============

The inability to reproduce work is a severe roadblock in the way of
scientific study. In a world where scientific research is often taken,
not only by the laypeople but also by politicians and organizational
leaders, as gospel when it comes to making decisions for themselves or
for others, it is the responsibility of the researchers to ensure not
only that their own studies are correct, but also that other researchers
can verify their correctness and that they themselves verify the
research that others publish. To that end, it is important that
researchers employ the tools at their disposal for making their
research, methodology, and data as public and as compatible with other
machines as possible. This report will look at five of these tools -
Make, Git, GitHub, pandoc, and Markdown - and address their function,
how to use them at a rudimentary level, why they are important for the
reproducible workflow, and how they address the current lack of
reproducible research in the world today. This project should function
not only as an introduction to these tools but also as a re-introduction
to them, for those who have not used them in a while; this can be used
as a basic guide to these five tools that would allow anyone to
immediately begin a reproducible project.

Utilities of Reproducible Workflows
===================================

What is a Makefile?
-------------------

A Makefile is a document that is used in running Make, a Unix utility. A
Makefile contains shell commands, and when "make" is called in the
terminal the specified shell commands are run, updating old files as
necessary. A Makefile can be used to show the various shell commands
that are used in the process of making a project, which are often not
shown in standard files because they are not code per se. Preserving the
shell commands allows the project owner to return to the project after
some time away, and still be able to recreate many of the files that are
necessary for the project. Additionally,by including a Makefile in the
project specs others who want to reproduce the project can run the
Makefile to perform exactly the same actions as the author, exactly the
way the author performed them; thus, the process of exactly reproducing
the project and its results is much simpler andmistakes in the process
can be more easily identified.

A Makefile uses special syntax, somewhat akin to functions, that tells
the system what command string to run. This is implemented by a "rule"
target, followed by a ":", which signifies the intended output files for
the rule; all lines below that are indented with a "\t" (a tab space)
will be executed in the shell when the Makefile is run. Each rule may
have dependencies following the ":"; these files must be present in
order for the rule to execute, otherwise it returns an error for the
missing file(s). When `make` is called, it will check the time of the
last edit of all the target file and its dependent files; if the times
are different then Make will run those rules and update the target
files, if not then Make will simply say that the files are up to date.
Variables can also be created, and will stand in for any string of text
within the Makefile; this is useful when there is a text string that
appears multiple times within the Makefile, especially a long one like a
file extension. These variables can be called within the Makefile by
substituting the string with `$(variable name)`. When the user uses the
make command in the shell, the Makefile will run the `all:` rule, if
defined, which runs the rule(s) that follow the colon. Other rules may
be defined, but do not have to be called by all:; instead, the user can
run `make (rule name)` in the shell to run that series of command lines.
A basic implementation of a Makefile may look something like this:

    files = folder1/folder2

    all: removefile

    removefile:
        rm $(files)/file1.txt

    createfile:
        touch file1.txt

What is Git?
------------

![](../images/git-logo.png "This is Git's Logo")

Git is a version control system that logs the changes made to the files
a project is using. Git stores this information in the form of snapshots
of the file system at given points; this allows a user to not only store
the process they took to build the project but also allows them to
revert to an older version of the project, which may be necessary if the
current version no longer works or if the user made a fatal error in
editing the files or their structure.

Git is run through the shell. A user begins by initializing a directory
as a Git repository; once the user makes changes to this repository,
such as by adding files or directories, the user can then add those
changes to the "staging area," which notes the changes in the repository
that have yet to be saved. The user then commits these changes, and Git
takes a snapshot of the respository and all the files it was following;
now this version of the respository can be recalled at a later time. A
general outline of the use of Git, from initialization to first commit,
will look something like this:

    #assuming you are in the directory that is to become the respository
    >git init #initializes the directory as a Git repository
    >touch file1.txt
    >git status #to check the files that have changed and need to be added to the staging area
    >git add file1.txt #Git now tracks file1.txt for changes
    >git commit -m "First commit" #use -m to add a message - good commit messages help people understand how this version is different from the previous one

The user can check differences between the current version and the
latest saved version of a file by calling:

    >git diff HEAD~X <file>

This will show the changes made to the file since the specified commit.
`X` can be any number here, but if `X` == 0 then the `~` is omitted. `X`
denotes the number of commits in the past the user wants to compare; for
example, if there have been three commits and the user wants to see the
difference between the current version and the original version, the
user would call:

    >git diff HEAD~2 <file>

If the user has made a change that they do not want to commit, the user
can call:

    >git checkout -- <file>

This will revert the `<file>` to its previous state (the state it was in
after the last commit); however, this command won't remove the file from
the staging area if it's already there. If the file is already in the
staging area, the user can call:

    >git reset HEAD <file>

This removes the `<file>` from the staging area, but does not revert it
to its last version. The user would use `git checkout -- <file>` to then
revert the changes.

What is GitHub?
---------------

![](../images/github-logo.png "This is GitHub's Logo. Isn't it cute?")

GitHub is an online storage location for Git repositories; that is, it
stores all the snapshots online, allowing for access across different
machines. This is exceptionally useful when a project has multiple
collaborators, all making different changes to the project files; each
user may commit changes to the online repository, and each user can pull
the latest versions of the project to their local machine so that they
always have an updated version of the project. For this project, GitHub
acts as a storage area for the project so that the instructors can view
the files in my "submission", and also serves as an online repository to
save my progress should anything happen to my local files.

GitHub is largely accessed through the site, github.com. After making an
account users can create a repository on the account, which has almost
exactly the same function as a local Git repository. Users can bind the
GitHub repository to their local repository via the commands:

    >git remote add origin <link>
    >git push -u origin master

This will connect the local repository to the GitHub repository, and as
the user makes commits they can then use the second line to push those
changes to the GitHub repository online. If there are multiple
collaborators on a project and several people are pushing their code to
the GitHub repository, a user can call:

    >git pull

This will pull the latest updates from the GitHub repository, if there
have been commits that do not match the local commits.

What is Pandoc?
---------------

![](../images/pandoc-logo.png "This is Pandoc's site header")

Pandoc is a Unix utility that facilitates file conversion between a wide
variety of files. Pandoc allows users to easily convert files into
different formats, which allows them to be posted on different platforms
and more easily transmit them to other machines. This facilitates
simpler compilations of text to be published online, but also
facilitates a user's ability to download another researcher's files
(which are often in .pdf or .html formats, which are not very conducive
to editing) and convert them into a workable format, thus allowing them
to more easily try to reproduce the results of the research.

Pandoc is run from the command line. The most basic call to pandoc would
be:

    >pandoc -f <format1> -t <format2> <file>

This converts `file` from `format1` to `format2`. A simpler
implementation is to call:

    >pandoc -o <output_file> <input_file>

This takes the extension of `input_file` and converts from that format
to the extension of the `output_file`. Converting to .pdf requires LaTeX
be present on the machine.

What is Markdown?
-----------------

Markdown is a "text-to-HTML conversion tool for web writers," which
allows users to write in plain text and convert it automatically to
formatted HTML. Users can use pandoc to convert a markdown (.md) file
into a .html file, which will make the formatting visible when the .html
is opened.

Header lines can be made by putting a string of "\#" in front of the
line of text. Headers are smaller in size the more "\#" there are, up to
six. Users can add emphasis to pieces of text: italics go in a pair of
"\*" or "\_", bold goes in a pair of "\*\*" or "\_\_", and a
strikethrough goes in a pair of "\~\~". In order to make a list, start
with a number followed by a period, such as "1."; keep going with
numbers in this format to make an ordered list. An unordered sublist can
be made using "\t*" (a tab and an asterisk) at the beginning of the
line; ordered sublists are made using "\t1." (a tab and a number). Users
can put links into their .md files in various ways; the most basic way
is using `[Link text](<link> 'Link text when hovered over')`. An image
can be inserted using
`![Image text](<link or path to image> 'Image text when hovered over')`.
When putting code into a document, the user can put the code in a pair
of "\`" or, if there are multiple lines of code, put the code in a block
separated by "\`\`\`" at the top and bottom of the block. A horizontal
break line can be made using "\*\*\*", "\_\_\_", or "---". Examples are
below:

    #This is Markdown!

    ##This is also Markdown! But smaller

    ###And so on and so forth

    *italics*

    **bold**

    ~~strikethrough~~

    1. List item 1

    2. List item 2

        * Unordered list item 1

    3. List item 3

        1. Ordered list item 1

    * Unordered list item

    Horizontal Line Break

    ***

    [Google](www.google.com "This is a link")

    ![Markdown Logo](../images/markdown-logo.png "This is an image. Markdown!")

    `y = m * x + b`

This is Markdown!
=================

This is also Markdown! But smaller
----------------------------------

### And so on and so forth

*italics*

**bold**

~~strikethrough~~

1.  List item 1

2.  List item 2

    -   Unordered list item 1

3.  List item 3

    1.  Ordered list item 1

-   Unordered list item

Horizontal Line Break

------------------------------------------------------------------------

[Google](www.google.com "This is a link")

![Markdown
Logo](../images/markdown-logo.png "This is an image. Markdown!")

`y = m * x + b`

### Tables in Markdown

Some versions of Markdown support the creation of tables. Tables are
created by separating the different columns by "|". A "title" row can be
created by having a line of "---" (at least three-long) in the row
directly beneath that column title. If a ":" is added at the beginning
and/or end of the line of dashes, the text in that column will be
justified towards the colon; each column is left-justified by default.

    |This|is|a|Table|
    |---|:---:|:---:|---:|
    |left-justified|center-justified|also center-justified|right-justified|
    |5! = 120|Alexander|Lee|Scarves|

  This                     is                    a                        Table
  ---------------- ------------------ ----------------------- -----------------
  left-justified    center-justified   also center-justified    right-justified
  5! = 120             Alexander                Lee                     Scarves

This example above shows that this verion of Markdown supports the
creation of tables but does not support a very pretty style of table.

This Report
-----------

This report was made using a combination of all the tools mentioned in
the report. Make was used to download the .png files and construct
paper.md and paper.html. Git was used to store the local changes to all
the files in the project. GitHub was used to store the local changes in
an online repository, and will be used as a "submission" of sorts for
the grading of it. Pandoc was used to convert paper.md to paper.html.
All written portions of the project were written in Markdown. The main
websites of each of these tools were used to get a general idea of what
the creators intended the tool be used for, and their importance to
reproducibility were taken from lectures. The "easy" part was explaining
how to use the tools, particularly because the documentation for all of
them is easily found online and/or drawn from lecture. The challenge was
figuring out how to format the written portions based on the given file
structure in the instructions. The most time consuming part was writing
the content of 02-discussion.md, since it was the bulk of the project as
it explained the usage of the five tools. Because this was a solo
project, GitHub was only used for storage; `git pull` never had to be
called, as there were no additional commits to pull. The whole project
has taken about 8-10 hours.

Conclusion
==========

Reproducibility is the hallmark of a complete study: if the results
cannot be reproduced, the conclusions of that study should be
disregarded until further research supports it. To that end, researchers
need to support the reproducibility of their own work by utilizing the
various tools available to them. Make is a tool that allows users (and
others) to run the exact same shell commands every single time, no
matter how many, without error; this allows other researchers to
reproduce the shell commands, which are often hidden because they are
not typically considered "code". Git is a tool that handles version
control of the project, facilitating the storage and retrieval of
various versions of the project. GitHub, an online extension of Git,
gives the benefits of Git to various collaborators and provides a public
history of the project's versions for outside researchers to access.
