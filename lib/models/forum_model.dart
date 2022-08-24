class ForumModel{
    late String forumId;
    late String title;
    late String description;
    late String imageUrl;
    late List<ForumLike>forumLikes=[];
    late List<ForumComment>forumComments=[];
    late String firstName;
    late String lastName;
    late String userImageUrl;

    ForumModel({
      required this.forumId,
      required this.description,
      required this.imageUrl,
      required this.title,
      required this.forumComments,
      required this.forumLikes,
      required this.lastName,
      required this.firstName,
      required this.userImageUrl,
    });

    ForumModel.fromJson(Map<String,dynamic>json,List<ForumLike>likes,List<ForumComment>comments){
      forumId = json['forumId'];
      title = json['title'];
      description = json['description'];
      imageUrl = json['imageUrl'] ?? "";
      forumLikes = likes;
      forumComments = comments;
      firstName= json['user']['firstName'];
      lastName= json['user']['lastName'];
      userImageUrl= json['user']['imageUrl'];
    }
}

class ForumLike{
  late String forumId;
  late String userId;

  ForumLike({required this.userId,required this.forumId});

  ForumLike.fromJson(Map<String,dynamic>json){
    forumId= json['forumId'];
    userId = json['userId'];
  }
}

class ForumComment{
  late String forumCommentId;
  late String forumId;
  late String userId;
  late String comment;
  late String createdAt;


  ForumComment({required this.userId,required this.comment,required this.createdAt,required this.forumCommentId,required this.forumId,});

  ForumComment.fromJson(Map<String,dynamic>json){
     forumCommentId = json['forumCommentId'];
     forumId = json['forumId'];
     userId = json['userId'];
     comment = json['comment'];
     createdAt = json['createdAt'];
  }



}