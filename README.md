# eslint-config-earnest-es7
Earnest's ESLint config for ES7, following StandardJS with added checks

## Usage

1. Add all of the `"devDependencies"` listed in [package.json](https://github.com/meetearnest/eslint-config-earnest-es7/blob/master/package.json) to your project's `"devDependencies"` section.

2. Add an additional entry to `"devDependencies"`:

    `"eslint-config-earnest-es7": "latest"`

3. Add a root level `.eslintrc` that references this package

```
{ "extends": "earnest" }
```

4. Add another `.eslintrc` to your `test` folder that supports mocha

```
{
  "extends": "earnest",
  "env": { "mocha": true }
}
```

5. (Recommended) Add the following entries to your `package.json` for simplified CLI access to linting:

```
"scripts": {
  "lint": "./node_modules/.bin/eslint .",
  "lint-changed": "git diff --name-only --cached --relative | grep '\\.js$' | xargs ./node_modules/.bin/eslint"
}
```

6. (Recommended) Setup your editor to support inline ESLint support. For Sublime Text, that means `npm install -g eslint` then installing `SublimeLinter` and `SublimeLinter-contrib-eslint` packages.
