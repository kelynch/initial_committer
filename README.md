## README for `initial_committer`

This is a script for generating boilerplate components to a project in a git repo.  It currently supports Ruby applications, but could be extended to support other languages if desired pretty easily. 

## Requirements

* Ruby 2.3.1 or higher
* Git

## Usage

```bash
ruby initial_committer.rb $PROJECT_NAME $PARENT_PATH $GITHUB_NAMESPACE

```

Where `$PROJECT_NAME` is the desired name of the git repository directory, which also appears in the README, `$PARENT_PATH` is the absolute path to the parent directory of the created repo, and `$GITHUB_NAMESPACE` is the GitHub account under which the repository will be hosted.

NOTE: This script does not create the GitHub remote.  The account specification functions solely to update the README for the created project.

### Example

Executing the command like so:

```bash
ruby initial_commiter.rb sample_project ~/Documents/Projects kelynch
```

The resulting output on the filesystem:

```bash
$ cd ~/Documents/Projects/sample_project/
$ ls -la
total 32
drwxr-xr-x   7 kate  staff    238 Sep 24 16:35 .
drwxr-xr-x  52 kate  staff   1768 Sep 24 16:35 ..
drwxr-xr-x  13 kate  staff    442 Sep 24 16:35 .git
-rw-r--r--   1 kate  staff      5 Sep 24 16:35 .gitignore
-rw-r--r--   1 kate  staff  11372 Sep 24 16:35 LICENSE
-rw-r--r--   1 kate  staff      0 Sep 24 16:35 README.md
-rw-r--r--   1 kate  staff      0 Sep 24 16:35 sample_project.rb
 
$ git log

commit c94e276e30b508b136c1234521ee516a9ba0be6f (HEAD -> master, features/SAMPLE_PROJECT-0-Initial_commit)
Author: Katherine Lynch <katherly@upenn.edu>
Date:   Mon Sep 24 16:35:02 2018 -0400

    Initial commit

commit e46a932d8b924035e481a9fffe8fca72d37e15c7
Author: Katherine Lynch <katherly@upenn.edu>
Date:   Mon Sep 24 16:35:02 2018 -0400

    Modified gitignore
     
$ git branch 
features/SAMPLE_PROJECT-0-Initial_commit
* master
 
$ git status
On branch master
nothing to commit, working tree clean

vagelos-ve509-
```

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/kelynch/initial_committer](https://github.com/kelynch/initial_committer).

## License

This code is available as open source under the terms of the [Apache 2.0 License](https://opensource.org/licenses/Apache-2.0).