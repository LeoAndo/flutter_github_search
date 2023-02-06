SHELL=/bin/bash

.PHONY: $(shell egrep -oh ^[a-zA-Z0-9][a-zA-Z0-9_-]+: $(MAKEFILE_LIST) | sed 's/://')

.PHONY: clean
clean:
	fvm flutter clean
	fvm flutter pub get

.PHONY: check 
check:
	fvm dart format --output=none . > format_result.txt
	fvm flutter analyze > analyze_result.txt

.PHONY: format-analyze
format:
	fvm flutter pub run import_sorter:main
	fvm dart format .
	fvm flutter analyze