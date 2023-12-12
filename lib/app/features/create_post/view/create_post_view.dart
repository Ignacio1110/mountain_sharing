import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/create_post_providers.dart';

class CreatePostView extends ConsumerWidget {
  /// TODO add your comment here
  const CreatePostView({Key? key}) : super(key: key);

  static const routeName = '/createPost';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = ref.watch(titleProvider);
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
              decoration: InputDecoration(
                hintText: '請輸入標題(必須)',
              ),
              keyboardType: TextInputType.text,
              onChanged: (String value) {
                ref.read(titleProvider.notifier).state = value;
              },
            ),
            TextField(
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
