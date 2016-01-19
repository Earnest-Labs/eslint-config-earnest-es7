# eslint-config-earnest-es7
Earnest's ESLint config for ES7

## Usage

1. Install the following `"devDependencies"` in your repo:

    ```
    npm install eslint-config-earnest-es7@latest babel-core babel-cli babel-eslint babel-preset-es2015 babel-preset-stage-3 eslint eslint-plugin-babel --save-dev
    ```

2. Add a root level `.eslintrc` that references this package

    ```
    echo '{ "extends": "earnest-es7" }' > .eslintrc
    ```

3. Add another `.eslintrc` to your `test` folder that supports mocha

    ```
    echo '{\n\s\s"extends": "earnest-es7"\n}' > test/.eslintrc
    ```

4. (Recommended) Add the following entries to your `package.json` for simplified CLI access to linting:

    ```json
    "scripts": {
      "lint": "./node_modules/.bin/eslint .",
      "lint-changed": "git diff --name-only --cached --relative | grep '\\.js$' | xargs ./node_modules/.bin/eslint"
    }
    ```

5. (Recommended) Setup your editor to support inline ESLint support. For Sublime Text, that means `npm install -g eslint` then installing `SublimeLinter` and `SublimeLinter-contrib-eslint` packages. For Vim, use [Syntastic](https://github.com/scrooloose/syntastic).

## Linting this Repository

In order to run linting against this repository, you must create a self-referential link to this module:
 
 ```
 npm install
 npm link
 npm link eslint-config-earnest-es7
 npm run lint
 ```
