.PHONY: r_flutter_gen

r_flutter_gen:
	echo "根據設定產生程式碼"
	fluttergen -c pubspec.yaml

create_page:
	echo "新增頁面"
	mason make riverpod_module

dart_fix:
	dart fix --dry-run
	dart fix --apply

dart_format:
	dart format lib/

dart_run_slang:
	echo "產出翻譯"
	dart run slang
