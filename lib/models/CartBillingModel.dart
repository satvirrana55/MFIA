import 'dart:convert';

CartBillingModel cartBillingModelFromJson(String str) => CartBillingModel.fromJson(json.decode(str));

String cartBillingModelToJson(CartBillingModel data) => json.encode(data.toJson());

class CartBillingModel {
  CartBillingModel({
    this.data,
  });

  Data ?data;


  factory CartBillingModel.fromJson(Map<String, dynamic> json) => CartBillingModel(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
   // "meta": meta!.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.cart,
    this.billingAddress,
    this.consignments,
    this.taxes,
    this.coupons,
    this.orderId,
    this.shippingCostTotalIncTax,
    this.shippingCostTotalExTax,
    this.handlingCostTotalIncTax,
    this.handlingCostTotalExTax,
    this.taxTotal,
    this.subtotalIncTax,
    this.subtotalExTax,
    this.grandTotal,
    this.createdTime,
    this.updatedTime,
    this.customerMessage,
  });

  String ?id;
  Cart ?cart;
  Address? billingAddress;
  List<Consignment>? consignments;
  List<Tax> ?taxes;
  List<dynamic>? coupons;
  dynamic orderId;
  int? shippingCostTotalIncTax;
  double ?shippingCostTotalExTax;
  int ? handlingCostTotalIncTax;
  int ?handlingCostTotalExTax;
  double? taxTotal;
  double ?subtotalIncTax;
  double ?subtotalExTax;
  double ?grandTotal;
  DateTime? createdTime;
  DateTime ?updatedTime;
  String? customerMessage;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    cart: Cart.fromJson(json["cart"]),
    billingAddress: Address.fromJson(json["billing_address"]),
    consignments: List<Consignment>.from(json["consignments"].map((x) => Consignment.fromJson(x))),
    taxes: List<Tax>.from(json["taxes"].map((x) => Tax.fromJson(x))),
    coupons: List<dynamic>.from(json["coupons"].map((x) => x)),
    orderId: json["order_id"],
    shippingCostTotalIncTax: json["shipping_cost_total_inc_tax"],
    shippingCostTotalExTax: json["shipping_cost_total_ex_tax"].toDouble(),
    handlingCostTotalIncTax: json["handling_cost_total_inc_tax"],
    handlingCostTotalExTax: json["handling_cost_total_ex_tax"],
    taxTotal: json["tax_total"].toDouble(),
    subtotalIncTax: json["subtotal_inc_tax"].toDouble(),
    subtotalExTax: json["subtotal_ex_tax"].toDouble(),
    grandTotal: json["grand_total"].toDouble(),
    createdTime: DateTime.parse(json["created_time"]),
    updatedTime: DateTime.parse(json["updated_time"]),
    customerMessage: json["customer_message"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cart": cart?.toJson(),
    "billing_address": billingAddress!.toJson(),
    "consignments": List<dynamic>.from(consignments!.map((x) => x.toJson())),
    "taxes": List<dynamic>.from(taxes!.map((x) => x.toJson())),
    "coupons": List<dynamic>.from(coupons!.map((x) => x)),
    "order_id": orderId,
    "shipping_cost_total_inc_tax": shippingCostTotalIncTax,
    "shipping_cost_total_ex_tax": shippingCostTotalExTax,
    "handling_cost_total_inc_tax": handlingCostTotalIncTax,
    "handling_cost_total_ex_tax": handlingCostTotalExTax,
    "tax_total": taxTotal,
    "subtotal_inc_tax": subtotalIncTax,
    "subtotal_ex_tax": subtotalExTax,
    "grand_total": grandTotal,
    "created_time": createdTime?.toIso8601String(),
    "updated_time": updatedTime?.toIso8601String(),
    "customer_message": customerMessage,
  };
}

class Address {
  Address({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.company,
    this.address1,
    this.address2,
    this.city,
    this.stateOrProvince,
    this.stateOrProvinceCode,
    this.country,
    this.countryCode,
    this.postalCode,
    this.phone,
    this.customFields,
  });

  String ?id;
  String ?firstName;
  String ?lastName;
  String ?email;
  String ?company;
  String ?address1;
  String ?address2;
  String ?city;
  String ?stateOrProvince;
  String ?stateOrProvinceCode;
  String ?country;
  String ?countryCode;
  String ?postalCode;
  String ?phone;
  List<dynamic>? customFields;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["id"] == null ? null : json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    company: json["company"],
    address1: json["address1"],
    address2: json["address2"],
    city: json["city"],
    stateOrProvince: json["state_or_province"],
    stateOrProvinceCode: json["state_or_province_code"],
    country: json["country"],
    countryCode: json["country_code"],
    postalCode: json["postal_code"],
    phone: json["phone"],
    customFields: List<dynamic>.from(json["custom_fields"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "company": company,
    "address1": address1,
    "address2": address2,
    "city": city,
    "state_or_province": stateOrProvince,
    "state_or_province_code": stateOrProvinceCode,
    "country": country,
    "country_code": countryCode,
    "postal_code": postalCode,
    "phone": phone,
    "custom_fields": List<dynamic>.from(customFields!.map((x) => x)),
  };
}

class Cart {
  Cart({
    this.id,
    this.customerId,
    this.channelId,
    this.email,
    this.currency,
    this.baseAmount,
    this.discountAmount,
    this.cartAmountIncTax,
    this.cartAmountExTax,
    this.coupons,
    this.discounts,
    this.lineItems,
    this.createdTime,
    this.updatedTime,
  });

