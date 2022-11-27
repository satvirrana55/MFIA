// To parse this JSON data, do
//
//     final updateUserModel = updateUserModelFromJson(jsonString);

import 'dart:convert';

UpdateUserModel updateUserModelFromJson(String? str) =>
    UpdateUserModel.fromJson(json.decode(str!));

String? updateUserModelToJson(UpdateUserModel data) =>
    json.encode(data.toJson());

class UpdateUserModel {
  UpdateUserModel({
    this.data,
    this.meta,
  });

  List<Datum>? data;
  Meta? meta;

  factory UpdateUserModel.fromJson(Map<String, dynamic> json) =>
      UpdateUserModel(
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta == null ? null : meta!.toJson(),
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
    this.storeCreditAmounts,
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
  List<StoreCreditAmount>? storeCreditAmounts;
  int? originChannelId;
  List<int>? channelIds;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        authentication: json["authentication"] == null
            ? null
            : Authentication.fromJson(json["authentication"]),
        company: json["company"],
        customerGroupId: json["customer_group_id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        notes: json["notes"],
        phone: json["phone"],
        registrationIpAddress: json["registration_ip_address"],
        taxExemptCategory: json["tax_exempt_category"],
        dateCreated: json["date_created"] == null
            ? null
            : DateTime.parse(json["date_created"]),
        dateModified: json["date_modified"] == null
            ? null
            : DateTime.parse(json["date_modified"]),
        acceptsProductReviewAbandonedCartEmails:
            json["accepts_product_review_abandoned_cart_emails"],
        storeCreditAmounts: json["store_credit_amounts"] == null
            ? null
            : List<StoreCreditAmount>.from(json["store_credit_amounts"]
                .map((x) => StoreCreditAmount.fromJson(x))),
        originChannelId: json["origin_channel_id"],
        channelIds: json["channel_ids"] == null
            ? null
            : List<int>.from(json["channel_ids"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "authentication":
            authentication == null ? null : authentication!.toJson(),
        "company": company,
        "customer_group_id": customerGroupId,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "notes": notes,
        "phone": phone,
        "registration_ip_address": registrationIpAddress,
        "tax_exempt_category": taxExemptCategory,
        "date_created":
            dateCreated == null ? null : dateCreated!.toIso8601String(),
        "date_modified":
            dateModified == null ? null : dateModified!.toIso8601String(),
        "accepts_product_review_abandoned_cart_emails":
            acceptsProductReviewAbandonedCartEmails,
        "store_credit_amounts": storeCreditAmounts == null
            ? null
            : List<dynamic>.from(storeCreditAmounts!.map((x) => x.toJson())),
        "origin_channel_id": originChannelId,
        "channel_ids": channelIds == null
            ? null
            : List<dynamic>.from(channelIds!.map((x) => x)),
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

class StoreCreditAmount {
  StoreCreditAmount({
    this.amount,
  });

  double? amount;

  factory StoreCreditAmount.fromJson(Map<String, dynamic> json) =>
      StoreCreditAmount(
        // ignore: prefer_null_aware_operators
        amount: json["amount"] == null ? null : json["amount"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
      };
}

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
}
