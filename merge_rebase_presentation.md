# Merge and rebase strategies for shared repositories

## Git aliases

**git config --local alias._aliasGoesHere_ 'command goes here'**

### git mt
* `git config --local alias.mt mergetool`
* solve merge conflicts during a merge or rebase

### git retcon
* `git config --local alias.retcon 'rebase --continue'
* continue with merge or rebase after resolving conflicts

### git commend
* `git config --local alias.commend 'commit --amend --no-edit'
* fix a bad rebase

### git please
* `git config --local alias.please 'push --force-with-lease'
* replace remote with rebased contents