  String ?id;
  int ?customerId;
  int? channelId;
  String ?email;
  Currency ?currency;
  double ?baseAmount;
  double? discountAmount;
  double ?cartAmountIncTax;
  double? cartAmountExTax;
  List<dynamic>? coupons;
  List<CartDiscount>? discounts;
  LineItems? lineItems;
  DateTime ?createdTime;
  DateTime? updatedTime;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    id: json["id"],
    customerId: json["customer_id"],
    channelId: json["channel_id"],
    email: json["email"],
    currency: Currency.fromJson(json["currency"]),
    baseAmount: json["base_amount"].toDouble(),
    discountAmount: json["discount_amount"].toDouble(),
    cartAmountIncTax: json["cart_amount_inc_tax"].toDouble(),
    cartAmountExTax: json["cart_amount_ex_tax"].toDouble(),
    coupons: List<dynamic>.from(json["coupons"].map((x) => x)),
    discounts: List<CartDiscount>.from(json["discounts"].map((x) => CartDiscount.fromJson(x))),
    lineItems: LineItems.fromJson(json["line_items"]),
    createdTime: DateTime.parse(json["created_time"]),
    updatedTime: DateTime.parse(json["updated_time"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "customer_id": customerId,
    "channel_id": channelId,
    "email": email,
    "currency": currency?.toJson(),
    "base_amount": baseAmount,
    "discount_amount": discountAmount,
    "cart_amount_inc_tax": cartAmountIncTax,
    "cart_amount_ex_tax": cartAmountExTax,
    "coupons": List<dynamic>.from(coupons!.map((x) => x)),
    "discounts": List<dynamic>.from(discounts!.map((x) => x.toJson())),
    "line_items": lineItems?.toJson(),
    "created_time": createdTime?.toIso8601String(),
    "updated_time": updatedTime?.toIso8601String(),
  };
}

class Currency {
  Currency({
    this.code,
  });

  String ?code;

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
  };
}

class CartDiscount {
  CartDiscount({
    this.id,
    this.discountedAmount,
  });

  String ?id;
  double ?discountedAmount;

  factory CartDiscount.fromJson(Map<String, dynamic> json) => CartDiscount(
    id: json["id"],
    discountedAmount: json["discounted_amount"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "discounted_amount": discountedAmount,
  };
}

class LineItems {
  LineItems({
    this.physicalItems,
    this.digitalItems,
    this.giftCertificates,
    this.customItems,
  });

  List<PhysicalItem> ?physicalItems;
  List<dynamic>? digitalItems;
  List<dynamic> ?giftCertificates;
  List<dynamic> ?customItems;

  factory LineItems.fromJson(Map<String, dynamic> json) => LineItems(
    physicalItems: List<PhysicalItem>.from(json["physical_items"].map((x) => PhysicalItem.fromJson(x))),
    digitalItems: List<dynamic>.from(json["digital_items"].map((x) => x)),
    giftCertificates: List<dynamic>.from(json["gift_certificates"].map((x) => x)),
    customItems: List<dynamic>.from(json["custom_items"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "physical_items": List<dynamic>.from(physicalItems!.map((x) => x.toJson())),
    "digital_items": List<dynamic>.from(digitalItems!.map((x) => x)),
    "gift_certificates": List<dynamic>.from(giftCertificates!.map((x) => x)),
    "custom_items": List<dynamic>.from(customItems!.map((x) => x)),
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
    this.isTaxable,
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
    this.giftWrapping,
    this.isMutable,
  });

  String ?id;
  dynamic ?parentId;
  int? variantId;
  int ?productId;
  String? sku;
  String ?name;
  String ?url;
  int ?quantity;
  bool ?isTaxable;
  String? imageUrl;
  List<PhysicalItemDiscount> ?discounts;
  List<dynamic>? coupons;
  int ?discountAmount;
  int ?couponAmount;
  double? listPrice;
  double ?salePrice;
  double ?extendedListPrice;
  double ?extendedSalePrice;
  bool ?isRequireShipping;
  dynamic? giftWrapping;
  bool ?isMutable;

  factory PhysicalItem.fromJson(Map<String, dynamic> json) => PhysicalItem(
    id: json["id"],
    parentId: json["parent_id"],
    variantId: json["variant_id"],
    productId: json["product_id"],
    sku: json["sku"],
    name: json["name"],
    url: json["url"],
    quantity: json["quantity"],
    isTaxable: json["is_taxable"],
    imageUrl: json["image_url"],
    discounts: List<PhysicalItemDiscount>.from(json["discounts"].map((x) => PhysicalItemDiscount.fromJson(x))),
    coupons: List<dynamic>.from(json["coupons"].map((x) => x)),
    discountAmount: json["discount_amount"],
    couponAmount: json["coupon_amount"],
    listPrice: json["list_price"].toDouble(),
    salePrice: json["sale_price"].toDouble(),
    extendedListPrice: json["extended_list_price"].toDouble(),
    extendedSalePrice: json["extended_sale_price"].toDouble(),
    isRequireShipping: json["is_require_shipping"],
    giftWrapping: json["gift_wrapping"],
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
    "is_taxable": isTaxable,
    "image_url": imageUrl,
    "discounts": List<dynamic>.from(discounts!.map((x) => x.toJson())),
    "coupons": List<dynamic>.from(coupons!.map((x) => x)),
    "discount_amount": discountAmount,
    "coupon_amount": couponAmount,
    "list_price": listPrice,
    "sale_price": salePrice,
    "extended_list_price": extendedListPrice,
    "extended_sale_price": extendedSalePrice,
    "is_require_shipping": isRequireShipping,
    "gift_wrapping": giftWrapping,
    "is_mutable": isMutable,
  };
}

class PhysicalItemDiscount {
  PhysicalItemDiscount({
    this.id,
    this.discountedAmount,
  });

