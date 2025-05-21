# Handling ID-requests

```{note} This guide is only relevant for maintainers with commit rights.
```

To update or create ID-ranges for people use the following workflow.
It is written for using git from the command line.

**Step 1**: Navigate to the folder on your computer with a local clone of the voc4cat-repo:

```bat
C:\Users\dlinke\MyProg_local
λ cd gh-nfdi4cat\voc4cat
```

Make sure you are on the main branch. If not switch to the main branch with `git switch main`.

**Step 2**: Pull the latest changes into the local repo.

```bat
C:\Users\dlinke\MyProg_local\gh-nfdi4cat\voc4cat(main -> origin)
λ git pull
remote: Enumerating objects: 33, done.
remote: Counting objects: 100% (33/33), done.
remote: Compressing objects: 100% (23/23), done.
remote: Total 33 (delta 10), reused 30 (delta 10), pack-reused 0
Unpacking objects: 100% (33/33), 100.81 KiB | 291.00 KiB/s, done.
From https://github.com/nfdi4cat/voc4cat
   9d78e5a..d0f2cd7  main       -> origin/main
 + f9c7ee0...01421a8 gh-pages   -> origin/gh-pages  (forced update)
Updating 9d78e5a..d0f2cd7
Fast-forward
 vocabularies/voc4cat/0007018.ttl        |  2 +-
 vocabularies/voc4cat/0007101.ttl        | 18 ++++++++++++++++++
(...)
```

**Step 3**: Create a feature branch with a reasonable name (here the IDs were requested in issue #79).

```bat
C:\Users\dlinke\MyProg_local\gh-nfdi4cat\voc4cat(main -> origin)
λ git switch -c issue79-id-request
Switched to a new branch 'issue79-id-request'
```

**Step 4**: Open an editor and update the `idranges.toml` file based on the request.

```bat
C:\Users\dlinke\MyProg_local\gh-nfdi4cat\voc4cat(issue79-id-request)
λ code .
```

**Step 5**: Push the changes to GitHub. This involves, adding the changed file, setting the remote branch and pushing the changes.

First it is a good idea to check the status of the git repository.

```bat
C:\Users\dlinke\MyProg_local\gh-nfdi4cat\voc4cat(issue79-id-request)
λ git status
On branch issue79-id-request
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   idranges.toml

no changes added to commit (use "git add" and/or "git commit -a")
```

If there is just `idrange.toml` changed (as expected) we proceed with

- adding the file to the staging area,
- committing the changes with an informative message and
- pushing the changes to GitHub.

```bat
C:\Users\dlinke\MyProg_local\gh-nfdi4cat\voc4cat(issue79-id-request)
λ git add idranges.toml

C:\Users\dlinke\MyProg_local\gh-nfdi4cat\voc4cat(issue79-id-request)
λ git commit -m "Add idrange for philippstangl"
[issue79-id-request c9f6770] Add idrange for philippstangl
 1 file changed, 7 insertions(+)

C:\Users\dlinke\MyProg_local\gh-nfdi4cat\voc4cat(issue79-id-request)
λ git push --set-upstream origin issue79-id-request
Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Delta compression using up to 4 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 395 bytes | 79.00 KiB/s, done.
Total 3 (delta 2), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
remote:
remote: Create a pull request for 'issue79-id-request' on GitHub by visiting:
remote:      https://github.com/nfdi4cat/voc4cat/pull/new/issue79-id-request
remote:
To https://github.com/nfdi4cat/voc4cat.git
 * [new branch]      issue79-id-request -> issue79-id-request
branch 'issue79-id-request' set up to track 'origin/issue79-id-request'.

C:\Users\dlinke\MyProg_local\gh-nfdi4cat\voc4cat(issue79-id-request -> origin)
```

**Step 6**: Create a pull request on GitHub.

To do this open the [voc4cat-repo](https://github.com/nfdi4cat/voc4cat). GitHub will automatically offer you to create a PR from the branch just pushed.

You can also use the link provided in the command line output.

**Step 7**: Accept the PR in GitHub GUI (needs approval by another developer/curator).

After the successful merge, delete the feature branch in the PR-page on GitHub (there is a button for it).

**Step 8**: Clean up your local repo.

Switch back to main in the local repo and pull the latest changes:

```bat
C:\Users\dlinke\MyProg_local\gh-nfdi4cat\voc4cat(issue79-id-request)
λ git switch main
Switched to branch 'main'
Your branch is up to date with 'origin/main'.

C:\Users\dlinke\MyProg_local\gh-nfdi4cat\voc4cat(main -> origin)
λ git pull
remote: Enumerating objects: 5, done.
remote: Counting objects: 100% (5/5), done.
remote: Compressing objects: 100% (1/1), done.
remote: Total 3 (delta 2), reused 2 (delta 2), pack-reused 0
Unpacking objects: 100% (3/3), 409 bytes | 20.00 KiB/s, done.
From https://github.com/nfdi4cat/voc4cat
   d0f2cd7..d634f60  main       -> origin/main
Updating d0f2cd7..d634f60
Fast-forward
 idranges.toml | 7 +++++++
 1 file changed, 7 insertions(+)
```

Finally, you may want to delete the feature branch to keep your local repo clean.

```bat
C:\Users\dlinke\MyProg_local\gh-nfdi4cat\voc4cat(main -> origin)
λ git branch -d issue79-id-request
warning: deleting branch 'issue79-id-request' that has been merged to
         'refs/remotes/origin/issue79-id-request', but not yet merged to HEAD
Deleted branch issue79-id-request (was 7a74c4d).
```
