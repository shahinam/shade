# Drupal Shade

Shade is built using Acquia Lightning distibution.

## Installing
The easiest way to install is using [Composer-based project template][template].

```
$ composer create-project shahinam/shade-project MY_PROJECT
```

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
