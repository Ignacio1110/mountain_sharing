import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mountain_sharing/app/core/theme/design_system.dart';

import '../../../core/utils.dart';
import '../providers/create_post_providers.dart';

class CreatePostView extends ConsumerWidget {
  /// TODO add your comment here
  const CreatePostView({Key? key}) : super(key: key);

  static const routeName = '/createPost';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = ref.watch(titleProvider);
    final tags = ref.watch(tagsProvider);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        // FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('新貼文'),
          actions: [
            if (title.isNotEmpty) Text('下一步'),
          ],
        ),
        body: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 100,
                  height: 134.69,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image:
                          NetworkImage("https://via.placeholder.com/100x135"),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                ),
                SizedBox(
                  width: 12.0,
                ),
                Container(
                  width: 100,
                  height: 134.69,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image:
                          NetworkImage("https://via.placeholder.com/100x135"),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                ),
              ],
            ),
            // 文字輸入框
            TextField(
              maxLength: 20,
              decoration: InputDecoration(
                hintText: '請輸入標題(必須)',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
              keyboardType: TextInputType.text,
              onChanged: (String value) {
                ref.read(titleProvider.notifier).state = value;
              },
            ),
            Wrap(
              children: tags
                  .map(
                    (e) => Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: ShapeDecoration(
                        color: AppColors.gray100,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Text(
                        e,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            TextField(
              maxLength: 500,
              decoration: InputDecoration(
                hintText: '請輸入內文',
              ),
              keyboardType: TextInputType.text,
              onChanged: (String value) {
                ref.read(contentProvider.notifier).state = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
