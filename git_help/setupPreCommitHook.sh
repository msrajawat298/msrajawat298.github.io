#!/bin/sh

npm init --yes
npm install --save-dev @commitlint/{config-conventional,cli}
npm install husky --save-dev
npx husky install 
echo "module.exports = {extends: ['@commitlint/config-conventional']};" > commitlint.config.js
npx husky add .husky/commit-msg 'npx --no -- commitlint --edit ${1}'