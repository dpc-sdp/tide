# Tide
Tide is a Drupal 8 distribution focused on delivering an API first, headless Drupal content administration site.

[![CircleCI](https://circleci.com/gh/dpc-sdp/tide.svg?style=svg)](https://circleci.com/gh/dpc-sdp/tide)

## Tide modules
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

# CONTENTS OF THIS FILE

* Introduction
* Requirements
* Recommended Modules
* Installation

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

# INSTALLATION
Include the Tide distribution in your composer.json file
```bash
composer require dpc-sdp/tide
```
Install your site using the distribution
```bash
drush si tide
```

