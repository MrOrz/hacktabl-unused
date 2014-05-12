Hacktabl
========

Hacktabl stacks for/against views with multiple perspectives with a sleek and clear table view.

Development
-----------

### Requirements

* `ruby` for development dependency management.
* `bower` for front-end dependenchy management.
* `thin` for localhost server (any rack server will do though).
* Mac OSX `grunt` for guard notifications.


### Setup

After cloning, inside the project directory:

```
$ bundle install
```

The following scripts would be handy during development.

### Operations

#### Listen to file changes

Including `slim`, `sass` and `ls` files.

```
$ bundle exec guard
```

#### Build production site

```
$ make build
```

#### Clean built production site

```
$ make clean
```

#### Run development server

```
$ make dev
```