# Merge and rebase strategies for shared repositories

## Git aliases

**git config --local alias._aliasGoesHere_ 'command goes here'**

### git mt
`git config --local alias.mt mergetool`
* solve merge conflicts using a mergetool during a merge or rebase
* note: you will have to set up a mergetool. For instance, `git config --clobal merge.tool meld` will use the tool Meld, assuming Meld is installed.

### git retcon
`git config --local alias.retcon 'rebase --continue'
* continue with merge or rebase after resolving conflicts

### git commend
`git config --local alias.commend 'commit --amend --no-edit'
* fix a bad rebase or add additional information to the previous commit.
* `--amend` adds the staged changes to the previous commit.
* accidentally typing `git commit -amend` (with a single dash before "amend") will stage all files and commit them with the commit message "end". Aliasing this avoids this danger entirely.
* `--no-edit` keeps the commit message from popping up. Remove this if you will want to edit the commit messages while amending the commit.

### git please
`git config --local alias.please 'push --force-with-lease'
* replace remote with rebased contents
* if your remote repository contains changes which you have not pulled, the force-push will fail. (If you had used regular `push --force` it would just overwrite the remote without alerting you to un-pulled changes.)



##### Credits
Most of these git aliases came from [Hackernoon](https://hackernoon.com/lesser-known-git-commands-151a1918a60)
