<p align="center"><a href="https://www.drupal.org/project/tide" target="_blank"><img src="docs/SDP_Tide_product_logo_JPG.JPG" alt="SDP logo" height="150"></a></p>
<p align="center"><i>Tide is a Drupal 8 distribution focused on delivering an API first, headless Drupal content administration site.</i></p>

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
[Tide](https://github.com/dpc-sdp/tide) is a Drupal 8 install profile that enables API first, headless content management system (CMS) maintained by [Victorian Government](vic.gov.au) as part of [Single Digital Presence](https://www.singledigitalpresence.vic.gov.au/) initiative.

Tide offers Victorian Government agencies access to a stable, easy-to-use, flexible and unified toolkit to build and run websites easily and cost-effectively. Its main function is to provide a powerful central content repository that can 'serve' content to one or multiple sites and channels via APIs.

## What is included
The profile brings-in a mere collection of modules bundled into governed, stable and tested Drupal installation profile.

The modules are split based on the features or functionality they provide and can be used either as part of the Tide profile or as a standalone (provided that other dependency modules installed as well).

List of modules that are included as part of the profile:

| Name | Machine name | Category | Repository | Description |
| :---         |     :---:      |     :---:      |     :---:      |          :--- |
| Tide Authenticated Content   | tide_authenticated_content   | Utility    | https://github.com/dpc-sdp/tide_authenticated_content    | Adds configuration that allows restricted content entities to be exposed via custom API endpoints based on user authentication status. This module depends on Tide Event, Tide Landing Page, Tide Media and Tide Site. |
| Tide Alert   | tide_alert     | Utility    | https://github.com/dpc-sdp/tide_alert    | Provides pre-configured Alert content type (dismissible messages at the top of pages - e.g. emergency update, status message etc). This module depends on Tide Media.   |
| Tide API   | tide_api     | Utility    | https://github.com/dpc-sdp/tide_api    | Exposes content entities to API endpoints. It is required for sites to run headless.    |
| Tide Core     | tide_core      | Utility      | https://github.com/dpc-sdp/tide_core   | Core configurations and settings. This is a dependency for all other Tide modules.  |
| Tide Demo Content     | tide_demo_content     | Utility    | https://github.com/dpc-sdp/tide_demo_content   | Provides demo content for Tide modules.  |
| Tide Event     | tide_event     | Content type      | https://github.com/dpc-sdp/tide_event   | Provides pre-configured Event content type and fields that allows agencies to easily create Event content.  |
| Tide Event ADTW    | tide_event_adtw     | Content type      | https://github.com/dpc-sdp/tide_event_adtw   | Provides integration with Australian Tourism Data Warehouse (ADTW) that imports event listings and creates Event content on the site.  |
| Tide Grant     | tide_grant     | Content type      | https://github.com/dpc-sdp/tide_core   | Provides pre-configured Event content type and fields that allows agencies to easily create Event content. This module depends on Tide Media.  |
| Tide Landing Page   | tide_landing_page     | Content type    | https://github.com/dpc-sdp/tide_landing_page    | Provides Landing page content type with fields. Based on paragraphs, it allows to create pages with complex layouts.    |
| Tide Media     | tide_media      | Utility      | https://github.com/dpc-sdp/tide_media   | Provides new pre-configured Media types (Document, Audio, Video, Embed Video, File) and components (Timelines,  CTA image) ready to be added to content pages.  |
| Tide Monsido     | tide_monsido      | 3rd party integration      | https://github.com/dpc-sdp/tide_monsido   | Adds integration with [Monsido]([https://monsido.com/](https://monsido.com/)) platform.  |
| Tide News     | tide_news      | Content type      | https://github.com/dpc-sdp/tide_news   | Provides pre-configured News content type and Featured News page component. This module depends on Tide Media. |
| Tide Page   | tide_page     | Content type    | https://github.com/dpc-sdp/tide_api    | Provides pre-configured Page content type that allows for creation of simple content pages. This module depends on Tide Media.   |
| Tide Publication     | tide_publication      | Content type      | https://github.com/dpc-sdp/tide_publication   | Provides pre-configured Page content type that allows for creation of Publication pages. This module depends on Tide Landing Page.  |
| Tide Profile     | tide_profile      | Content type      | https://github.com/dpc-sdp/tide_profile   | Provides pre-configured Page content type that allows for creation of people's profile pages. This module depends on Tide Media and Tide Landing Page.  |
| Tide Search     | tide_search      | Utility      | https://github.com/dpc-sdp/tide_core   | Adds enriched search functionality to the site ([Search API](https://www.drupal.org/project/search_api) and [Elasticsearch Connector](https://www.drupal.org/project/elasticsearch_connector)).  |
| Tide Site     | tide_site      | Utility      | https://github.com/dpc-sdp/tide_core   | Adds the capability for multi-site and multi-section content sharing. This module depends on Tide Media. |
| Tide Test   | tide_test     | Utility    | https://github.com/dpc-sdp/tide_api    | Provides a Test content type with sample [Behat](https://behat.org/) scripts as well as framework to easily run tests for other modules. |
| Tide Webform     | tide_webform      | Utility      | https://github.com/dpc-sdp/tide_core   | Adds support for webforms and contains pre-configured Content Rating form implementation.  |

# Installation

Since Tide is an installation profile you will need to have an existing  Drupal 8 codebase with [Composer package manager added](https://www.drupal.org/docs/installing-drupal/add-composer-to-an-existing-site).
Alternatively, you can [download Drupal via composer](https://www.drupal.org/docs/develop/using-composer/using-composer-to-install-drupal-and-manage-dependencies)

Once Drupal codebase and Composer manager are ready, you can then add Tide as project dependency. To ensure you are on the latest release of Tide add this  github repository to `repositories` section of your `composer.json`:

```json
{
  "repositories": {        
      "dpc-sdp/tide": {
          "type": "vcs",
          "no-api": true,
          "url": "https://github.com/dpc-sdp/tide.git"
      }
  }
}
```

> Note, Tide is also available on [Drupal.org](https://www.drupal.org/project/tide), however it is not currently up-to-date.

Now from root directory of your `composer.json` file require this package as any other Composer package using the following bash command:
```bash
composer require dpc-sdp/tide 
``` 

Upon successful completion of composer command you should end up with a `tide` folder inside of `/profiles/contrib/`. You are now ready to run the installation script. Point your browser to the base URL of your website and select "Tide" option as profile in the installation wizard.

Alternatively, if you use [Drush](https://github.com/drush-ops/drush) to run the installation in one command:

```bash
drush site-install tide --site-name=MYSITE
``` 

NOTE: There's a pending PR for `tide_core` module to enable composer to find required CKEditor libraries. If you are getting `no matching package found` message during composer require then as an interim solution you can add these custom repositories to resolve missing packages:

```json
        "package/ckeditor-fakeobjects": {
            "type": "package",
            "package": {
                "name": "ckeditor/fakeobjects",
                "type": "drupal-library",
                "version": "4.5.11",
                "dist": {
                    "type": "zip",
                    "url": "https://download.ckeditor.com/fakeobjects/releases/fakeobjects_4.5.11.zip",
                    "reference": "master"
                },
                "require": {
                    "composer/installers": "~1.0"
                }
            }
        },
        "package/ckeditor-iframe": {
            "type": "package",
            "package": {
                "name": "ckeditor/iframe",
                "type": "drupal-library",
                "version": "4.5.11",
                "dist": {
                    "type": "zip",
                    "url": "https://download.ckeditor.com/iframe/releases/iframe_4.5.11.zip",
                    "reference": "master"
                },
                "require": {
                    "composer/installers": "~1.0"
                }
            }
        },
        "package/ckeditor-liststyle": {
            "type": "package",
            "package": {
                "name": "ckeditor/liststyle",
                "type": "drupal-library",
                "version": "4.8.0",
                "dist": {
                    "type": "zip",
                    "url": "https://download.ckeditor.com/liststyle/releases/liststyle_4.8.0.zip",
                    "reference": "master"
                },
                "require": {
                    "composer/installers": "~1.0"
                }
            }
        },
        "package/ckeditor-templates": {
            "type": "package",
            "package": {
                "name": "ckeditor/templates",
                "type": "drupal-library",
                "version": "4.5.7",
                "dist": {
                    "type": "zip",
                    "url": "https://download.ckeditor.com/templates/releases/templates_4.5.7.zip",
                    "reference": "master"
                }
            }
        }
```

# Contributing
[Open an issue](https://github.com/dpc-sdp) on GitHub or submit a pull request with suggested changes.

# Support
[Digital Engagement, Department of Premier and Cabinet, Victoria, Australia](https://github.com/dpc-sdp) 
is a maintainer of this package.

# Development and maintenance
Development is powered by [Dev-Tools](https://github.com/dpc-sdp/dev-tools). Please refer to Dev-Tools' 
page for [system requirements](https://github.com/dpc-sdp/dev-tools/#prerequisites) and other details.

To start local development stack:
1. Checkout this project 
2. Run `./dev-tools.sh`
3. Run `ahoy build`
 
# Related projects
- [tide_authenticated_content](https://github.com/dpc-sdp/tide_authenticated_content)
- [tide_alert]([https://github.com/dpc-sdp/tide_alert](https://github.com/dpc-sdp/tide_alert))
- [tide_api](https://github.com/dpc-sdp/tide_api)         
- [tide_core](https://github.com/dpc-sdp/tide_core)
- [tide_demo_content]([https://github.com/dpc-sdp/tide_demo_content](https://github.com/dpc-sdp/tide_demo_content))
- [tide_event](https://github.com/dpc-sdp/tide_event)
- [tide_event_adtw](https://github.com/dpc-sdp/tide_event_adtw)
- [tide_grant](https://github.com/dpc-sdp/tide_grant)     
- [tide_landing_page](https://github.com/dpc-sdp/tide_landing_page)
- [tide_media](https://github.com/dpc-sdp/tide_media)     
- [tide_monsido](https://github.com/dpc-sdp/tide_monsido) 
- [tide_news](https://github.com/dpc-sdp/tide_news)       
- [tide_page](https://github.com/dpc-sdp/tide_page)
- [tide_publication](https://github.com/dpc-sdp/tide_publication)       
- [tide_profile](https://github.com/dpc-sdp/tide_profile)          
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
