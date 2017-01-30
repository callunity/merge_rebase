# Merge and rebase strategies for shared repositories

## Git aliases

**git config --local alias._aliasGoesHere_ 'command goes here'**

### git mergetool -> git mt
* `git config --local alias.mt mergetool`

### git rebase --continue -> git retcon
* `git config --local alias.retcon 'rebase --continue'

  Note that single quotes around the full name of the command are only required if the command contains spaces.
