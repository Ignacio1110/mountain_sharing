import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class DemoCrashView extends StatelessWidget {
  const DemoCrashView({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAnalytics.instance.setCurrentScreen(screenName: 'demo_crash_view');

    return Placeholder(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () async {
                throw Error();
              },
              child: Text('test error'),
            ),
            ElevatedButton(
              onPressed: () async {
                FirebaseAnalytics analytics = FirebaseAnalytics.instance;
                await analytics.logEvent(
                  name: 'test_event',
                  parameters: {
                    'user': 'ignacio',
                    'category': 'l1',
                  },
                );
              },
              child: Text('test event'),
            ),
          ],
        ),
      ),
    );
  }
}
