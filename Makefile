
all: build

serve:
	bundle exec jekyll serve --watch

build:
	bundle exec jekyll build

clean:
	/bin/rm -rf _site
