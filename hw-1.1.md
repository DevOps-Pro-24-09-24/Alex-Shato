### Ensure Commit Message Prefix

To ensure the commit message starts with the prefix DJ-X: ... DJ-XXXX:, place the file `commit-ms`  in `.git/hooks/` and make it executable.

`Commit-ms` file contents:

```sh

!#/bin/bash

commit_message=$(cat "$1")

if [[ ! $commit_message =~ ^DJ-[0-9]{1,4}: ]]; then
    echo "Error: Commit message must start with the prefix DJ-X: ... DJ-XXXX: -"
    exit 1
fi

exit

```