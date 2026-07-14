HOST ?= 127.0.0.1
PORT ?= 4001
BUNDLE ?= $(shell if command -v rbenv >/dev/null 2>&1; then printf "rbenv exec bundle"; else printf "bundle"; fi)

.PHONY: install build serve clean

install:
	$(BUNDLE) install

build:
	$(BUNDLE) exec jekyll build

serve:
	$(BUNDLE) exec jekyll serve --host $(HOST) --port $(PORT)

clean:
	$(BUNDLE) exec jekyll clean
