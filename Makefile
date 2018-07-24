##
# Build project dependncies.
#
# Usage:
# make <target>
#
# make help - show a list of available targets.
# make build - build project
#
include .env
-include .env.local

.DEFAULT_GOAL := help
.PHONY: build clean clean-full docker-cli docker-destroy docker-restart docker-start docker-stop help install install-site install-module lint rebuild rebuild-full test-behat update-fixtures
.EXPORT_ALL_VARIABLES: ;

## Build project.
build:
	$(call title,Building project)
	$(call exec,$(MAKE) docker-start)
	$(call exec,$(MAKE) install)
	$(call exec,$(MAKE) install-site)
	@echo ''
	$(call title,Build complete)

## Remove dependencies.
clean:
	$(call title,Removing dependencies)
	$(call exec,[ -d $(WEBROOT)/sites/default ] && chmod -Rf 777 $(WEBROOT)/sites/default||true)
	$(call exec,git ls-files --directory --other -i --exclude-from=.gitignore | xargs rm -Rf)

## Remove dependencies and Docker images.
clean-full: docker-stop docker-destroy clean

## Destroy Docker containers.
docker-destroy:
	$(call title,Destroying Dockert containers)
	$(call exec,docker-compose down)

## Re-start Docker containers.
docker-restart:
	$(call title,Restarting Docker containers)
	$(call exec,docker-compose restart)

## Start Docker containers.
docker-start:
	$(call title,Starting Docker containers)
	$(call exec,COMPOSE_CONVERT_WINDOWS_PATHS=1 docker-compose up -d $(filter-out $@,$(MAKECMDGOALS)))
	$(call exec,if docker-compose logs |grep "\[Error\]"; then exit 1; fi)
	@docker ps -a --filter name=^/$(COMPOSE_PROJECT_NAME)_

## Stop Docker containers.
docker-stop:
	$(call title,Stopping Docker containers)
	$(call exec,docker-compose stop $(filter-out $@,$(MAKECMDGOALS)))

## Run Drush command.
drush:
	$(call title,Executing Drush command inside CLI container)
	$(call exec,docker-compose exec cli drush -r $(APP)/$(WEBROOT) $(filter-out $@,$(MAKECMDGOALS)))

## Display this help message.
help:
	@echo ''
	@echo 'Usage:'
	@echo '  ${YELLOW}make${RESET} ${GREEN}<target>${RESET}'
	@echo ''
	@echo 'Targets:'
	@awk '/^[a-zA-Z\-0-9][a-zA-Z\-\_0-9]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")-1); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf "  ${YELLOW}%-$(HELP_TARGET_WIDTH)s${RESET} ${GREEN}%s${RESET}\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)

## Install dependencies
install:
	$(call title,Installing dependencies)
	$(call exec,docker-compose exec cli bash -c "if [ \"$(GITHUB_TOKEN)\" != \"\" ]; then composer config -g github-oauth.github.com $(GITHUB_TOKEN); fi")
	$(call exec,docker-compose exec cli apk add --update make jq)
	# Download development config from Tide profile repository.
	$(call exec,docker-compose exec cli bash -c "curl -L $(COMPOSER_DEV_URL) > $(APP)/composer.dev.json")
	# Merge module's and development composer configs.
	$(call exec,docker-compose exec cli bash -c "jq --indent 4 -M -s '.[0] * .[1]' $(APP)/composer.json $(APP)/composer.dev.json > $(COMPOSER_BUILD)")
	$(call exec,docker-compose exec cli bash -c "COMPOSER=$(COMPOSER_BUILD) composer install -n --ansi --prefer-dist --no-suggest")

## Install current module.
install-module:
	$(call title,Installing current module and dependencies)
	# If running with suggested modules, requre them first.
	$(call exec,docker-compose exec cli bash -c "if [ "$(INSTALL_SUGGEST)" = "1" ] ; then cat $(COMPOSER_BUILD) | jq -r 'select(.suggest != null) | .suggest | keys[]' | xargs -i composer require {}; fi")
	# Copy module code into local vendor directory.
	$(call exec,docker-compose exec cli rm -Rf $(APP)/vendor-local/$(MODULE_NAME))
	$(call exec,docker-compose exec cli mkdir -p $(APP)/vendor-local/$(MODULE_NAME))
	$(call exec,docker-compose exec cli bash -c "git ls-tree HEAD --name-only|xargs -I '{}' cp -R '{}' $(APP)/vendor-local/$(MODULE_NAME)/")
	# Add local module repository.
	$(call exec,docker-compose exec cli bash -c "COMPOSER=$(COMPOSER_BUILD) composer config repositories.dpc-sdp/$(MODULE_NAME) path vendor-local/$(MODULE_NAME)")
	# Require module from local repository.
	$(call exec,docker-compose exec cli bash -c "COMPOSER=$(COMPOSER_BUILD) composer require dpc-sdp/$(MODULE_NAME)")
	# If running with suggested modules, install them first.
	$(call exec,docker-compose exec cli bash -c "if [ "$(INSTALL_SUGGEST)" = "1" ] ; then cat $(COMPOSER_BUILD) | jq -r 'select(.suggest != null) | .suggest | keys[]' |  sed 's/dpc-sdp\///' | xargs -i drush -r $(APP)/$(WEBROOT) en -y {}; fi")
	# Enable current module.
	$(call exec,docker-compose exec cli drush -r $(APP)/$(WEBROOT) en -y $(MODULE_NAME))

