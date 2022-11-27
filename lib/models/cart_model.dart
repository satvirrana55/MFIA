// // To parse this JSON data, do
// //
// //     final cartModel = cartModelFromJson(jsonString);
//
// import 'dart:convert';
//
// CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));
//
// String cartModelToJson(CartModel data) => json.encode(data.toJson());
//
// class CartModel {
//   CartModel({
//     this.data,
//
//   });
//
//   CartData ? data;
//
//
//   factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
//     data: json["data"] == null ? null : CartData.fromJson(json["data"]),
//
//   );
//
//   Map<String, dynamic> toJson() => {
//     "data": data == null ? null : data!.toJson(),
//
//   };
// }
//
// class CartData {
//   CartData({
//     this.id,
//     this.customerId,
//     this.channelId,
//     this.email,
//     this.currency,
//     this.taxIncluded,
//     this.baseAmount,
//     this.discountAmount,
//     this.cartAmount,
//     this.coupons,
//     this.lineItems,
//     this.createdTime,
//     this.updatedTime,
//     this.locale,
//     this.redirectUrls,
//   });
//
//   String ? id;
//   int customerId;
//   int channelId;
//   String email;
//   Currency currency;
//   bool taxIncluded;
//   double baseAmount;
//   int discountAmount;
//   double cartAmount;
//   List<dynamic> coupons;
//   LineItems lineItems;
//   DateTime createdTime;
//   DateTime updatedTime;
//   String locale;
//   RedirectUrls redirectUrls;
//
//   factory CartData.fromJson(Map<String, dynamic> json) => CartData(
//     id: json["id"] == null ? null : json["id"],
//     customerId: json["customer_id"] == null ? null : json["customer_id"],
//     channelId: json["channel_id"] == null ? null : json["channel_id"],
//     email: json["email"] == null ? null : json["email"],
//     currency: json["currency"] == null ? null : Currency.fromJson(json["currency"]),
//     taxIncluded: json["tax_included"] == null ? null : json["tax_included"],
//     baseAmount: json["base_amount"] == null ? null : json["base_amount"].toDouble(),
//     discountAmount: json["discount_amount"] == null ? null : json["discount_amount"],
//     cartAmount: json["cart_amount"] == null ? null : json["cart_amount"].toDouble(),
//     coupons: json["coupons"] == null ? null : List<dynamic>.from(json["coupons"].map((x) => x)),
//     lineItems: json["line_items"] == null ? null : LineItems.fromJson(json["line_items"]),
//     createdTime: json["created_time"] == null ? null : DateTime.parse(json["created_time"]),
//     updatedTime: json["updated_time"] == null ? null : DateTime.parse(json["updated_time"]),
//     locale: json["locale"] == null ? null : json["locale"],
//     redirectUrls: json["redirect_urls"] == null ? null : RedirectUrls.fromJson(json["redirect_urls"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id == null ? null : id,
//     "customer_id": customerId == null ? null : customerId,
//     "channel_id": channelId == null ? null : channelId,
//     "email": email == null ? null : email,
//     "currency": currency == null ? null : currency.toJson(),
//     "tax_included": taxIncluded == null ? null : taxIncluded,
//     "base_amount": baseAmount == null ? null : baseAmount,
//     "discount_amount": discountAmount == null ? null : discountAmount,
//     "cart_amount": cartAmount == null ? null : cartAmount,
//     "coupons": coupons == null ? null : List<dynamic>.from(coupons.map((x) => x)),
//     "line_items": lineItems == null ? null : lineItems.toJson(),
//     "created_time": createdTime == null ? null : createdTime.toIso8601String(),
//     "updated_time": updatedTime == null ? null : updatedTime.toIso8601String(),
//     "locale": locale == null ? null : locale,
//     "redirect_urls": redirectUrls == null ? null : redirectUrls.toJson(),
//   };
// }
//
// class Currency {
//   Currency({
//     this.code,
//   });
//
//   String code;
//
//   factory Currency.fromJson(Map<String, dynamic> json) => Currency(
//     code: json["code"] == null ? null : json["code"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "code": code == null ? null : code,
//   };
// }
//
// class LineItems {
//   LineItems({
//     this.physicalItems,
//     this.digitalItems,
//     this.giftCertificates,
//     this.customItems,
//   });
//
//   List<PhysicalItem> physicalItems;
//   List<dynamic> digitalItems;
//   List<dynamic> giftCertificates;
//   List<dynamic> customItems;
//
//   factory LineItems.fromJson(Map<String, dynamic> json) => LineItems(
//     physicalItems: json["physical_items"] == null ? null : List<PhysicalItem>.from(json["physical_items"].map((x) => PhysicalItem.fromJson(x))),
//     digitalItems: json["digital_items"] == null ? null : List<dynamic>.from(json["digital_items"].map((x) => x)),
//     giftCertificates: json["gift_certificates"] == null ? null : List<dynamic>.from(json["gift_certificates"].map((x) => x)),
//     customItems: json["custom_items"] == null ? null : List<dynamic>.from(json["custom_items"].map((x) => x)),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "physical_items": physicalItems == null ? null : List<dynamic>.from(physicalItems.map((x) => x.toJson())),
//     "digital_items": digitalItems == null ? null : List<dynamic>.from(digitalItems.map((x) => x)),
//     "gift_certificates": giftCertificates == null ? null : List<dynamic>.from(giftCertificates.map((x) => x)),
//     "custom_items": customItems == null ? null : List<dynamic>.from(customItems.map((x) => x)),
//   };
// }
//
// class PhysicalItem {
//   PhysicalItem({
//     this.id,
//     this.parentId,
//     this.variantId,
//     this.productId,
//     this.sku,
//     this.name,
//     this.url,
//     this.quantity,
//     this.taxable,
//     this.imageUrl,
//     this.discounts,
//     this.coupons,
//     this.discountAmount,
//     this.couponAmount,
//     this.listPrice,
//     this.salePrice,
//     this.extendedListPrice,
//     this.extendedSalePrice,
//     this.isRequireShipping,
//     this.isMutable,
//   });
//
//   String id;
//   dynamic parentId;
//   int variantId;
//   int productId;
//   String sku;
//   String name;
//   String url;
//   int quantity;
//   bool taxable;
//   String imageUrl;
//   List<dynamic> discounts;
//   List<dynamic> coupons;
//   int discountAmount;
//   int couponAmount;
//   double listPrice;
//   double salePrice;
//   double extendedListPrice;
//   double extendedSalePrice;
//   bool isRequireShipping;
//   bool isMutable;
//
//   factory PhysicalItem.fromJson(Map<String, dynamic> json) => PhysicalItem(
//     id: json["id"] == null ? null : json["id"],
//     parentId: json["parent_id"],
//     variantId: json["variant_id"] == null ? null : json["variant_id"],
//     productId: json["product_id"] == null ? null : json["product_id"],
//     sku: json["sku"] == null ? null : json["sku"],
//     name: json["name"] == null ? null : json["name"],
//     url: json["url"] == null ? null : json["url"],
//     quantity: json["quantity"] == null ? null : json["quantity"],
//     taxable: json["taxable"] == null ? null : json["taxable"],
//     imageUrl: json["image_url"] == null ? null : json["image_url"],
//     discounts: json["discounts"] == null ? null : List<dynamic>.from(json["discounts"].map((x) => x)),
//     coupons: json["coupons"] == null ? null : List<dynamic>.from(json["coupons"].map((x) => x)),
//     discountAmount: json["discount_amount"] == null ? null : json["discount_amount"],
//     couponAmount: json["coupon_amount"] == null ? null : json["coupon_amount"],
//     listPrice: json["list_price"] == null ? null : json["list_price"].toDouble(),
//     salePrice: json["sale_price"] == null ? null : json["sale_price"].toDouble(),
//     extendedListPrice: json["extended_list_price"] == null ? null : json["extended_list_price"].toDouble(),
//     extendedSalePrice: json["extended_sale_price"] == null ? null : json["extended_sale_price"].toDouble(),
//     isRequireShipping: json["is_require_shipping"] == null ? null : json["is_require_shipping"],
//     isMutable: json["is_mutable"] == null ? null : json["is_mutable"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id == null ? null : id,
//     "parent_id": parentId,
//     "variant_id": variantId == null ? null : variantId,
//     "product_id": productId == null ? null : productId,
//     "sku": sku == null ? null : sku,
//     "name": name == null ? null : name,
//     "url": url == null ? null : url,
//     "quantity": quantity == null ? null : quantity,
//     "taxable": taxable == null ? null : taxable,
//     "image_url": imageUrl == null ? null : imageUrl,
//     "discounts": discounts == null ? null : List<dynamic>.from(discounts.map((x) => x)),
//     "coupons": coupons == null ? null : List<dynamic>.from(coupons.map((x) => x)),
//     "discount_amount": discountAmount == null ? null : discountAmount,
//     "coupon_amount": couponAmount == null ? null : couponAmount,
//     "list_price": listPrice == null ? null : listPrice,
//     "sale_price": salePrice == null ? null : salePrice,
//     "extended_list_price": extendedListPrice == null ? null : extendedListPrice,
//     "extended_sale_price": extendedSalePrice == null ? null : extendedSalePrice,
//     "is_require_shipping": isRequireShipping == null ? null : isRequireShipping,
//     "is_mutable": isMutable == null ? null : isMutable,
//   };
// }
//
// class RedirectUrls {
//   RedirectUrls({
//     this.cartUrl,
//     this.checkoutUrl,
//     this.embeddedCheckoutUrl,
//   });
//
//   String cartUrl;
//   String checkoutUrl;
//   String embeddedCheckoutUrl;
//
//   factory RedirectUrls.fromJson(Map<String, dynamic> json) => RedirectUrls(
//     cartUrl: json["cart_url"] == null ? null : json["cart_url"],
//     checkoutUrl: json["checkout_url"] == null ? null : json["checkout_url"],
//     embeddedCheckoutUrl: json["embedded_checkout_url"] == null ? null : json["embedded_checkout_url"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "cart_url": cartUrl == null ? null : cartUrl,
//     "checkout_url": checkoutUrl == null ? null : checkoutUrl,
//     "embedded_checkout_url": embeddedCheckoutUrl == null ? null : embeddedCheckoutUrl,
//   };
// }
//
//
