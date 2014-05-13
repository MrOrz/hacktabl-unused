Hacktabl
========

Hacktabl stacks for/against views with multiple perspectives with a sleek and clear table view.

Behind the hood, the site will be purely static, using [ethercalc](ethercalc.org) to maintain tabular information and [Hackpads](http://hackpad.com) to store individual cell data.

Development
-----------

### Requirements

* `bundler` for development dependency management.
* `bower` for front-end dependency management.


### Setup

After cloning, inside the project directory:

```
$ bundle install
$ npm install
$ npm install gulp --global
```

The following scripts would be handy during development.

### Operations

#### Start development environment

file watching tasks & development server

Opens up a connect server, watches `slim`, `sass` and `ls` files, and rebuilds them on the fly, reload the browser.

```
$ npm start
```

#### Deploy to github

Use r.js to build the site in `build/`, and pushes to the branch `gh-pages`.

```
$ npm run deploy
```

#### Execute unit tests

```
$ npm test
```

#### Run development server

```
$ make dev
```