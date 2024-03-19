import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mountain_sharing/app/core/theme/app_layout.dart';
import 'package:mountain_sharing/app/core/theme/app_text_style.dart';
import 'package:mountain_sharing/app/core/theme/gen/assets.gen.dart';
import 'package:mountain_sharing/app/core/theme/gen/colors.gen.dart';
import 'package:mountain_sharing/i18n/strings.g.dart';

// 暫時先放，還未修改
class AppTopBar extends StatelessWidget {
  const AppTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = TranslationProvider.of(context).translations;

    return Container(
      width: 389,
      margin: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 16,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFFFFFFF5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Assets.icons.face.svg(),
              const Gap(SpaceData.px8),
              Text.rich(
                tr.appTitle(
                  tapHereHi: (String) {
                    return TextSpan(
                      text: String,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('tap');
                          if (LocaleSettings.currentLocale == AppLocale.en) {
                            LocaleSettings.setLocale(AppLocale.zhTw);
                          } else {
                            LocaleSettings.setLocale(AppLocale.en);
                          }
                        },
                    );
                  },
                ),
                style: AppTextStyle.heading3.copyWith(color: AppColors.primary),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '所在地',
                style:
                    AppTextStyle.subtitle1.copyWith(color: AppColors.primary),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '24º',
                    style: AppTextStyle.heading3
                        .copyWith(color: AppColors.primary),
                  ),
                  const Gap(SpaceData.px8),
                  Assets.icons.wbSunny.svg(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
