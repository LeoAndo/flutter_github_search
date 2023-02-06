SHELL=/bin/bash

.PHONY: $(shell egrep -oh ^[a-zA-Z0-9][a-zA-Z0-9_-]+: $(MAKEFILE_LIST) | sed 's/://')

.PHONY: clean
clean:
	flutter clean
	flutter pub get

.PHONY: format-check 
format:
	dart format --output=none .

.PHONY: format-analyze
format-analyze:
	dart format .
	flutter analyze