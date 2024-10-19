
## Set up python to check code formatting python.

### Install:
1. `pip install pre-commit`
2. Add a pre-commit configuration:
    - create a file named .pre-commit-config.yaml in your git working directory;
    - you can generate a very basic configuration using pre-commit sample-config;
    - this example uses a formatter for python, puppet code, however pre-commit works for any programming language.
3. Run `pre-commit install` to set up the git hook scripts
4. (optional) Run against all the files `pre-commit run --all-files` 
    - "it's usually a good idea to run the hooks against all of the files when adding new hooks (usually pre-commit will only run on the changed files during git hooks)"
