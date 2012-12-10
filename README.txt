git-svn-clone-externals
=======================

This is a very simple shell script to make git-svn clone your svn:externals
definitions.  Place the script in a directory where you have one or more
svn:externals definitions, run it, and it will:

* git svn clone each external into a .git_externals/ directory.
* symlink the cloned repository in .git_externals/ to the proper directory
  name.
* add the symlink and .git_externals/ to the .git/info/excludes/ file, so that
  you're not pestered about it when performing a git status.

That's pretty much about it.  Low-tech and cheap and cheery, but I couldn't
find anything else like it after extensive Googling, so hopefully some other
people out there with low-tech minds like mine will find this useful.

You could certainly make the script a lot more complex and do things such as
share svn:externals repositories between different git repositories, traverse
through the entire git repository to detect svn:externals definitions instead
of having to place the script in the correct directory, etc... but this works,
it's simple, and it does just the one thing, unlike a lot of other git/svn
integration scripts that I've found.  I absolutely do welcome those features,
but I figured I'd push this out since it works for me and is probably useful
for others.

NB: This assumes you have passwordless svn.

Enjoy,

- Andre Pang <ozone@algorithm.com.au>

Forced USE_SSH to on, and can take the externals from a file .git_externals_include.
- anonfunc@gmail.com


Tools
=====

The git-svn-clone-externals script does a great job of cloning the
svn:externals. However, in day-to-day work I want to check whether I
need to push stuff and update a buch of 'external' repositories in one
go. Therefore I creates some additional scripts.

* git-svn-externals-check is a script that displays whether there are
  uncommitted changes or commits that are not pushed to the subversion
  repository yet. Basically it executes ``git status`` and the
  ``git-svn-check-unpushed`` scripts for each directory in the current
  directory.

* git-svn-externals-update complements the git-svn-externals-check
  script. The update script does an ``git svn fetch`` and ``git svn
  rebase`` for every directory in the location where the script is
  executed.

Feel free to use and improve these scripts.

- Mark van Lent <mark@vlent.nl>

Removed git-svn-check-unpushed, replaced usage in git-svn-externals-check.
- anonfunc@gmail.com

Options
=======

* External repository's url are rewritten to use SVN+SSH.
* If you don't want to pull all external repositories, you can create a
  .git_externals_exclude file which contains the local paths to be excluded,
  one per line, the same way they show up on the first field of git svn show-externals
* You can also create a
  .git_externals_include file which contains the externals to be included,
  one per line, the same way they show up as the whole line of git svn show-externals

- Alexander Artemenko <svetlyak.40wt@gmail.com>
- anonfunc@gmail.com
