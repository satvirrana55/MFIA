// To parse this JSON data, do
//
//     final cartDataModel = cartDataModelFromJson(jsonString);

import 'dart:convert';

CartDataModel cartDataModelFromJson(String str) => CartDataModel.fromJson(json.decode(str));

String cartDataModelToJson(CartDataModel data) => json.encode(data.toJson());

class CartDataModel {
  CartDataModel({
    this.data,
    this.meta,
  });

  Data ? data;
  Meta ? meta;

  factory CartDataModel.fromJson(Map<String, dynamic> json) => CartDataModel(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : data!.toJson(),
    "meta": meta == null ? null : meta!.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.customerId,
    this.channelId,
    this.email,
    this.currency,
    this.taxIncluded,
    this.baseAmount,
    this.discountAmount,
    this.cartAmount,
    this.coupons,
    this.lineItems,
    this.createdTime,
    this.updatedTime,
    this.locale,
    this.redirectUrls,
  });

  String ? id;
  int ? customerId;
  int ? channelId;
  String ? email;
  Currency ? currency;
  bool ? taxIncluded;
  double ? baseAmount;
  double ? discountAmount;
  double ? cartAmount;
  List<dynamic> ? coupons;
  LineItems ? lineItems;
  DateTime ? createdTime;
  DateTime ? updatedTime;
  String ? locale;
  RedirectUrls ? redirectUrls;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    customerId: json["customer_id"],
    channelId: json["channel_id"],
    email: json["email"],
    currency: json["currency"] == null ? null : Currency.fromJson(json["currency"]),
    taxIncluded: json["tax_included"],
    baseAmount: json["base_amount"] == null ? null : json["base_amount"].toDouble(),
    discountAmount: json["discount_amount"] == null ? null : json["discount_amount"].toDouble(),
    cartAmount: json["cart_amount"] == null ? null : json["cart_amount"].toDouble(),
    coupons: json["coupons"] == null ? null : List<dynamic>.from(json["coupons"].map((x) => x)),
    lineItems: json["line_items"] == null ? null : LineItems.fromJson(json["line_items"]),
    createdTime: json["created_time"] == null ? null : DateTime.parse(json["created_time"]),
    updatedTime: json["updated_time"] == null ? null : DateTime.parse(json["updated_time"]),
    locale: json["locale"],
    redirectUrls: json["redirect_urls"] == null ? null : RedirectUrls.fromJson(json["redirect_urls"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "customer_id": customerId,
    "channel_id": channelId,
    "email": email,
    "currency": currency == null ? null : currency!.toJson(),
    "tax_included": taxIncluded,
    "base_amount": baseAmount,
    "discount_amount": discountAmount,
    "cart_amount": cartAmount,
    "coupons": coupons == null ? null : List<dynamic>.from(coupons!.map((x) => x)),
    "line_items": lineItems == null ? null : lineItems!.toJson(),
    "created_time": createdTime == null ? null : createdTime!.toIso8601String(),
    "updated_time": updatedTime == null ? null : updatedTime!.toIso8601String(),
    "locale": locale,
    "redirect_urls": redirectUrls == null ? null : redirectUrls!.toJson(),
  };
}

class Currency {
  Currency({
    this.code,
  });

  String ? code;

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
  };
}

class LineItems {
  LineItems({
    this.physicalItems,
    this.digitalItems,
    this.giftCertificates,
    this.customItems,
  });

  List<PhysicalItem> ? physicalItems;
  List<dynamic> ? digitalItems;
  List<dynamic> ? giftCertificates;
  List<dynamic> ? customItems;

