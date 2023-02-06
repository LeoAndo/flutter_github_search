SHELL=/bin/bash

.PHONY: $(shell egrep -oh ^[a-zA-Z0-9][a-zA-Z0-9_-]+: $(MAKEFILE_LIST) | sed 's/://')

.PHONY: clean
clean:
	flutter clean
	flutter pub get

.PHONY: check 
check:
	dart format --output=none . > format_result.txt
	flutter analyze > analyze_result.txt

.PHONY: format-analyze
format:
	flutter pub run import_sorter:main
	dart format .
	flutter analyze