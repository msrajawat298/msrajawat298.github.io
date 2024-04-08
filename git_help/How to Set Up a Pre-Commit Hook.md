##

## Table of Contents

- [How to Set Up a Pre-Commit Hook](#how-to-set-up-a-pre-commit-hook)
  - [Prerequisites](#prerequisites)
  - [Steps](#steps)
  - [Additional Tips](#additional-tips)
    - [How to Validate File Names Before Commit](#how-to-validate-file-names-before-commit)
    - [How to Validate File Format Before Commit or Format Files After Save](#how-to-validate-file-format-before-commit-or-format-files-after-save)
- [Reference Link](#reference-link)
- [Contributing](#contributing)
- [Contributing](#contributing)

## How to Set Up a Pre-Commit Hook

This is a guide on how to set up a pre-commit hook using `husky` and `commitlint` to validate commit messages against the conventional commit format.

### Prerequisites

- Node.js and npm installed on your system.

### Steps

1. Initialize a new npm project with default settings:

   ```npm init --yes```

2. Install the required dependencies:

   ```npm install --save-dev @commitlint/{config-conventional,cli} npm install husky --save-dev```

3. Set up `husky`:

   ```npx husky install```

4. Create a `commitlint.config.js` file in the root directory and set its content to the following:

   ```module.exports = {extends: ['@commitlint/config-conventional']};```

You can do this using the following command:

    ```echo "module.exports = {extends: ['@commitlint/config-conventional']};" > commitlint.config.js```

5. Add a git hook that will run `commitlint` before each commit message:

   ```npx husky add .husky/commit-msg 'npx --no -- commitlint --edit ${1}'```

This will create a `.husky/commit-msg` file and add the command to run `commitlint` to it. 

6. Now, whenever you make a commit, `commitlint` will validate your commit message against the conventional commit format.

### Additional Tips

#### How to Validate File Name Before Commit

To validate file names before committing, you can use a pre-commit hook that runs a script to check the names of the files being committed. Here's an example script that checks for files with `.txt` extension:
```
    #!/bin/sh

    files=$(git diff --cached --name-only --diff-filter=ACM | grep '\.txt$')
    if [ -z "$files" ]
    then
        echo "No text files found. Aborting commit."
        exit 1
    fi
```
Save this script in a file with a `.sh` extension and make it executable:

    ```chmod +x script.sh```

Then, add a git hook that runs this script before each commit:

    ```npx husky add .husky/pre-commit './script.sh'```

## Note: To validate multiple file types in the pre-commit hook script, you can modify the grep command to include all the file extensions you want to check. For example, to check for .txt, .html, .css, and .js files, you can modify the script as follows

        ```files=$(git diff --cached --name-only --diff-filter=ACM | grep -E '\.(txt|html|css|js)$')```

**The -E option enables extended regular expressions, and the | character separates the different file extensions. Save this modified script in a file with a .sh extension and make it executable as shown in the previous answer.**

#### How to Validate File Format Before Commit or Format Files After Save

To validate file format before committing or format files after saving, you can use a tool like `prettier` or `eslint`. These tools can be configured to run as pre-commit hooks or as editors' plugins to format files before committing or after saving.

For example, to use `prettier` as a pre-commit hook, you can install it as a dev dependency:

    ```npm install prettier --save-dev````

Then, create a `.prettierrc` file in the root directory and set its content to your preferred formatting options. For example:

    ```{ "singleQuote": true, "trailingComma": "es5" }```

Add a git hook that runs `prettier` before each commit:

    ```npx husky add .husky/pre-commit 'npx --no -- prettier --write "**/*.{js,jsx,ts,tsx,,md,html,,s,yml,yaml,graphql}"'```

This will run `prettier` on all the supported files in your repository.

Alternatively, you can use an editor plugin that integrates with `prettier` to format files after saving. For example, the \`prettier-vscode

### Reference Link

- [Youtube Video Link](https://www.youtube.com/watch?v=ny0xLzhvADk&list=PLitlfQssIkZcS438Or_bwAITthNdB_Fj7)
- [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)
- [Customizing-Git-Git-Hooks](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks)
- [Git-Hooks](https://www.git-scm.com/docs/githooks)
- [Git-Hooks by atlassian](https://www.atlassian.com/git/tutorials/git-hooks)
- [Git-Hooks Example](https://github.com/mohokh67/git-hooks-example)
- [Husky setup Example](https://www.freecodecamp.org/news/how-to-add-commit-hooks-to-git-with-husky-to-automate-code-tasks/)
- [ESlint](https://www.youtube.com/playlist?list=PL_euSNU_eLbeVd_eDmWzUpEmXizWQRmEm)
- #Commit like a PRO with conventional commit
- #Git hooks docs:
- #How to Validate File Name Before Commit like file name does not contained any space , use Capitalization
