// To parse this JSON data, do
//
//     final sliderModel = sliderModelFromJson(jsonString);

import 'dart:convert';

List<SliderModel> sliderModelFromJson(String str) => List<SliderModel>.from(
    json.decode(str).map((x) => SliderModel.fromJson(x)));

String sliderModelToJson(List<SliderModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SliderModel {
  SliderModel({
    required this.id,
    required this.postTitle,
    required this.postContent,
    required this.postSlug,
    required this.postType,
    required this.postDate,
    required this.postCategory,
    required this.postExcerpt,
    required this.thumbnail,
    required this.postYoutubeVideoId,
    required this.postStatus,
    required this.postAuthor,
    required this.postOrder,
    required this.postView,
    required this.imagelink,
    required this.attachment,
  });

  int id;
  String postTitle;
  String postContent;
  String postSlug;
  String postType;
  DateTime postDate;
  String postCategory;
  String postExcerpt;
  String thumbnail;
  String postYoutubeVideoId;
  String postStatus;
  String postAuthor;
  dynamic postOrder;
  String postView;
  String imagelink;
  Attachment attachment;

  factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
        id: json["id"],
        postTitle: json["post_title"],
        postContent: json["post_content"],
        postSlug: json["post_slug"],
        postType: json["post_type"],
        postDate: DateTime.parse(json["post_date"]),
        postCategory: json["post_category"],
        postExcerpt: json["post_excerpt"],
        thumbnail: json["thumbnail"],
        postYoutubeVideoId: json["post_youtube_video_id"],
        postStatus: json["post_status"],
        postAuthor: json["post_author"],
        postOrder: json["post_order"],
        postView: json["post_view"],
        imagelink: json["imagelink"],
        attachment: Attachment.fromJson(json["attachment"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "post_title": postTitle,
        "post_content": postContent,
        "post_slug": postSlug,
        "post_type": postType,
        "post_date": postDate.toIso8601String(),
        "post_category": postCategory,
        "post_excerpt": postExcerpt,
        "thumbnail": thumbnail,
        "post_youtube_video_id": postYoutubeVideoId,
        "post_status": postStatus,
        "post_author": postAuthor,
        "post_order": postOrder,
        "post_view": postView,
        "imagelink": imagelink,
        "attachment": attachment.toJson(),
      };
}

class Attachment {
  Attachment({
    required this.id,
    required this.attachmenDirectory,
    required this.attachmentName,
    required this.attachmentFormat,
    required this.attachmentCaption,
    required this.attachmentTitle,
    required this.userId,
  });

  int id;
  String attachmenDirectory;
  String attachmentName;
  String attachmentFormat;
  String attachmentCaption;
  String attachmentTitle;
  dynamic userId;

  factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
        id: json["id"],
        attachmenDirectory: json["attachmen_directory"],
        attachmentName: json["attachment_name"],
        attachmentFormat: json["attachment_format"],
        attachmentCaption: json["attachment_caption"],
        attachmentTitle: json["attachment_title"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attachmen_directory": attachmenDirectory,
        "attachment_name": attachmentName,
        "attachment_format": attachmentFormat,
        "attachment_caption": attachmentCaption,
        "attachment_title": attachmentTitle,
        "user_id": userId,
      };
}
