import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../app_layout.dart';

class CountLabel extends StatelessWidget {
  const CountLabel({
    super.key,
    required this.iconData,
    required this.count,
  });

  final IconData iconData;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(iconData),
        const Gap(SpaceData.px8),
        Text(count.toString())
      ],
    );
  }
}
