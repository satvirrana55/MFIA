// To parse this JSON data, do
//
//     final ordersDataModel = ordersDataModelFromJson(jsonString);

import 'dart:convert';

List<OrdersDataModel> ordersDataModelFromJson(String str) => List<OrdersDataModel>.from(json.decode(str).map((x) => OrdersDataModel.fromJson(x)));

String ordersDataModelToJson(List<OrdersDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrdersDataModel {
  OrdersDataModel({
    this.id,
    this.customerId,
    this.dateCreated,
    this.dateModified,
    this.dateShipped,
    this.statusId,
    this.status,
    this.subtotalExTax,
    this.subtotalIncTax,
    this.subtotalTax,
    this.baseShippingCost,
    this.shippingCostExTax,
    this.shippingCostIncTax,
    this.shippingCostTax,
    this.shippingCostTaxClassId,
    this.baseHandlingCost,
    this.handlingCostExTax,
    this.handlingCostIncTax,
    this.handlingCostTax,
    this.handlingCostTaxClassId,
    this.baseWrappingCost,
    this.wrappingCostExTax,
    this.wrappingCostIncTax,
    this.wrappingCostTax,
    this.wrappingCostTaxClassId,
    this.totalExTax,
    this.totalIncTax,
    this.totalTax,
    this.itemsTotal,
    this.itemsShipped,
    this.paymentMethod,
    this.paymentProviderId,
    this.paymentStatus,
    this.refundedAmount,
    this.orderIsDigital,
    this.storeCreditAmount,
    this.giftCertificateAmount,
    this.ipAddress,
    this.ipAddressV6,
    this.geoipCountry,
    this.geoipCountryIso2,
    this.currencyId,
    this.currencyCode,
    this.currencyExchangeRate,
    this.defaultCurrencyId,
    this.defaultCurrencyCode,
    this.staffNotes,
    this.customerMessage,
    this.discountAmount,
    this.couponDiscount,
    this.shippingAddressCount,
    this.isDeleted,
    this.ebayOrderId,
    this.cartId,
    this.billingAddress,
    this.isEmailOptIn,
    this.creditCardType,
    this.orderSource,
    this.channelId,
    this.externalSource,
    this.products,
    this.shippingAddresses,
    this.coupons,
    this.externalId,
    this.externalMerchantId,
    this.taxProviderId,
    this.customerLocale,
    this.externalOrderId,
    this.storeDefaultCurrencyCode,
    this.storeDefaultToTransactionalExchangeRate,
    this.customStatus,
  });

  int ? id;
  int ? customerId;
  String ? dateCreated;
  String ? dateModified;
  String ? dateShipped;
  int ? statusId;
  String ? status;
  String ? subtotalExTax;
  String ? subtotalIncTax;
  String ? subtotalTax;
  String ? baseShippingCost;
  String ? shippingCostExTax;
  String ? shippingCostIncTax;
  String ? shippingCostTax;
  int ? shippingCostTaxClassId;
  String ? baseHandlingCost;
  String ? handlingCostExTax;
  String ? handlingCostIncTax;
  String ? handlingCostTax;
  int ? handlingCostTaxClassId;
  String ? baseWrappingCost;
  String ? wrappingCostExTax;
  String ? wrappingCostIncTax;
  String ? wrappingCostTax;
  int ? wrappingCostTaxClassId;
  String ? totalExTax;
  String ? totalIncTax;
  String ? totalTax;
  int ? itemsTotal;
  int ? itemsShipped;
  String ? paymentMethod;
  String ? paymentProviderId;
  String ? paymentStatus;
  String ? refundedAmount;
  bool ? orderIsDigital;
  String ? storeCreditAmount;
  String ? giftCertificateAmount;
  String ? ipAddress;
  String ? ipAddressV6;
  String ? geoipCountry;
  String ? geoipCountryIso2;
  int ? currencyId;
  String ? currencyCode;
  String ? currencyExchangeRate;
  int ? defaultCurrencyId;
  String ? defaultCurrencyCode;
  String ? staffNotes;
  String ? customerMessage;
  String ? discountAmount;
  String ? couponDiscount;
  int ? shippingAddressCount;
  bool ? isDeleted;
  String ? ebayOrderId;
  String ? cartId;
  BillingAddress ? billingAddress;
  bool ? isEmailOptIn;
  String ? creditCardType;
  String ?orderSource;
  int ? channelId;
  String ? externalSource;
  Coupons ?products;
  Coupons ?shippingAddresses;
  Coupons ?coupons;
  dynamic externalId;
  dynamic externalMerchantId;
  String ?taxProviderId;
  String ?customerLocale;
  String ?externalOrderId;
  String ?storeDefaultCurrencyCode;
  String ?storeDefaultToTransactionalExchangeRate;
  String ?customStatus;

  factory OrdersDataModel.fromJson(Map<String, dynamic> json) => OrdersDataModel(
    id: json["id"],
    customerId: json["customer_id"],
    dateCreated: json["date_created"],
    dateModified: json["date_modified"],
    dateShipped: json["date_shipped"],
    statusId: json["status_id"],
    status: json["status"],
    subtotalExTax: json["subtotal_ex_tax"],
    subtotalIncTax: json["subtotal_inc_tax"],
    subtotalTax: json["subtotal_tax"],
    baseShippingCost: json["base_shipping_cost"],
    shippingCostExTax: json["shipping_cost_ex_tax"],
    shippingCostIncTax: json["shipping_cost_inc_tax"],
    shippingCostTax: json["shipping_cost_tax"],
    shippingCostTaxClassId: json["shipping_cost_tax_class_id"],
    baseHandlingCost: json["base_handling_cost"],
    handlingCostExTax: json["handling_cost_ex_tax"],
    handlingCostIncTax: json["handling_cost_inc_tax"],
    handlingCostTax: json["handling_cost_tax"],
    handlingCostTaxClassId: json["handling_cost_tax_class_id"],
    baseWrappingCost: json["base_wrapping_cost"],
    wrappingCostExTax: json["wrapping_cost_ex_tax"],
    wrappingCostIncTax: json["wrapping_cost_inc_tax"],
    wrappingCostTax: json["wrapping_cost_tax"],
    wrappingCostTaxClassId: json["wrapping_cost_tax_class_id"],
    totalExTax: json["total_ex_tax"],
    totalIncTax: json["total_inc_tax"],
    totalTax: json["total_tax"],
    itemsTotal: json["items_total"],
    itemsShipped: json["items_shipped"],
    paymentMethod: json["payment_method"],
    paymentProviderId: json["payment_provider_id"],
    paymentStatus: json["payment_status"],
    refundedAmount: json["refunded_amount"],
    orderIsDigital: json["order_is_digital"],
    storeCreditAmount: json["store_credit_amount"],
    giftCertificateAmount: json["gift_certificate_amount"],
    ipAddress: json["ip_address"],
    ipAddressV6: json["ip_address_v6"],
    geoipCountry: json["geoip_country"],
    geoipCountryIso2: json["geoip_country_iso2"],
    currencyId: json["currency_id"],
    currencyCode: json["currency_code"],
    currencyExchangeRate: json["currency_exchange_rate"],
    defaultCurrencyId: json["default_currency_id"],
    defaultCurrencyCode: json["default_currency_code"],
    staffNotes: json["staff_notes"],
    customerMessage: json["customer_message"],
    discountAmount: json["discount_amount"],
    couponDiscount: json["coupon_discount"],
    shippingAddressCount: json["shipping_address_count"],
    isDeleted: json["is_deleted"],
    ebayOrderId: json["ebay_order_id"],
    cartId: json["cart_id"],
    billingAddress: json["billing_address"] == null ? null : BillingAddress.fromJson(json["billing_address"]),
    isEmailOptIn: json["is_email_opt_in"],
    creditCardType: json["credit_card_type"],
    orderSource: json["order_source"],
    channelId: json["channel_id"],
    externalSource: json["external_source"],
    products: json["products"] == null ? null : Coupons.fromJson(json["products"]),
    shippingAddresses: json["shipping_addresses"] == null ? null : Coupons.fromJson(json["shipping_addresses"]),
    coupons: json["coupons"] == null ? null : Coupons.fromJson(json["coupons"]),
    externalId: json["external_id"],
    externalMerchantId: json["external_merchant_id"],
    taxProviderId: json["tax_provider_id"],
    customerLocale: json["customer_locale"],
    externalOrderId: json["external_order_id"],
    storeDefaultCurrencyCode: json["store_default_currency_code"],
    storeDefaultToTransactionalExchangeRate: json["store_default_to_transactional_exchange_rate"],
    customStatus: json["custom_status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "customer_id": customerId,
    "date_created": dateCreated,
    "date_modified": dateModified,
    "date_shipped": dateShipped,
    "status_id": statusId,
    "status": status,
    "subtotal_ex_tax": subtotalExTax,
    "subtotal_inc_tax": subtotalIncTax,
    "subtotal_tax": subtotalTax,
    "base_shipping_cost": baseShippingCost,
    "shipping_cost_ex_tax": shippingCostExTax,
    "shipping_cost_inc_tax": shippingCostIncTax,
    "shipping_cost_tax": shippingCostTax,
    "shipping_cost_tax_class_id": shippingCostTaxClassId,
    "base_handling_cost": baseHandlingCost,
    "handling_cost_ex_tax": handlingCostExTax,
    "handling_cost_inc_tax": handlingCostIncTax,
    "handling_cost_tax": handlingCostTax,
    "handling_cost_tax_class_id": handlingCostTaxClassId,
    "base_wrapping_cost": baseWrappingCost,
    "wrapping_cost_ex_tax": wrappingCostExTax,
    "wrapping_cost_inc_tax": wrappingCostIncTax,
    "wrapping_cost_tax": wrappingCostTax,
    "wrapping_cost_tax_class_id": wrappingCostTaxClassId,
    "total_ex_tax": totalExTax,
    "total_inc_tax": totalIncTax,
    "total_tax": totalTax,
    "items_total": itemsTotal,
    "items_shipped": itemsShipped,
    "payment_method": paymentMethod,
    "payment_provider_id": paymentProviderId,
    "payment_status": paymentStatus,
    "refunded_amount": refundedAmount,
    "order_is_digital": orderIsDigital,
    "store_credit_amount": storeCreditAmount,
    "gift_certificate_amount": giftCertificateAmount,
    "ip_address": ipAddress,
    "ip_address_v6": ipAddressV6,
    "geoip_country": geoipCountry,
    "geoip_country_iso2": geoipCountryIso2,
    "currency_id": currencyId,
    "currency_code": currencyCode,
    "currency_exchange_rate": currencyExchangeRate,
    "default_currency_id": defaultCurrencyId,
    "default_currency_code": defaultCurrencyCode,
    "staff_notes": staffNotes,
    "customer_message": customerMessage,
    "discount_amount": discountAmount,
    "coupon_discount": couponDiscount,
    "shipping_address_count": shippingAddressCount,
    "is_deleted": isDeleted,
    "ebay_order_id": ebayOrderId,
    "cart_id": cartId,
    "billing_address": billingAddress == null ? null : billingAddress!.toJson(),
    "is_email_opt_in": isEmailOptIn,
    "credit_card_type": creditCardType,
    "order_source": orderSource,
    "channel_id": channelId,
    "external_source": externalSource,
    "products": products == null ? null : products!.toJson(),
    "shipping_addresses": shippingAddresses == null ? null : shippingAddresses!.toJson(),
    "coupons": coupons == null ? null : coupons!.toJson(),
    "external_id": externalId,
    "external_merchant_id": externalMerchantId,
    "tax_provider_id": taxProviderId,
    "customer_locale": customerLocale,
    "external_order_id": externalOrderId,
    "store_default_currency_code": storeDefaultCurrencyCode,
    "store_default_to_transactional_exchange_rate": storeDefaultToTransactionalExchangeRate,
    "custom_status": customStatus,
  };
}

class BillingAddress {
  BillingAddress({
    this.firstName,
    this.lastName,
    this.company,
    this.street1,
    this.street2,
    this.city,
    this.state,
    this.zip,
    this.country,
    this.countryIso2,
    this.phone,
    this.email,
    this.formFields,
  });

  String ? firstName;
  String ? lastName;
  String ? company;
  String ? street1;
  String ? street2;
  String ? city;
  String ? state;
  String ? zip;
  String ? country;
  String ? countryIso2;
  String ?phone;
  String ?email;
  List<dynamic> ? formFields;

  factory BillingAddress.fromJson(Map<String, dynamic> json) => BillingAddress(
    firstName: json["first_name"],
    lastName: json["last_name"],
    company: json["company"],
    street1: json["street_1"],
    street2: json["street_2"],
    city: json["city"],
    state: json["state"],
    zip: json["zip"],
    country: json["country"],
    countryIso2: json["country_iso2"],
    phone: json["phone"],
    email: json["email"],
    formFields: json["form_fields"] == null ? null : List<dynamic>.from(json["form_fields"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "company": company,
    "street_1": street1,
    "street_2": street2,
    "city": city,
    "state": state,
    "zip": zip,
    "country": country,
    "country_iso2": countryIso2,
    "phone": phone,
    "email": email,
    "form_fields": formFields == null ? null : List<dynamic>.from(formFields!.map((x) => x)),
  };
}

class Coupons {
  Coupons({
    this.url,
    this.resource,
  });

  String ? url;
  String ? resource;

  factory Coupons.fromJson(Map<String, dynamic> json) => Coupons(
    url: json["url"],
    resource: json["resource"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "resource": resource,
  };
}
