import 'dart:convert';

UserDataModel userDataModelFromJson(String str) =>
    UserDataModel.fromJson(json.decode(str));

String userDataModelToJson(UserDataModel data) => json.encode(data.toJson());

class UserDataModel {
  UserDataModel({
    this.data,
  });

  List<Datum>? data;

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.authentication,
    this.company,
    this.customerGroupId,
    this.email,
    this.firstName,
    this.lastName,
    this.notes,
    this.phone,
    this.registrationIpAddress,
    this.taxExemptCategory,
    this.dateCreated,
    this.dateModified,
    this.acceptsProductReviewAbandonedCartEmails,
    this.originChannelId,
    this.channelIds,
  });

  int? id;
  Authentication? authentication;
  String? company;
  int? customerGroupId;
  String? email;
  String? firstName;
  String? lastName;
  String? notes;
  String? phone;
  String? registrationIpAddress;
  String? taxExemptCategory;
  DateTime? dateCreated;
  DateTime? dateModified;
  bool? acceptsProductReviewAbandonedCartEmails;
  int? originChannelId;
  List<int>? channelIds;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        authentication: Authentication.fromJson(json["authentication"]),
        company: json["company"],
        customerGroupId: json["customer_group_id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        notes: json["notes"],
        phone: json["phone"],
        registrationIpAddress: json["registration_ip_address"],
        taxExemptCategory: json["tax_exempt_category"],
        dateCreated: DateTime.parse(json["date_created"]),
        dateModified: DateTime.parse(json["date_modified"]),
        acceptsProductReviewAbandonedCartEmails:
            json["accepts_product_review_abandoned_cart_emails"],
        originChannelId: json["origin_channel_id"],
        channelIds: json["channel_ids"] != null ?List<int>.from(json["channel_ids"].map((x) => x)):null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "authentication": authentication!.toJson(),
        "company": company,
        "customer_group_id": customerGroupId,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "notes": notes,
        "phone": phone,
        "registration_ip_address": registrationIpAddress,
        "tax_exempt_category": taxExemptCategory,
        "date_created": dateCreated!.toIso8601String(),
        "date_modified": dateModified!.toIso8601String(),
        "accepts_product_review_abandoned_cart_emails":
            acceptsProductReviewAbandonedCartEmails,
        "origin_channel_id": originChannelId,
        "channel_ids": channelIds != null?List<dynamic>.from(channelIds!.map((x) => x)):null,
      };
}

class Authentication {
  Authentication({
    this.forcePasswordReset,
  });

  bool? forcePasswordReset;

  factory Authentication.fromJson(Map<String, dynamic> json) => Authentication(
        forcePasswordReset: json["force_password_reset"],
      );

  Map<String, dynamic> toJson() => {
        "force_password_reset": forcePasswordReset,
      };
}
