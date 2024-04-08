class StoryModel {
  final String userId;
  final String imageUrl;

  StoryModel({
    required this.userId,
    required this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "imageUrl": imageUrl,
    };
  }

  factory StoryModel.fromJson(Map<dynamic, dynamic> json) {
    return StoryModel(
      userId: json['userId'],
      imageUrl: json['imageUrl'],
    );
  }
}

class Story {
  final String userName;
  final String imageUrl;

  Story({
    required this.userName,
    required this.imageUrl,
  });
}
