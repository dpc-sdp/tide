<p align="center"><a href="https://www.drupal.org/project/tide" target="_blank"><img src="docs/SDP_Tide_product_logo_JPG.JPG" alt="SDP logo" height="150"></a></p>
<p align="center"><i>Tide is a Drupal 9 distribution focused on delivering an API first, headless Drupal content administration site.</i></p>

<p align="center">
<a href="https://circleci.com/gh/dpc-sdp/tide"><img src="https://circleci.com/gh/dpc-sdp/tide.svg?style=svg&circle-token=2725c08f9f9c81b430b5c302d4843b20b8deec86"></a>
<a href="https://github.com/dpc-sdp/tide/releases/latest"><img src="https://img.shields.io/github/release/dpc-sdp/tide.svg"></a>
<a href="https://www.drupal.org/8"><img src="https://img.shields.io/badge/Drupal-8-blue.svg"></a>
<a href="https://github.com/dpc-sdp/tide/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/licence-GPL2-blue.svg"></a>
<a href="https://github.com/dpc-sdp/tide/pulls"><img src="https://img.shields.io/github/issues-pr/dpc-sdp/tide_page.svg"></a>
</p>

<!-- TABLE OF CONTENTS -->
# Table of Contents
* [About the project](#About-the-project)
  * [What is in this package](#what-is-in-this-package)
* [Use](#use) 
* [Contributing](#contributing)
  * [Development and maintenance](#development-and-maintenance)
* [Use](#use)
* [Support](#support)
* [Related projects](#related-projects)
* [License](#license)
* [Attribution](#attribution)

# About the project
[Tide](https://github.com/dpc-sdp/tide) distribution for building websites on the Single Digital Presence platform

Tide is a Drupal 9 distribution focused on delivering an API first, headless Drupal content administration site.

This package is merely a collection of all Tide modules that make up this distribution.

## What is in this package
- references to all Tide modules

# Use
To install this package, add this custom repository to `repositories` section of
your `composer.json`:

```json
{
  "repositories": {        
      "dpc-sdp/tide": {
          "type": "vcs",
          "no-api": true,
          "url": "https://github.com/dpc-sdp/tide_page.git"
      }
  }
}
```

Require this package as any other Composer package:
```bash
composer require drupal/tide 
``` 

# Contributing
[Open an issue](https://github.com/dpc-sdp) on GitHub or submit a pull request with suggested changes.

# Support
[Digital Engagement, Department of Premier and Cabinet, Victoria, Australia](https://github.com/dpc-sdp) 
is a maintainer of this package.

# Development and maintenance
Local development is powered by [DDEV](https://ddev.readthedocs.io/) with the
[ddev-drupal-contrib](https://github.com/ddev/ddev-drupal-contrib) add-on. The profile
repository is the project root; a disposable Drupal site is built into `web/` and the
profile is made available to it via per-file symlinks — code changes at the repository
root take effect immediately, no sync step required.

To build a fresh local development site in one step:

1. Checkout this project.
2. Run `ddev build` — removes the generated `web/` and `vendor/` directories, starts
   the services, installs the dependencies, symlinks the profile and installs the site.

Alternatively, run each build step separately:

1. Run `ddev start` — starts web, db, OpenSearch, selenium-chrome and clamav services.
2. Run `ddev poser` — installs Drupal core (version pinned by `DRUPAL_CORE` in `.ddev/config.yaml`), `dpc-sdp/tide_core` and all dependencies into `web/` and `vendor/`.
3. Run `ddev symlink-project` — symlinks this profile into `web/profiles/custom/tide` (re-run after adding/removing root-level files; also runs automatically on `ddev start`).
4. Run `ddev install-site` — installs a fresh site using the `tide` installation profile.

Day-to-day commands:
- `ddev drush <command>` — run Drush.
- `ddev ssh` — shell into the web container.

Contributed-module patches are applied from `dpc-sdp/tide_core`'s `composer.json`
(`extra.patches`) via `cweagans/composer-patches` — enabled by `extra.enable-patching`
in this repository's `composer.json`. Patch files referenced with relative paths live
in `/patches` in this repository, as they resolve against the Composer root.

### Troubleshooting OpenSearch startup

If `ddev start` reports that the OpenSearch container exited or failed to become
healthy, inspect its logs:

```bash
ddev logs -s opensearch
```

If the logs report that `vm.max_map_count` is too low:

```text
ERROR: [1] bootstrap checks failed
[1]: max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]
```

Increase the limit and start DDEV again:

```bash
docker run --privileged --rm --pid=host alpine sysctl -w vm.max_map_count=262144
ddev start
```

The setting may need to be applied again after restarting Docker.
 
# Related projects
- [tide_api](https://github.com/dpc-sdp/tide_api)         
- [tide_core](https://github.com/dpc-sdp/tide_core)
- [tide_event](https://github.com/dpc-sdp/tide_event)
- [tide_landing_page](https://github.com/dpc-sdp/tide_landing_page)
- [tide_media](https://github.com/dpc-sdp/tide_media)     
- [tide_monsido](https://github.com/dpc-sdp/tide_monsido) 
- [tide_news](https://github.com/dpc-sdp/tide_news)       
- [tide_page](https://github.com/dpc-sdp/tide_page)       
- [tide_search](https://github.com/dpc-sdp/tide_search)   
- [tide_site](https://github.com/dpc-sdp/tide_site)       
- [tide_test](https://github.com/dpc-sdp/tide_test)       
- [tide_webform](https://github.com/dpc-sdp/tide_webform)  

# License
This project is licensed under [GPL2](https://github.com/dpc-sdp/tide/blob/master/LICENSE.txt)

# Attribution
Single Digital Presence offers government agencies an open and flexible toolkit to build websites quickly and cost-effectively.
<p align="center"><a href="https://www.vic.gov.au/what-single-digital-presence-offers" target="_blank"><img src="docs/SDP_Logo_VicGov_RGB.jpg" alt="SDP logo" height="150"></a></p>

The Department of Premier and Cabinet partnered with Salsa Digital to deliver Single Digital Presence. As long-term supporters of open government approaches, they were integral to the establishment of SDP as an open source platform.
<p align="center"><a href="https://salsadigital.com.au/" target="_blank"><img src="docs/Salsa.png" alt="Salsa logo" height="150"></a></p>
