# Merge and rebase strategies for working with shared repositories
presentation by Heather Armstrong for GSI meeting on January 30, 2017

ANDRE DEFINITELY DOES WORK. And does it with gifs.

Rebasing lineraizes history. Your changes are lifted off of the common branch, changes since you branched off are applied, and then your changes are applied after these. It's like sequentially cherry-picking all your changes onto the current state of the common branch.

Merging keeps history obvious by keeping track of what was changed and when. This is particularly useful for reasoning about what actually happened in a repository's history.

  The downside is that there are a lot of merge commits all over the repository, and sometimes it's still difficult to reason about what actually happened.

Important takeaways: 
* Rebasing can be a safe strategy (so long as master is never rebased).
* The work referred to by "local" and "remote" will differ based on whether you are using `merge` or `rebase`.
* Aliasing commonly-used commands allows you to efficiently harness the power of git.