  factory LineItems.fromJson(Map<String, dynamic> json) => LineItems(
    physicalItems: json["physical_items"] == null ? null : List<PhysicalItem>.from(json["physical_items"].map((x) => PhysicalItem.fromJson(x))),
    digitalItems: json["digital_items"] == null ? null : List<dynamic>.from(json["digital_items"].map((x) => x)),
    giftCertificates: json["gift_certificates"] == null ? null : List<dynamic>.from(json["gift_certificates"].map((x) => x)),
    customItems: json["custom_items"] == null ? null : List<dynamic>.from(json["custom_items"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "physical_items": physicalItems == null ? null : List<dynamic>.from(physicalItems!.map((x) => x.toJson())),
    "digital_items": digitalItems == null ? null : List<dynamic>.from(digitalItems!.map((x) => x)),
    "gift_certificates": giftCertificates == null ? null : List<dynamic>.from(giftCertificates!.map((x) => x)),
    "custom_items": customItems == null ? null : List<dynamic>.from(customItems!.map((x) => x)),
  };
}

class PhysicalItem {
  PhysicalItem({
    this.id,
    this.parentId,
    this.variantId,
    this.productId,
    this.sku,
    this.name,
    this.url,
    this.quantity,
    this.taxable,
    this.imageUrl,
    this.discounts,
    this.coupons,
    this.discountAmount,
    this.couponAmount,
    this.listPrice,
    this.salePrice,
    this.extendedListPrice,
    this.extendedSalePrice,
    this.isRequireShipping,
    this.isMutable,
  });

  String ? id;
  dynamic  parentId;
  int ? variantId;
  int ? productId;
  String ? sku;
  String ? name;
  String ? url;
  int ? quantity;
  bool ? taxable;
  String ? imageUrl;
  List<Discount> ? discounts;
  List<dynamic> ? coupons;
  int ? discountAmount;
  int ? couponAmount;
  double ? listPrice;
  double ? salePrice;
  double ? extendedListPrice;
  double ? extendedSalePrice;
  bool ? isRequireShipping;
  bool ? isMutable;

  factory PhysicalItem.fromJson(Map<String, dynamic> json) => PhysicalItem(
    id: json["id"],
    parentId: json["parent_id"],
    variantId: json["variant_id"],
    productId: json["product_id"],
    sku: json["sku"],
    name: json["name"],
    url: json["url"],
    quantity: json["quantity"],
    taxable: json["taxable"],
    imageUrl: json["image_url"],
    discounts: json["discounts"] == null ? null : List<Discount>.from(json["discounts"].map((x) => Discount.fromJson(x))),
    coupons: json["coupons"] == null ? null : List<dynamic>.from(json["coupons"].map((x) => x)),
    discountAmount: json["discount_amount"],
    couponAmount: json["coupon_amount"],
    listPrice: json["list_price"] == null ? null : json["list_price"].toDouble(),
    salePrice: json["sale_price"] == null ? null : json["sale_price"].toDouble(),
    extendedListPrice: json["extended_list_price"] == null ? null : json["extended_list_price"].toDouble(),
    extendedSalePrice: json["extended_sale_price"] == null ? null : json["extended_sale_price"].toDouble(),
    isRequireShipping: json["is_require_shipping"],
    isMutable: json["is_mutable"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "parent_id": parentId,
    "variant_id": variantId,
    "product_id": productId,
    "sku": sku,
    "name": name,
    "url": url,
    "quantity": quantity,
    "taxable": taxable,
    "image_url": imageUrl,
    "discounts": discounts == null ? null : List<dynamic>.from(discounts!.map((x) => x.toJson())),
    "coupons": coupons == null ? null : List<dynamic>.from(coupons!.map((x) => x)),
    "discount_amount": discountAmount,
    "coupon_amount": couponAmount,
    "list_price": listPrice,
    "sale_price": salePrice,
    "extended_list_price": extendedListPrice,
    "extended_sale_price": extendedSalePrice,
    "is_require_shipping": isRequireShipping,
    "is_mutable": isMutable,
  };
}

class Discount {
  Discount({
    this.id,
    this.discountedAmount,
  });

  int ? id;
  double ? discountedAmount;

  factory Discount.fromJson(Map<String, dynamic> json) => Discount(
    id: json["id"],
    discountedAmount: json["discounted_amount"] == null ? null : json["discounted_amount"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "discounted_amount": discountedAmount,
  };
}

class RedirectUrls {
  RedirectUrls({
    this.cartUrl,
    this.checkoutUrl,
    this.embeddedCheckoutUrl,
  });

  String ? cartUrl;
  String ? checkoutUrl;
  String ? embeddedCheckoutUrl;

  factory RedirectUrls.fromJson(Map<String, dynamic> json) => RedirectUrls(
    cartUrl: json["cart_url"],
    checkoutUrl: json["checkout_url"],
    embeddedCheckoutUrl: json["embedded_checkout_url"],
  );

  Map<String, dynamic> toJson() => {
    "cart_url": cartUrl,
    "checkout_url": checkoutUrl,
    "embedded_checkout_url": embeddedCheckoutUrl,
  };
}

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
  );

  Map<String, dynamic> toJson() => {
  };
}