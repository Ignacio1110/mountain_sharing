import 'package:flutter/material.dart';

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
              const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://img.freepik.com/premium-vector/avatar-profile-colorful-illustration-2_549209-82.jpg?w=2000'),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(postData.authorId),
                    Text(
                      postData.mountainName,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
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
                icon: const Icon(Icons.add),
                label: const Text('follow'),
              )
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              postData.title,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                postData.content,
                overflow: TextOverflow.fade,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
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
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              postData.tags.map((e) => '#$e').join(' '),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.visibility_rounded),
                  Text(
                    postData.views.toString(),
                  )
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.visibility_rounded),
                  Text(
                    postData.comments.toString(),
                  )
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.visibility_rounded),
                  Text(
                    postData.likes.toString(),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
