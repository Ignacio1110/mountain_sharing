import 'package:mountain_models/mountain_models.dart' as data_source;

typedef PostModel = data_source.PostResponse;

final sample = {
  "id": "1",
  "authorId": "user1",
  "mountainName": "mountain1",
  "title": "First Post",
  "content": "This is the content of the first post.",
  "img": "image1.jpg",
  "tags": ["tag1", "tag2"],
  "views": 100,
  "likes": 50,
  "comments": 5
};
