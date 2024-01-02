import 'package:flutter/material.dart';

class DemoCrashView extends StatelessWidget {
  const DemoCrashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Center(
        child: ElevatedButton(
          onPressed: () async {
            throw Error();
          },
          child: Text('test error'),
        ),
      ),
    );
  }
}
