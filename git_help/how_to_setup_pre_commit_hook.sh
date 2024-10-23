How to Set Up a Pre-Commit Hook

npm init --yes
npm install --save-dev @commitlint/{config-conventional,cli}
npm install husky --save-dev
npx husky install 
echo "module.exports = {extends: ['@commitlint/config-conventional']};" > commitlint.config.js
npx husky add .husky/commit-msg 'npx --no -- commitlint --edit ${1}'

This script will initialize a new npm project with default settings using npm init --yes. Then it will install the @commitlint/config-conventional and @commitlint/cli packages as dev dependencies using npm install --save-dev @commitlint/{config-conventional,cli}. Next, it installs the husky package as a dev dependency using npm install husky --save-dev and runs npx husky install to initialize husky.

After that, it creates a commitlint.config.js file in the root directory and sets its content to module.exports = {extends: ['@commitlint/config-conventional']}; using echo "module.exports = {extends: ['@commitlint/config-conventional']};" > commitlint.config.js.

Finally, it adds a git hook that will run commitlint before each commit message using npx husky add .husky/commit-msg 'npx --no -- commitlint --edit ${1}'.

You can save this script in a file with a .sh extension and run it using sh script.sh or ./script.sh if you make the file executable.

Reference Link : 
- https://github.com/conventional-changelog/commitlint/#what-is-commitlint
- https://www.conventionalcommits.org/en/v1.0.0/
- https://youtu.be/eENq8FT0_D8

How I can validate file Name Before commit ?
How I can validate File format In before Commit or How We can format file after save or after before commit ?
