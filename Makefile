.PHONY: r_flutter_gen

r_flutter_gen:
	echo "根據設定產生程式碼"
	fluttergen -c pubspec.yaml
