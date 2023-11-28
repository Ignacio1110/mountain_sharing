import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mountain_sharing/app/core/theme/design_system.dart';
import 'package:mountain_sharing/app/features/all_mountains/view/all_mountains_view.dart';
import 'package:mountain_sharing/app/features/main_page/providers/main_page_providers.dart';

class MainPageView extends ConsumerWidget {
  /// TODO add your comment here
  const MainPageView({Key? key}) : super(key: key);

  static const routeName = '/mainPage';

  final List<Widget> pages = const [
    AllMountainsView(),
    Placeholder(),
    Placeholder(),
    Placeholder()
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(selectedIndex);

    return Scaffold(
      body: pages[index],
      bottomNavigationBar: const BottomAppBar(
        color: AppColors.yellow100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _BottomAppBarItem(itemIndex: 0, label: '山友'),
            _BottomAppBarItem(itemIndex: 1, label: '路線'),
            _AddPostButton(),
            _BottomAppBarItem(itemIndex: 2, label: '通知'),
            _BottomAppBarItem(itemIndex: 3, label: '個人'),
          ],
        ),
      ),
    );
  }
}

class _AddPostButton extends StatelessWidget {
  const _AddPostButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 38,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: ShapeDecoration(
        color: AppColors.secondary,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 2,
            strokeAlign: BorderSide.strokeAlignCenter,
            color: AppColors.primary,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: const Icon(Icons.add),
    );
  }
}

class _BottomAppBarItem extends ConsumerWidget {
  const _BottomAppBarItem({
    super.key,
    required this.itemIndex,
    this.label = '',
  });

  final int itemIndex;
  final String label;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(selectedIndex);

    final bool isSelected = index == itemIndex;

    return GestureDetector(
      onTap: () {
        ref.read(selectedIndex.notifier).state = itemIndex;
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 64,
        height: 38,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: isSelected
            ? ShapeDecoration(
                color: AppColors.secondary.withOpacity(.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              )
            : null,
        child: Center(
          child: FittedBox(
            child: Text(
              label,
              style: AppTextStyle.heading3.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
