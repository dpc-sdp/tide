# Tide
Tide is a Drupal 8 distribution focused on delivering an API first, headless Drupal content administration site.

[![CircleCI](https://circleci.com/gh/dpc-sdp/tide.svg?style=svg&circle-token=2725c08f9f9c81b430b5c302d4843b20b8deec86)](https://circleci.com/gh/dpc-sdp/tide)

# Caveats

Tide is on the alpha release, use with caution. APIs are likely to change before the stable version, that there will be breaking changes and that we're not supporting it for external production sites at the moment.

## Tide modules
- [tide_api](https://github.com/dpc-sdp/tide_api)         
- [tide_core](https://github.com/dpc-sdp/tide_core)       
- [tide_landing_page](https://github.com/dpc-sdp/tide_landing_page)
- [tide_media](https://github.com/dpc-sdp/tide_media)     
- [tide_monsido](https://github.com/dpc-sdp/tide_monsido) 
- [tide_news](https://github.com/dpc-sdp/tide_news)       
- [tide_page](https://github.com/dpc-sdp/tide_page)       
- [tide_search](https://github.com/dpc-sdp/tide_search)   
- [tide_site](https://github.com/dpc-sdp/tide_site)       
- [tide_test](https://github.com/dpc-sdp/tide_test)       
- [tide_webform](https://github.com/dpc-sdp/tide_webform) 

# CONTENTS OF THIS FILE

* Introduction
* Requirements
* Recommended Modules
* Installation
* Configuration
* Troubleshooting
* FAQ
* Maintainers

# INTRODUCTION
The Tide distribution has been developed as a part of the Single Digital Presence project from the Department of Premier and Cabinet in Victoria. For further information visit the Single Digital Presence website, https://sdp.vic.gov.au, The github project page, https://github.com/dpc-sdp/tide or the Drupal project page, https://drupal.org/project/tide. Tide utilises a number of SDP specific modules with the `tide_` prefix, providing a range of functionality designed speficically for the State Government of Victoria Australia.

The Tide profile is built as a backend Drupal distribution for 1 or more headless websites and is specifically built for the Ripple frontend framework, written in Vue.JS, https://github.com/dpc-sdp/ripple. The majority of the functionality for this purpose is within the tide_api, https://github.com/dpc-sdp/tide_api, module.

A main feature of the SDP project is central content management of numerous alternate websites, providing the ability to build complex user journeys across multiple websites within a single CMS; this is provided mainly by the tide_site, https://github.com/dpc-sdp/tide_site, module. 

# DOCUMENTATION
For further information visit the Single Digital Presence website, https://sdp.vic.gov.au, The github project page, https://github.com/dpc-sdp/tide or the Drupal project page, https://drupal.org/project/tide.

# REQUIREMENTS
* composer/installers
* cweagans/composer-patches
* drupal-composer/drupal-scaffold

# DEVELOPMENT SETUP
The SDP project also provides the Bay hosting platform, https://github.com/dpc-sdp/bay, which all SDP projects are designed to be hosted on, however, this is not a restriction and all SDP projects can be run in any similar hosting environment.

Take a look at the CONFIGURATION section below for some useful tools.

The Bay configuration files are provided as the default for local development. At a minimum, the following tools are required to use this configuration:
1. Docker for Mac - https://www.docker.com/docker-mac
1. Composer
1. Pygmy

You can install these tools manually, or using Homebrew with these instructions:

## LOCAL TOOLS SETUP
1. Install [Homebrew](https://brew.sh/)
   ```bash
   /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
   ```
1. Install Docker
   ```bash
   brew cask install docker
   ```
1. Start docker and you should be able to run:
    ```bash
    docker ps
    ```
1. Install pygmy
    ```bash
    gem install pygmy
    ```
1. Install Composer
    ```bash
    brew bundle
    brew install composer
    ```

## SETUP YOUR LOCAL PROJECT
3. Checkout project repo and confirm the path is in docker's file sharing config - https://docs.docker.com/docker-for-mac/#file-sharing
5. Make sure you don't have anything running on port 80 on the host machine (like a web server) then run 
    ```bash
    pygmy up
    ``` 
6. Run 
    ```bash
    composer app:build
    ```
7. Once build has completed, you can run 
    ```bash
    composer app:login
    ``` 
    to 
    ```bash
    drush uli
    ```
    into the local site.

* _*NOTE:*_ If any steps fail, you're safe to rerun from any point, 
starting again from the beginning will just reconfirm the changes.

# RECOMMENDED MODULES
THe Tide distribution will automatically install all of the tide_* modules.

* tide_api - https://github.com/dpc-sdp/tide_api
* tide_core - https://github.com/dpc-sdp/tide_core
* tide_landing_page - https://github.com/dpc-sdp/tide_landing_page
* tide_media - https://github.com/dpc-sdp/tide_media
* tide_monsido - https://github.com/dpc-sdp/tide_monsido
* tide_news - https://github.com/dpc-sdp/tide_news
* tide_page - https://github.com/dpc-sdp/tide_page
* tide_search - https://github.com/dpc-sdp/tide_search
* tide_search_core - https://github.com/dpc-sdp/tide_search_core
* tide_site - https://github.com/dpc-sdp/tide_site
* tide_test - https://github.com/dpc-sdp/tide_test
* tide_webform - https://github.com/dpc-sdp/tide_webform


# INSTALLATION
Include the Tide distribution in your composer.json file
```bash
composer require dpc-sdp/tide
```
Install your site using the distribution
```bash
drush si tide
```

# CONFIGURATION
The Tide distribution is very light and offer minimal code. The functionality is provided within the included tide_* modules. The distribution is mainly used to collate the full suite of modules for easy installation of a site, mirroring the full SDP project sites.
## USEFUL COMMANDS
The following composer commands are provided in this distributions composer.json file. To access them in your project you'll need to manually copy them to your root composer.json file for your project.

**Application**
- `composer app:build` - build application and local development environment.
- `composer app:rebuild` - rebuild application and local development environment with removing all dependencies.
- `composer app:cleanup` - remove all dependencies.
- `composer app:login` - login into locally built website (run `drush uli` on the `cli` container).
- `composer app:test` - run tests.
- `composer app:cs` - lint code.
- `composer app:cr` - rebuild application cache.
- `composer app:drush` - run drush commands. Example: `composer app:drush -- status` 
- `composer app:site-install` - run site installation from profile.
- `composer app:db-import` - download and re-import DB.
  
**Bay**
- `composer bay:start` - build and start local development environment.
- `composer bay:restart` - restart local development environment.
- `composer bay:stop` - stop all Bay containers.
- `composer bay:destroy` - stop and remove all Bay containers.
- `composer bay:doctor` - helps to find the cause of any issues with a local setup.
- `composer bay:logs` - get logs from all running Bay containers.
- `composer bay:cli` - run a command in `cli` container. Example: `composer bay:cli -- ls -al`.
- `composer bay:pull` - pull latest Bay containers.

## Logs.

Using the composer helper script you can get logs from any running container.

`composer bay:logs`

You can also filter the output to show only logs from a particular service.
For example `composer bay:logs -- php` will show the log output from the php container.
The full list of services can be found in the `docker-compose.yml`

## SSHing into CLI container 

`docker-compose exec cli bash`


## Mailhog.

Mailhog is included with `pygmy` and is available @ http://mailhog.docker.amazee.io/
Documentation for mailhog is available of the project page -- https://github.com/mailhog/MailHog

## Stage file proxy.

Stage File Proxy is enabled on all non production environments so files are automatically downloaded directly from prod on demand.

## Debugging

### PHP application from browser 
1. Trigger xDebug from web browser (using one of the browser extensions) so that PHPStorm recognises the server `content-vicgovau.docker.amazee.io` and configures the path mapping. Alternatively, you can create the server in PHPStorm Settings.
  * Make sure `serverName` to be `content-vicgovau.docker.amazee.io`
 
  
### PHP scripts
1. Make sure `scripts/xdebug.sh` is executable.
2. SSH into CLI container: `docker-compose exec cli bash`
3. Run your PHP script: `scripts/xdebug.sh path/to/script`.
    * Example running a single Behat test: `scripts/xdebug.sh vendor/bin/behat path/to/test.feature`

### Drush commands
3. To debug `drush` commands:
    * SSH to CLI container: `docker-compose exec cli bash`
        + `cd docroot`
        + `../scripts/xdebug.sh ../vendor/bin/drush <DRUSH_COMMAND>`
            - Example: `../scripts/xdebug.sh ../vendor/bin/drush updb -y`
    * Debug directly from host machine: `composer debug-drush -- <DRUSH_COMMAND>`
        + Example: `composer app:debug-drush -- updb -y`

### DB connection details

```
  Host:     127.0.0.1
  Username: drupal
  Password: drupal
  Database: drupal
  Port:     13306
```  

### Pre deployment database backups

An automatic backup of the production database is taken before any new deployment.
This is currently stored in the private files directory and overridden on each deployment.

#### Restoring a backup

1. Access production `cli` container on Bay.
2. Take a backup of failed deployment db for debugging.
  `drush sql-dump --gzip --result-file=/app/docroot/sites/default/files/private/failed_deployment.sql`
3. Import pre-deployment backup.
  `gzip -cd /app/docroot/sites/default/files/private/pre_deploy_backup.sql.gz | drush sqlc`
4. Clear cache.
  `drush cr`

# TROUBLESHOOTING/FAQ
## Adding Drupal modules
Modules needs to be added in 2 steps:
1. Require module code installation (through composer).
2. Enable module during site installation.

### Step 1. Adding contrib modules
`composer require drupal/module_name`
or for specific versions
`composer require drupal/module_name:1.2`

OR

### Step 1. Adding modules as local packages
1. Add local package information to root `composer.json`:
```
    "repositories": {
        "dpc-sdp/tide_page": {
            "type": "path",
            "url": "dpc-sdp/tide_page"
        },
    }
```
2. Assess if package is required for distribution (Tide) or site (content.vic.gov.au) and add to relevant `composer.json`:
  - for distribution - `dpc-sdp/tide/composer.json`
  - for site - `composer.json`
3. To make sure that composer trigger dependency tree rebuild, run `composer app:cleanup`.
4. Run `composer update --lock`. This will install all dependencies and update root `composer.lock` file with newly added module. 

### Step 2. Enable module
1. Assess if module is a part of distribution or site-specific and add to appropriate `info.yml` file:
  - for distribution - `dpc-sdp/tide/tide.info.yml`
  - for site - `docroot/modules/custom/vicgovau_core/vicgovau_core.info.yml`

If module is a dev-only module (required to be enabled for development only),
use `vicgovau_core_install()` in `docroot/modules/custom/vicgovau_core/vicgovau_core.install` to enable it programmatically. This is required as we are using site install and not storing exported configuration.

## Adding patches for drupal modules
1. Add `title` and `url` to patch on drupal.org to the `patches` array in `extra` section in `composer.json`.

```
    "extra": {
        "patches": {
            "drupal/core": {
                "Contextual links should not be added inside another link - https://www.drupal.org/node/2898875": "https://www.drupal.org/files/issues/contextual_links_should-2898875-3.patch"
            }
        }    
    }
```

2. `composer update --lock`

## Coding standards
PHP and JS code linting uses [PHP_CodeSniffer](https://github.com/squizlabs/PHP_CodeSniffer) with Drupal rules from [Coder](https://www.drupal.org/project/coder) module and additional local overrides in `phpcs.xml.dist` and `.eslintrc`.   

## Behat tests
Behat configuration uses multiple extensions: 
- [Drupal Behat Extension](https://github.com/jhedstrom/drupalextension) - Drupal integration layer. Allows to work with Drupal API from within step definitions.
- [Behat Screenshot Extension](https://github.com/integratedexperts/behat-screenshot) - Behat extension and a step definition to create HTML and image screenshots on demand or test fail.
- [Behat Progress Fail Output Extension](https://github.com/integratedexperts/behat-format-progress-fail) - Behat output formatter to show progress as TAP and fail messages inline. Useful to get feedback about failed tests while continuing test run.
- `VicgovauDrupalContext` - Site-specific Drupal context with custom step definitions.
- `VicgovauMinkContext` - Site-specific Mink context with custom step definitions.

Generic Behat tests should be written against the test entities from the Tide Test module. If a new test entity (node, block, etc.) is added to the Tide Test module, the relevant permissions must be also granted to Approver and Editor via the hook `tide_test_entity_bundle_create()`.

### Run tests locally:
- Run all tests: `composer app:test`
- Run PHPUnit tests: `composer app:test-phpunit`
- Run Behat tests: `composer app:test-behat`
    - Run specific test feature: `composer app:test-behat tests/behat/features/homepage.feature`
    - Run specific test tag: `composer app:test-behat -- --tags=wip`

Read more information in [the wiki page](https://digital-engagement.atlassian.net/wiki/spaces/SDP/pages/134906009/Behat+testing).

## Automated builds (Continuous Integration)
In software engineering, continuous integration (CI) is the practice of merging all developer working copies to a shared mainline several times a day. 
Before feature changes can be merged into a shared mainline, a complete build must run and pass all tests on CI server.

This project uses [Circle CI](https://circleci.com/) as CI server: it imports production backups into fully built codebase and runs code linting and tests. When tests pass, a deployment process is triggered for nominated branches (usually, `master` and `develop`).

Add [skip ci] to the commit subject to skip CI build. Useful for documentation changes.

### SSH
Circle CI supports SSHing into the build for 30 minutes after the build is finished. SSH can be enabled either during the build run or when the build is started with SSH support.

### Cache
Circle CI supports caching between builds. The cache takes care of saving the state of your dependencies between builds, therefore making the builds run faster.
Each branch of your project will have a separate cache. If it is the very first build for a branch, the cache from the default branch on GitHub (normally `master`) will be used. If there is no cache for master, the cache from other branches will be used.
If the build has inconsistent results (build fails in CI but passes locally), try to re-running the build without cache by clicking 'Rebuild without cache' button.

### Test artifacts
Test artifacts (screenshots etc.) are available under 'Artifacts' tab in Circle CI UI.

