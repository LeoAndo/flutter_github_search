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

# freezed packageの追加を行う (https://pub.dev/packages/freezed)
.PHONY: pub-add-freezed
pub-add-freezed:
	fvm flutter pub add freezed_annotation
	fvm flutter pub add --dev build_runner
	fvm flutter pub add --dev freezed
	fvm flutter pub add json_annotation
	fvm flutter pub add --dev json_serializable

# riverpod packageの追加を行う (https://pub.dev/packages/flutter_riverpod/) (https://pub.dev/packages/hooks_riverpod/)
.PHONY: pub-add-riverpod
pub-add-riverpod:
	fvm flutter pub add hooks_riverpod
	fvm flutter pub add flutter_riverpod

# freezed関連のファイルをを修正したら、こちらの自動生成コマンドを実行する
.PHONY: freezed-run-generator
freezed-run-generator:
	fvm flutter pub run build_runner build --delete-conflicting-outputs