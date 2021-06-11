# Git-Helper

## What?
Git-Helper helps you make commits within your project. It ensures that all commits are prefixed with "Feature, Bug, Documentation etc."
There is also the option to add the JIRA ticket number to the commit description.

## How?
### Add the script from github to your bash aliases

#### By bash
```bash
LINE="alias commit='bash < (curl -s -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/boydzweers/git-helper/main/helper.sh)'"
FILE="path/to/.bashrc"
grep -q "$LINE" "$FILE" || echo "$LINE" >> "$FILE"
. ~/.bashrc
```

#### By hand
```
alias commit='bash < (curl -s -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/boydzweers/git-helper/main/helper.sh)'
```

#### By file
Just copy the file inside your project and execute.
