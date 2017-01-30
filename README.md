This repository shows a brief demonstration of how to use a rebase workflow on the command line. 

### Getting started
1. Copy this repository and `cd` into it.
2. Open the **merge_rebase_presentation.md** file (or not; it doesn't contain much information).

### Merge a branch into master
2. Check out the pre-existing *merge* branch: `git checkout merge`
* Open the **merge_rebase_presentation.md** file to read an extraordinarily oversimplified explanation of `git merge`. Open _mergeIndenting.png_ to see how deeply nested branches can be, and _snakeHistory.png_ to see how branch histories intertwine with each other. Merging is accurate but can be confusing.
5. Interleave the changes from *master* with those from your *merge* branch: `git merge master`
* Use `git mergetool` or other merge conflict resolution strategy to resolve conflicts. Note how *merge* is considered `local` and *master* is considered `remote`.
* Use `git commit` to conclude the merge.
6. Push *merge* to GitHub: `git push origin merge`

### Create a pull request to move the changes from merge into master
7. Go to GitHub and create a pull request to merge *merge* into *master*. Merge the pull request.

### Rebase a branch onto master
7. Check out the pre-existing *rebase* branch: `git checkout rebase`
* Open the *merge_rebase_presentation.md* file to read a very brief explanation of `git rebase`. Open _linearHistoryIllusion.png_ to see how a rebase workflow groups units of work together. Note that the commit which ends in `(#639)` represents a squash and merge of commits from pull request #639, whereas the merge commits which remain are there because there were multiple commits which needed to be kept separate (as opposed to squashed) when merging into the master branch.
9. Get the current state of *master* from GitHub, and add your changes in *rebase* onto the changes in *master*: `git fetch origin; git rebase origin/master`
* Use `git mergetool` or other merge conflict resolution strategy to resolve conflicts. Note how *master* is considered `local` and *rebase* is considered `remote`, even though you are working on the *rebase* branch.
* Use `git rebase --continue` and `git mergetool` until the rebase is complete.
10. Push *rebase* to GitHub: `git push origin rebase`

### Create a pull request to move the changes from rebase into master
11. Go to GitHub and create a pull request for merging *rebase* into *master*.

### Create changes on a new branch to be merged into master
12. Create a new branch named *GIFS* from the current state of *master* on GitHub: `git checkout -b GIFS master`
13. Open the *merge_rebase_presentation.md* file and add “A GIF FOR EVERY OCCASION” somewhere in the middle of the file. Save the file.
13. Commit your changes and push them to GitHub: `git add . ; git commit; git push origin GIFS`

### Create a pull request to mvoe the changes from GIFS into master
14. Go to GitHub and create a pull request for merging *GIFS* into *master*. 
14. Gifs are obviously correct. Merge the pull request.
15. View the *rebase* pull request and note that it has conflicts. We will solve them by rebasing.

### Solve the merge conflicts in rebase branch
16. Switch to *rebase*: `git checkout rebase`
9. Get the current state of *master* from GitHub, and add your changes in *rebase* onto the changes in *master*: `git fetch origin; git rebase origin/master`
* Use `git mergetool` or other merge conflict resolution strategy to resolve conflicts.
11. Push the commits to GitHub: `git push origin rebase`
* Note that this will fail, since your local version of *rebase* has a different history than the remote version of *rebase*. 
* Use `git push –-force-with-lease` to overwrite the remote version of *rebase* with your local version. `--force-with-lease` will warn you if you attempt to overwrite changes that you do not have locally.
17. Go to the *rebase* pull request on GitHub. It no longer has conflicts preventing you from merging. Select "Squash and merge" if you want to apply the changes without an extra merge commit.

### Use Git aliases to make many of these steps easier
18. Check out the pre-existing *aliases_1* branch: `git checkout aliases_1`
8. Open the *merge_rebase_presentation.md* file to read about two useful git aliases.
9. Get the current state of *master* from GitHub, and apply the information from *aliases_1* onto the changes in *master*: `git fetch origin; git rebase origin/master`
* Use `git mergetool` or other merge conflict resolution strategy to resolve conflicts.
* Use `git rebase --continue` and `git mergetool` until the rebase is complete.
10. Push *aliases_1* to GitHub: `git push origin aliases_1`

### Create a pull request to move the changes from aliases_1 into master
11. Go to GitHub and create a pull request for merging *aliases_1* into *master*. Merge the pull request.

### More git aliases
18. Check out the pre-existing *aliases_2* branch: `git checkout aliases_2`
8. Open the *merge_rebase_presentation.md* file to read about two more useful git aliases.
9. Get the current state of *master* from GitHub, and apply the information from *aliases_2* onto the changes in *master*: `git fetch origin; git rebase origin/master`
* Use `git mergetool` or other merge conflict resolution strategy to resolve conflicts.
* Use `git rebase --continue` and `git mergetool` until the rebase is complete.
10. Push *aliases_2* to GitHub: `git push origin aliases_2`

### Create a pull request to move the changes from aliases_2 into master
11. Go to GitHub and create a pull request for merging *aliases_2* into *master*. Merge the pull request.

### Add the git aliases to your .gitconfig
20. You can apply the aliases by entering them manually on the command line, or you can use the script I wrote: `git checkout apply_aliases; ./apply_git_aliases.sh`

### Use the aliases for more rebasing
21. Checkout the pre-existing *fun_with_aliases* branch: `git checkout fun_with_aliases`
22. Read the takeaways in the *merge_rebase_presentation.md* file.
23. Get the current state of *master* from GitHub, and apply the information from *fun_with_aliases* onto the changes in *master*: `git fetch origin; git rebase origin/master`
* Use **git _mt_** to resolve conflicts.
* Use **git _retcon_** and **git_mt_** until the rebase is complete.
24. Push *fun_with_aliases* to GitHub: `git push origin fun_with_aliases`
25. Force-push *fun_with_aliases* to GitHub: `git please origin fun_with_aliases`

##### Notes: 
* All screencaps are taken from commit history in the open-source [MISO LIMS](https://github.com/TGAC/miso-lims/tree/develop) developed by the Earlham Institute and the Ontario Institute for Cancer Research.
* The aliases I've shown use `--local` to scope them to the local repository. If you find them useful and want to use them everywhere, change the aliasing commands to use `--global`.
* By default, `git mergetool` keeps copies of edited files as `$ORIGINAL_NAME.orig`. If you want Git to stop creating these files entirely, run `git config --local mergetool.keepBackups false`. If you want to manually remove these copies, `git clean -f` will remove these files (and all other untracked files; a conservative strategy is to use `git clean -fn` to see what files will be deleted before running `git clean -f`)