  int ?id;
  double? discountedAmount;

  factory PhysicalItemDiscount.fromJson(Map<String, dynamic> json) => PhysicalItemDiscount(
    id: json["id"],
    discountedAmount: json["discounted_amount"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "discounted_amount": discountedAmount,
  };
}

class Consignment {
  Consignment({
    this.id,
    this.shippingCostIncTax,
    this.shippingCostExTax,
    this.handlingCostIncTax,
    this.handlingCostExTax,
    this.couponDiscounts,
    this.discounts,
    this.lineItemIds,
    this.selectedShippingOption,
    this.shippingAddress,
    this.address,
  });

  String ?id;
  int ?shippingCostIncTax;
  double? shippingCostExTax;
  int ?handlingCostIncTax;
  int ?handlingCostExTax;
  List<dynamic>? couponDiscounts;
  List<dynamic> ?discounts;
  List<String>? lineItemIds;
  SelectedShippingOption? selectedShippingOption;
  Address? shippingAddress;
  Address ?address;

  factory Consignment.fromJson(Map<String, dynamic> json) => Consignment(
    id: json["id"],
    shippingCostIncTax: json["shipping_cost_inc_tax"],
    shippingCostExTax: json["shipping_cost_ex_tax"].toDouble(),
    handlingCostIncTax: json["handling_cost_inc_tax"],
    handlingCostExTax: json["handling_cost_ex_tax"],
    couponDiscounts: List<dynamic>.from(json["coupon_discounts"].map((x) => x)),
    discounts: List<dynamic>.from(json["discounts"].map((x) => x)),
    lineItemIds: List<String>.from(json["line_item_ids"].map((x) => x)),
    selectedShippingOption: json["selected_shipping_option"]==null?null:SelectedShippingOption.fromJson(json["selected_shipping_option"]),
    shippingAddress: Address.fromJson(json["shipping_address"]),
    address: Address.fromJson(json["address"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "shipping_cost_inc_tax": shippingCostIncTax,
    "shipping_cost_ex_tax": shippingCostExTax,
    "handling_cost_inc_tax": handlingCostIncTax,
    "handling_cost_ex_tax": handlingCostExTax,
    "coupon_discounts": List<dynamic>.from(couponDiscounts!.map((x) => x)),
    "discounts": List<dynamic>.from(discounts!.map((x) => x)),
    "line_item_ids": List<dynamic>.from(lineItemIds!.map((x) => x)),
    "selected_shipping_option": selectedShippingOption?.toJson(),
    "shipping_address": shippingAddress?.toJson(),
    "address": address?.toJson(),
  };
}

class SelectedShippingOption {
  SelectedShippingOption({
    this.id,
    this.type,
    this.description,
    this.imageUrl,
    this.cost,
    this.transitTime,
    this.additionalDescription,
  });

  String? id;
  String ?type;
  String ?description;
  String ?imageUrl;
  int ?cost;
  String? transitTime;
  String ?additionalDescription;

  factory SelectedShippingOption.fromJson(Map<String, dynamic> json) => SelectedShippingOption(
    id: json["id"],
    type: json["type"],
    description: json["description"],
    imageUrl: json["image_url"],
    cost: json["cost"],
    transitTime: json["transit_time"],
    additionalDescription: json["additional_description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "description": description,
    "image_url": imageUrl,
    "cost": cost,
    "transit_time": transitTime,
    "additional_description": additionalDescription,
  };
}

class Tax {
  Tax({
    this.name,
    this.amount,
  });

  String ?name;
  double ?amount;

  factory Tax.fromJson(Map<String, dynamic> json) => Tax(
    name: json["name"],
    amount: json["amount"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "amount": amount,
  };
}

