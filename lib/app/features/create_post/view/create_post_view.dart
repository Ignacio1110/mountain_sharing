import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
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
    final content = ref.watch(contentProvider);
    final tags = ref.watch(tagsProvider);
    final imageFile = ref.watch(imageFileProvider);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        // FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('新貼文'),
          actions: [
            Text(
              '分享',
              style: TextStyle(
                  color: (title.isNotEmpty &&
                          content.isNotEmpty &&
                          imageFile != null)
                      ? Colors.black
                      : Colors.grey),
            ),
          ],
        ),
        body: Column(
          children: [
            GestureDetector(
              onTap: () async {
                final ImagePicker picker = ImagePicker();
// Pick an image.
                final XFile? image =
                    await picker.pickImage(source: ImageSource.gallery);
                debugPrint(image.toString());
                debugPrint(image?.path.toString());
                ref.read(imageFileProvider.notifier).state = image;
              },
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  color: const Color(0xFFD9D9D9),
                  child: imageFile == null
                      ? const Icon(
                          Icons.add,
                          size: 36,
                        )
                      : Image.file(
                          File(imageFile.path),
                          errorBuilder: (BuildContext context, Object error,
                              StackTrace? stackTrace) {
                            return const Center(
                              child: Text('This image type is not supported'),
                            );
                          },
                          fit: BoxFit.cover,
                        ),
                ),
              ),
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
