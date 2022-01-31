// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

List<CategoryModel> categoryModelFromJson(String str) =>
    List<CategoryModel>.from(
        json.decode(str).map((x) => CategoryModel.fromJson(x)));

String categoryModelToJson(List<CategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
  CategoryModel({
    required this.id,
    required this.parentId,
    required this.name,
    required this.nameBn,
    required this.icon,
    required this.thumbnail,
    required this.orderBy,
    required this.imagelink,
  });

  int id;
  String parentId;
  String name;
  String nameBn;
  dynamic icon;
  String thumbnail;
  String orderBy;
  String imagelink;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        parentId: json["parent_id"] == null ? '' : json["parent_id"],
        name: json["name"],
        nameBn: json["name_bn"],
        icon: json["icon"],
        thumbnail: json["thumbnail"],
        orderBy: json["order_by"],
        imagelink: json["imagelink"] == null ? '' : json["imagelink"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "parent_id": parentId == null ? '' : parentId,
        "name": name,
        "name_bn": nameBn,
        "icon": icon,
        "thumbnail": thumbnail,
        "order_by": orderBy,
        "imagelink": imagelink == null ? '' : imagelink,
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
