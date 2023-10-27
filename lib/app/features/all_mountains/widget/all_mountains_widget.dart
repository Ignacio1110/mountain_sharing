import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mountain_sharing/app/core/theme/app_layout.dart';

import '../../../core/theme/design_system.dart';
import '../model/all_mountains_model.dart';

class ItemMountainWidget extends StatelessWidget {
  /// TODO add your comment here
  const ItemMountainWidget({Key? key, required this.postData})
      : super(key: key);

  final PostModel postData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358,
      height: 435,
      padding: const EdgeInsets.symmetric(
        horizontal: 19.0,
        vertical: 16.0,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.primary,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          // 頭像、title、follow按鈕
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 23.0,
                backgroundImage: NetworkImage(
                    'https://media.licdn.com/dms/image/D4E03AQEqXIy7h3d5Ew/profile-displayphoto-shrink_800_800/0/1692798770105?e=2147483647&v=beta&t=GWZ_iDYeonDd7llyvzOhZQuKVsVsj76vMLY7ap9Azh0'),
              ),
              const Gap(SpaceData.px20),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // title
                    Text(
                      postData.authorId,
                      style: AppTextStyle.heading4,
                    ),
                    // sub title
                    Text(
                      postData.mountainName,
                      style: AppTextStyle.subtitle2,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              const Gap(SpaceData.px20),
              TextButton.icon(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.white,
                  foregroundColor: AppColors.black,
                  shape: const StadiumBorder(
                    side: BorderSide(color: AppColors.primary),
                  ),
                ),
                icon: const Icon(Icons.add),
                label: const Text('follow'),
              )
            ],
          ),
          const Gap(SpaceData.px12),
          // 標題
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              postData.title,
              style: AppTextStyle.heading4,
            ),
          ),
          const Gap(SpaceData.px8),
          // 貼文內容
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                postData.content,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.body1,
              ),
            ),
          ),
          const Gap(SpaceData.px8),
          // 圖片
          Container(
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: NetworkImage(postData.img),
                fit: BoxFit.cover,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: const AspectRatio(
              aspectRatio: 16 / 9,
            ),
          ),
          const Gap(SpaceData.px12),
          // 標籤 tag
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              postData.tags.map((e) => '#$e').join(' '),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Gap(SpaceData.px12),
          // 按讚數、留言數
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CountLabel(
                iconData: Icons.remove_red_eye_outlined,
                count: postData.views,
              ),
              CountLabel(
                iconData: Icons.message_outlined,
                count: postData.comments,
              ),
              CountLabel(
                iconData: Icons.thumb_up_outlined,
                count: postData.likes,
              ),
            ],
          )
        ],
      ),
    );
  }
}
