SHELL=/bin/bash

.PHONY: $(shell egrep -oh ^[a-zA-Z0-9][a-zA-Z0-9_-]+: $(MAKEFILE_LIST) | sed 's/://')

# プロジェクトのクリーンを行う
.PHONY: clean
clean:
	fvm flutter clean
	fvm flutter pub get

# format + 静的解析の実行結果を確認する
.PHONY: check 
check:
	fvm dart format --output=none . > format_result.txt
	fvm flutter analyze > analyze_result.txt

# format + 静的解析を行う
.PHONY: format-analyze
format-analyze:
	fvm flutter pub run import_sorter:main
	fvm dart format .
	fvm flutter analyze

# pubspec.yamlに記載の全てのpackageのUpdateを行う
.PHONY: pub-upgrade
pub-upgrade:
	fvm flutter pub upgrade