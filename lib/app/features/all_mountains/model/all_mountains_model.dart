class MountainPostModel {
  final String userImg;
  final String name;
  final String mountainName;
  final String title;
  final String content;
  final String imgUrl;
  final List<String> hashTag;
  final int viewed;
  final int comments;
  final int likes;

  MountainPostModel({
    required this.userImg,
    required this.name,
    required this.mountainName,
    required this.title,
    required this.content,
    required this.imgUrl,
    required this.hashTag,
    required this.viewed,
    required this.comments,
    required this.likes,
  });

  factory MountainPostModel.sample(int index) {
    return MountainPostModel(
        userImg: "https://via.placeholder.com/46x46",
        name: "test $index",
        mountainName: "山A",
        title: '新手登山安全超懶人包',
        content:
            '上山前的必備安全知識 | 花10分鐘看完再出發｜記得給隊友看 戶外、登山⛰️：記得跟我這樣做！不會再迷路啦🤩！這篇真的很重要趕緊分享給愛戶外的朋友！',
        imgUrl: 'https://via.placeholder.com/320x180',
        hashTag: [
          '新手教學',
          '入山守則',
          '懶人包',
        ],
        viewed: 100,
        comments: 20,
        likes: 20);
  }
}