## Install site.
install-site:
	$(call title,Installing a site)
	$(call exec,docker-compose exec cli drush -r $(APP)/$(WEBROOT) si tide -y --db-url=mysql://drupal:drupal@$(MYSQL_HOST)/drupal --account-name=admin --account-pass=admin install_configure_form.enable_update_status_module=NULL install_configure_form.enable_update_status_emails=NULL)
	$(call exec,docker-compose exec cli bash -c "COMPOSER=$(COMPOSER_BUILD) composer --working-dir=$(APP)/$(BUILD) drupal-post-install")

## Lint code.
lint:
	$(call title,Linting code)
	$(call exec,docker-compose exec cli vendor/bin/parallel-lint --exclude vendor $(PHP_LINT_EXCLUDES) -e $(PHP_LINT_EXTENSIONS) $(PHP_LINT_TARGETS))
	$(call exec,docker-compose exec cli vendor/bin/phpcs $(PHPCS_TARGETS))

update-fixtures:
	$(call title,Updating fixture files for Drupal $(DRUPAL_VERSION))
	$(call exec,rsync -av --delete --no-progress --exclude-from=$(BUILD)/.rsync-exclude $(BUILD)/ $(FIXTURES)/d$(DRUPAL_VERSION)/)

## Re-build project dependencies.
rebuild: clean build

## Clean and fully re-build project dependencies.
rebuild-full: clean-full build

## Run Behat tests.
test-behat:
	$(call title,Running behat tests)
	$(call exec,docker-compose exec cli vendor/bin/behat --format=progress_fail --strict --colors $(BEHAT_PROFILE) $(filter-out $@,$(MAKECMDGOALS)))

#-------------------------------------------------------------------------------
# VARIABLES.
#-------------------------------------------------------------------------------
COMPOSE_PROJECT_NAME ?= app

APP ?= /app
WEBROOT ?= build/docroot
BUILD ?= build
FIXTURES ?= tests/behat/fixtures
URL ?= http://$(MODULE_NAME).docker.amazee.io/

DRUPAL_VERSION ?= 8
MODULES_PATH ?= modules
INSTALL_SUGGEST ?= 0

MYSQL_HOST ?= mariadb
MYSQL_PORT ?= 3306

PHP_LINT_EXTENSIONS ?= php,inc,module,theme,install
PHP_LINT_TARGETS ?= ./
PHP_LINT_TARGETS := $(subst $\",,$(PHP_LINT_TARGETS))
PHP_LINT_EXCLUDES ?= --exclude vendor --exclude node_modules --exclude build
PHP_LINT_EXCLUDES := $(subst $\",,$(PHP_LINT_EXCLUDES))

PHPCS_TARGETS := $(subst $\",,$(PHPCS_TARGETS))

# Path to a file with additional sanitization commands.
DB_SANITIZE_SQL ?= .dev/sanitize.sql

# Prefix of the Docker images.
DOCKER_IMAGE_PREFIX ?= amazeeio

# GitHub token to not be limited by API calls.
GITHUB_TOKEN ?= ""

# Override composer configuration file with the one used for build.
COMPOSER_BUILD ?= $(APP)/composer.build.json

# URL of the development Composer configuration file.
COMPOSER_DEV_URL ?= file:///composer.dev.json

# Width of the target column in help target.
HELP_TARGET_WIDTH = 20

# Print verbose messages.
VERBOSE ?= 1

# Colors for output text.
GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
WHITE  := $(shell tput -Txterm setaf 7)
RESET  := $(shell tput -Txterm sgr0)

#-------------------------------------------------------------------------------
# FUNCTIONS.
#-------------------------------------------------------------------------------

##
# Execute command and display executed command to user.
#
define exec
	@printf "$$ ${YELLOW}${subst ",',${1}}${RESET}\n" && $1
endef

##
# Display the target title to user.
#
define title
	$(if $(VERBOSE),@printf "${GREEN}==> ${1}...${RESET}\n")
endef

# Pass arguments from CLI to commands.
# @see https://stackoverflow.com/a/6273809/1826109
%:
	@:
