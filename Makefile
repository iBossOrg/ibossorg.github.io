JEKYLL_VERSION		?= 3.8.5
JEKYLL_IMAGE		?= jekyll/builder

GITHUB_USERNAME		= $(shell basename $$(dirname $$(git config --get remote.origin.url)))
GITHUB_REPOSITORY	= $(shell basename -s .git $$(git config --get remote.origin.url))
PAGES_REPO_NWO		= $(GITHUB_USERNAME)/$(GITHUB_REPOSITORY)

DOCKER_COMPOSE		= env \
			  JEKYLL_VERSION=$(JEKYLL_VERSION) \
			  docker-compose

all: clean up logs

up:
	 ${DOCKER_COMPOSE} up -d

logs:
	${DOCKER_COMPOSE} logs -f

down:
	${DOCKER_COMPOSE} down

clean: down
	rm -rf _site .jekyll-metadata .sass-cache
