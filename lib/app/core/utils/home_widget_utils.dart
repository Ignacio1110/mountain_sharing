import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_widget/home_widget.dart';
import 'package:mountain_sharing/app/core/theme/gen/assets.gen.dart';

/// A utility class to update the Home Widget
class HomeWidgetUtils {
  Future<void> updateHomeWidget() async {
    // update the home widget data
    final now = DateTime.now();

    // send the data to the home widget
    await Future.wait<bool?>([
      HomeWidget.saveWidgetData(
        'title',
        'Updated from Background',
      ),
      HomeWidget.saveWidgetData(
        'message',
        '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}',
      ),
    ]);

    unawaited(
      HomeWidget.updateWidget(
        name: 'HomeWidgetExampleProvider',
        iOSName: 'MountainWidget',
      ),
    );
  }

  /// 傳送資料到 Home Widget
  Future<dynamic> _sendData({
    required String title,
    required String message,
  }) async {
    try {
      return Future.wait([
        HomeWidget.saveWidgetData<String>('title', title),
        HomeWidget.saveWidgetData<String>('message', message),
        HomeWidget.renderFlutterWidget(
          const Icon(
            Icons.markunread_rounded,
            size: 200,
          ),
          logicalSize: const Size(300, 300),
          key: 'dashIcon',
        ),
      ]);
    } on PlatformException catch (exception) {
      debugPrint('Error Sending Data. $exception');
    }
  }

  /// 更新 Home Widget
  Future<bool?> _updateWidget() async {
    try {
      if (Platform.isAndroid) {
        return HomeWidget.updateWidget(
          qualifiedAndroidName:
              'com.example.mountain_sharing.HomeWidgetExampleProvider', // TODO(ignacio):
        );
      }

      return HomeWidget.updateWidget(
        name: 'HomeWidgetExampleProvider',
        iOSName: 'MountainWidget',
      );
    } on PlatformException catch (exception) {
      debugPrint('Error Updating Widget. $exception');
    }

    return null;
  }

  /// 傳送並更新 Home Widget
  Future<bool?> sendDataAndUpdateWidget({
    required String title,
    required String message,
  }) async {
    await _sendData(title: title, message: message);
    return _updateWidget();
  }
}
