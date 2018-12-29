# Git Cheat Sheet

## config
The Git command "config" allows the user to set user information and other preferred preferences. This command will likely only be used once to set initial preferences such as a username, email, and preferred editor.

## clone
The Git "clone" command is used to make a copy of something, in the case of lab0 we copied a repository, and places it on the current account the user is using (it makes a file on the current computer). Regarding the repository, this command will be used only once per computer. If the user has multiple repo-'s, the "clone" command may be used multiple times.

## remote
The Git "remote: command allows the user to manage repositories that they track. For example, we can use the "% git remove --verbose" command to see if the user has made any changes to a project since it was last updated from the repository. The "status" command will likely be used more often than "remote", but "remote" may be used multiple times when working on a project.

## status
The Git "status" command allows the user to check if there are any untracked files or if everything is up to date in the repository and the user's account. The "status" command will likely be used multiple times when working on a project to see if everything has been updated properly.

## commit
The Git "commit" command adds changes to the user's local repository, but not the ones stored on Github. This command will be used periodically throughout a project to update the changes to the Github repository.

## push
The Git "push" command adds the changes that the user committed from their local repository to the ones stored on Github. This command will be used after every time the "commit" command is used.

## pull
The Git "pull" command brings changes from the repository on Github to the user's local repository, any copies will be updated. The user will likely use the "pull" command before every project and after every project.

## add
The Git "add" command adds an untracked file to the Github repository. The Github repository does not track it until the "commit" and "push" commands are used. Therefore, it will be used every time that the user wants to update the Github repository.
