---
id: development
title: Development
sidebar_label: Development
---

# Developers personal guide

## Configuration for the SFTP module in vscode

Install the [SFTP extension](https://marketplace.visualstudio.com/items?itemName=liximomo.sftp) for VSCode.

`CTRL+Shift+P` will give you access to the commands.
Run SFTP config to create the `sftp.json` configuration file.

```
{
    "name": "<virtual-machine-name>",
    "host": "<virtual-machine-ip-address>",
    "protocol": "sftp",
    "port": 22,
    "username": "root",
    "password": "centreon",
    "context": "./www/",
    "remotePath": "/usr/share/centreon/www/",
    "uploadOnSave": true
}
```

## Install and configure xdebug for vscode

### In the Centreon environment (Virtual Machine)

Installing the xdebug extension for PHP

```
yum install -y sclo-php72-php-pecl-xdebug
```

Once installed then add the following configuration in `/etc/opt/rh/rh-php72/php.d/15-xdebug.ini`

```
cat <<EOF > /etc/opt/rh/rh-php72/php.d/15-xdebug.ini
zend_extension=xdebug.so
xdebug.remote_enable=1
xdebug.remote_connect_back=1
xdebug.idekey=XDEBUG_KEY
xdebug.var_display_max_data=5000
xdebug.var_display_max_depth=6
xdebug.remote_port=9001
EOF
```

Restart the php-fpm and apache processes
```
systemctl restart rh-php72-php-fpm httpd24-httpd
```

Module should be visible.
```
scl enable rh-php72 bash && php -v
```

### Google Chrome web browser

Install the [Xdebug helper](https://chrome.google.com/webstore/detail/xdebug-helper/eadndfjplgieldjbigjakmdgkmoaaaoc) chrome extension.

Go to the extension settings and change in the IDE key section select
`Other`, set the key to `XDEBUG_KEY` and save.

### VScode setup

Install the [VSCode php debug](https://marketplace.visualstudio.com/items?itemName=felixfbecker.php-debug) extension

Generate a new configuration file by clicking on the extension configuration button and add this configuration
```
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "pathMappings": {
                "/usr/share/centreon": "${workspaceRoot}"
            },
            "name": "Listen for XDebug",
            "type": "php",
            "request": "launch",
            "port": 9001
        },
        {
            "name": "Launch currently open script",
            "type": "php",
            "request": "launch",
            "program": "${file}",
            "cwd": "${fileDirname}",
            "port": 9001
        }
    ]
}
```

### Local (maybe useless)
Install the `php-xdebug` package
```
sudo apt install php-xdebug
```

## Execute acceptance tests
From the root directory of the repository (centreon, centreon-bam and so on...)

```
../centreon-build/script/acceptance.php -v 20.04 -c features/InheritKpiDowntime.feature
```

## Start React developments on Centreon

### Configuring the Virtual Machine #2

First some requirements are needed on the target Virtual Machine

#### Installing npm

```
yum install -y gcc-c++ make
curl -sL https://rpm.nodesource.com/setup_12.x | sudo -E bash -
```

Check the installation

```
# npm -v
6.14.4
# node -v
v12.16.2
```

#### Preparing the files

From your local machine it will be necessary to sync the following directories and files in `/usr/share/centreon`

```
➜  centreon git:(master) ✗ ls -lah | grep -E "(webpack|babel|tsconfig|package|front_src)"
-rw-r--r--    1 adrienm adrienm   77 14 avril 12:31 babel.config.js
-rw-r--r--    1 adrienm adrienm 4,3K 14 avril 12:31 package.json
-rw-r--r--    1 adrienm adrienm 862K 14 avril 12:31 package-lock.json
-rw-r--r--    1 adrienm adrienm  241 14 avril 12:31 tsconfig.json
-rw-r--r--    1 adrienm adrienm  610 14 avril 12:31 webpack.config.dev.js
-rw-r--r--    1 adrienm adrienm 1,5K 14 avril 12:31 webpack.config.js
-rw-r--r--    1 adrienm adrienm  241 14 avril 12:31 webpack.config.prod.js
```

### Preparing the Virtual Machine #2

Now run on the Virtual Machine

```
npm ci
```

And

```
npm run watch
```

## Execute unit tests

All the tests
```
./vendor/bin/phpunit --bootstrap ./tests/php/bootstrap.php ./src
```

Only one set of tests
```
./vendor/bin/phpunit --bootstrap ./tests/php/bootstrap.php --filter 'TestClass'
```

Only one test
```
./vendor/bin/phpunit --bootstrap ./tests/php/bootstrap.php --filter 'CheckServiceTest::testMethod'
```

## Coding style check on a file - from root directory

```
vendor/bin/phpcs --report=diff --standard='PSR12' $(git diff --name-only HEAD~n) | colordiff

-- autofix --
vendor/bin/phpcs --standard='PSR12' --report-diff=/path/to/changes.diff $(git diff --name-only HEAD~n)
patching file /path/to/code/file.php
```

```
./vendor/bin/phpstan analyse --level 7 $(git diff --name-only HEAD~n) (file or directory)
```

Everytime we change something at those following levels
```
[root@centreon-master ~]# sudo -u apache /opt/rh/rh-php72/root/bin/php /usr/share/centreon/bin/console cache:pool:list
 ------------------------------------
  Pool name
 ------------------------------------
  cache.app
  cache.system
  cache.validator
  cache.serializer
  cache.annotations
  cache.property_info
  cache.property_access
  cache.security_expression_language
```

We need to regenerate the symfony cache

```
sudo -u apache /opt/rh/rh-php72/root/bin/php /usr/share/centreon/bin/console cache:clear
```

## Linking everything for the debug of a module (Centreon BAM for instance)


Creating the symlinks on Centreon BAM in Centreon project for the `src/` and `www/modules` folders.
From the centreon folder.

```
> ln -s ../centreon-bam/src/CentreonBam src/CentreonBam
> ln -s ../centreon-bam/www/modules/centreon-bam-server www/modules/centreon-bam-server
```

