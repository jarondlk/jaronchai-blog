HOST ?= 127.0.0.1
PORT ?= 4001
BUNDLE ?= $(shell if command -v rbenv >/dev/null 2>&1; then printf "rbenv exec bundle"; else printf "bundle"; fi)

.PHONY: install build test serve clean

install:
	$(BUNDLE) install

build:
	$(BUNDLE) exec jekyll build

test: build
	$(BUNDLE) exec htmlproofer ./_site --disable-external --allow-hash-href

serve:
	$(BUNDLE) exec jekyll serve --host $(HOST) --port $(PORT)

clean:
	$(BUNDLE) exec jekyll clean
