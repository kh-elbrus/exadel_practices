# exadel_practices
Internship labs

### Task 1. Git/Github
Author: Elbrus 

#### Mandatory tasks 

|  № |                                                                                                                        Task                                                                                                                       |                                          Answer                                         |
|:--:|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|:---------------------------------------------------------------------------------------:|
|  1 | Create a Github account                                                                                                                                                                                                                           | Already exist: https://github.com/kh-elbrus                                             |
|  2 | Create new Github repository                                                                                                                                                                                                                      | https://github.com/kh-elbrus/exadel_practices                                           |
|  3 | Create “Task1” folder in the master branch. Create and push ./Task1/README.md file                                                                                                                                                                | https://github.com/kh-elbrus/exadel_practices/tree/master/Task1                         |
|  4 | Create new branch dev. Create and push any test file                                                                                                                                                                                              | https://github.com/kh-elbrus/exadel_practices/blob/dev/dev_test_file.md                 |
|  5 | Create new branch %USERNAME-new_feature. Add README.md file to your %USERNAME-new_feature branch  Check your repo with git status command  Add .gitignore file to ignore all files whose name begins “.”  Commit and push changes to github repo. | https://github.com/kh-elbrus/exadel_practices/blob/ELBRUS-new_feature/FEATURE-README.md |
|  6 | Create Pull Request to the dev branch                                                                                                                                                                                                             | https://github.com/kh-elbrus/exadel_practices/pull/1                                    |
|  7 | Merge your branch with the dev branch and create Pull Request to the master(main) branch. Merge dev with master(main).                                                                                                                            | https://github.com/kh-elbrus/exadel_practices/pull/2                                    |
|  8 | Checkout to %USERNAME-new_feature, make changes in README.md and commit them. Revert last commit in %USERNAME-new_feature branch.                                                                                                                 | Done                                                                                    |
|  9 | Check your repo with git log command, create log.txt file in master(main) branch and save “git log” output in it.                                                                                                                                 | https://github.com/kh-elbrus/exadel_practices/blob/master/log.txt                       |
| 10 | Delete local and remote branch %USERNAME-new_feature.                                                                                                                                                                                             | git branch -D ELBRUS-new_feature git push origin --delete ELBRUS-new_feature            |
| 11 | Add all used command to the git_commands.md file in the dev branch.                                                                                                                                                                               | https://github.com/kh-elbrus/exadel_practices/blob/master/git_commands.md               |

#### Extra 

1. Read about GitHub Actions. What environment variables can be created?

2. Create your workflow, what consists of two jobs and contain requirements according the scheme below:

*Practice result:* https://github.com/kh-elbrus/exadel_practices/actions 

*Theory:*

1. What environment variables can be created? - [Docs](https://docs.github.com/en/actions/learn-github-actions/environment-variables)

- Context environment variables. Ex: First_Name: Mona
- List of Default environment variables. [Docs](https://docs.github.com/en/actions/learn-github-actions/environment-variables#default-environment-variables)
- OS env
- Env with secret specific ([repo secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets))

2. What result did you get and why?
My response was *** , because this variable was taken from a secret repository which in turn is kept secret