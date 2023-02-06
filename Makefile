.PHONY: setup
setup:
	npm install

.PHONY: dependencies
dependencies:
	flutter pub get

.PHONY: analyze
analyze:
	flutter analyze

.PHONY: format 
format:
	flutter format lib/

.PHONY: format-analyze
format-analyze:
	flutter format --dry-run lib/
	flutter analyze

.PHONY: build-runner
build-runner:
	flutter packages pub run build_runner build --delete-conflicting-outputs
  
.PHONY: clean-build
clean-build:
  flutter clean
  flutter pub get
	flutter packages pub run build_runner build --delete-conflicting-outputs
  flutter build
