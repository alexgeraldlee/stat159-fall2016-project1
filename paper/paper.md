Abstract
========

This report gives descriptions of various utilities used in the
reproducible workflow, giving a general idea of the function of each,
how it can be used, and why it is an asset for reproducibility; these
utilities are Make, Git, GitHub, pandoc, and Markdown. This report will
also detail the resources used to generate the report, comment on the
ease or difficulty of creating the project, and note the purpose of
creating this project along with its take-home messages.

Introduction
============

This project serves as an introduction to Make, Git, GitHub, pandoc, and
Markdown. These utilities are widely used to make research more easily
preproduced, and are important utilities to ensure the preservation of
the creative process.

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

What is Git?
------------

Git is a version control system that logs the changes made to the files
a project is using. Git stores this information in the form of snapshots
of the file system at given points; this allows a user to not only store
the process they took to build the project but also allows them to
revert to an older version of the project, which may be necessary if the
current version no longer works or the user made a fatal error in
editing the files or their structure.

What is GitHub?
---------------

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

What is Pandoc?
---------------

Pandoc is a Unix utility that facilitates file conversion between a wide
variety of files. Pandoc allows users to easily convert files into
different formats, which allows them to be posted on different platforms
and more easily transmit them to other machines.
