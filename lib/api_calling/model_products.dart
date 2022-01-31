// To parse this JSON data, do
//
//     final ProductModel = ProductModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> ProductModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String ProductModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  ProductModel({
    required this.id,
    required this.altId,
    required this.name,
    required this.nameBn,
    required this.size,
    required this.catId,
    required this.subCatId,
    required this.thirdCatId,
    required this.brand,
    required this.buyRate,
    required this.regularRate,
    required this.saleRate,
    required this.stock,
    required this.stockAlert,
    required this.minimumOrder,
    required this.description,
    required this.bigDescription,
    required this.image,
    required this.gallery,
    required this.vendor,
    required this.imagelink,
  });

  int id;
  String altId;
  String name;
  String nameBn;
  String size;
  String catId;
  String subCatId;
  String thirdCatId;
  String brand;
  String buyRate;
  String regularRate;
  String saleRate;
  String stock;
  String stockAlert;
  String minimumOrder;
  String description;
  String bigDescription;
  String image;
  String gallery;
  String vendor;
  String imagelink;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        altId: json["alt_id"],
        name: json["name"],
        nameBn: json["name_bn"] == null ? '' : json["name_bn"],
        size: json["size"],
        catId: json["cat_id"],
        subCatId: json["sub_cat_id"],
        thirdCatId: json["third_cat_id"] == null ? '' : json["third_cat_id"],
        brand: json["brand"],
        buyRate: json["buy_rate"],
        regularRate: json["regular_rate"],
        saleRate: json["sale_rate"],
        stock: json["stock"],
        stockAlert: json["stock_alert"],
        minimumOrder: json["minimum_order"],
        description: json["description"],
        bigDescription: json["big_description"],
        image: json["image"],
        gallery: json["gallery"],
        vendor: json["vendor"] == null ? '' : json["vendor"],
        imagelink: json["imagelink"] == null ? '' : json["imagelink"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "alt_id": altId,
        "name": name,
        "name_bn": nameBn == null ? '' : nameBn,
        "size": size,
        "cat_id": catId,
        "sub_cat_id": subCatId,
        "third_cat_id": thirdCatId == null ? '' : thirdCatId,
        "brand": brand,
        "buy_rate": buyRate,
        "regular_rate": regularRate,
        "sale_rate": saleRate,
        "stock": stock,
        "stock_alert": stockAlert,
        "minimum_order": minimumOrder,
        "description": description,
        "big_description": bigDescription,
        "image": image,
        "gallery": gallery,
        "vendor": vendor == null ? '' : vendor,
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
  String userId;

  factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
        id: json["id"],
        attachmenDirectory: json["attachmen_directory"],
        attachmentName: json["attachment_name"],
        attachmentFormat: json["attachment_format"],
        attachmentCaption: json["attachment_caption"],
        attachmentTitle: json["attachment_title"],
        userId: json["user_id"] == null ? '' : json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attachmen_directory": attachmenDirectory,
        "attachment_name": attachmentName,
        "attachment_format": attachmentFormat,
        "attachment_caption": attachmentCaption,
        "attachment_title": attachmentTitle,
        "user_id": userId == null ? '' : userId,
      };
}
