import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AllMountainsView extends ConsumerWidget {
  /// TODO add your comment here
  const AllMountainsView({Key? key}) : super(key: key);

  static const routeName = '/allMountains';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade100,
      appBar: AppBar(
        title: Text('台灣山岳'),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.all(16.0),
          itemCount: 10,
          separatorBuilder: (BuildContext ctx, int index) {
            return const SizedBox(
              height: 16.0,
            );
          },
          itemBuilder: (BuildContext ctx, int index) {
            return Container(
              width: 358,
              height: 435,
              padding: const EdgeInsets.symmetric(
                horizontal: 19.0,
                vertical: 16.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.brown,
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://img.freepik.com/premium-vector/avatar-profile-colorful-illustration-2_549209-82.jpg?w=2000'),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('data${index}'),
                          Text('data${index}'),
                        ],
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: StadiumBorder(
                            side: BorderSide(color: Colors.brown.shade600),
                          ),
                        ),
                        icon: Icon(Icons.add),
                        label: Text('follow'),
                      )
                    ],
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('新手登山安全超懶人包')),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        "上山前的必備安全知識 | 花10分鐘看完再出發｜記得給隊友看 戶外、登山⛰️：記得跟我這樣做！不會再迷路啦🤩！這篇真的很重要趕緊分享給愛戶外的朋友！"),
                  ),
                  Container(
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image:
                            NetworkImage("https://via.placeholder.com/320x180"),
                        fit: BoxFit.cover,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('# 新手教學'),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [Icon(Icons.visibility_rounded), Text('123')],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [Icon(Icons.visibility_rounded), Text('123')],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [Icon(Icons.visibility_rounded), Text('123')],
                      ),
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}
