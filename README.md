# Drupal Shade

Shade is built using Acquia Lightning distibution.

## Installing
The easiest way to install is using [Composer-based project template][template].

```
$ composer create-project shahinam/shade-project MY_PROJECT
```

Alternatively, you can build using the provided scripts.

```
$ git clone git@github.com:shahinam/shade.git
$ cd shade
$ ./scripts/build.sh ~/Sites/myproject
```

This will build the project in the provided destination i.e `~/Sites/myproject`
in this case.

`NOTE:` This will base your build based on current branch, if you want build
from a different branch or tag. Use `git checkout` command to switch to the
intended branch or tag.

## Developing locally and contributing
If you'd like to contribute, you will need to setup dev build locally. Use the
command below to achive this.

```
$ git clone git@github.com:shahinam/shade.git
$ cd shade
$ ./scripts/build-dev.sh shade-dev
```

This will create the build `shade-dev` in the same parent directory as `shade`.
The new build will have a composer dependency on your local clone of shade via a
../shade symlink. You can therefore make changes to files in `shade` and see
them immediately reflected in your dev build.

## Basic composer usage
### Install a module
```
composer require drupal/<module-name>
```
Examples
```
composer require drupal/devel
composer require drupal/ctools
```

This will install latest available version. If you want to specify a version
```
composer require drupal/<module-name>:<version>
```

### Update a module
```
composer update drupal/<module-name>
```

[template]: https://github.com/shahinam/shade-project "Composer-based project template"
