// To parse this JSON data, do
//
//     final orderDetailsModel = orderDetailsModelFromJson(jsonString);

import 'dart:convert';

List<OrderDetailsModel> orderDetailsModelFromJson(String str) =>
    List<OrderDetailsModel>.from(
        json.decode(str).map((x) => OrderDetailsModel.fromJson(x)));

String orderDetailsModelToJson(List<OrderDetailsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderDetailsModel {
  OrderDetailsModel({
    this.id,
    this.orderId,
    this.productId,
    this.variantId,
    this.orderAddressId,
    this.name,
    this.nameCustomer,
    this.nameMerchant,
    this.sku,
    this.upc,
    this.type,
    this.basePrice,
    this.priceExTax,
    this.priceIncTax,
    this.priceTax,
    this.baseTotal,
    this.totalExTax,
    this.totalIncTax,
    this.totalTax,
    this.weight,
    this.width,
    this.height,
    this.depth,
    this.quantity,
    this.baseCostPrice,
    this.costPriceIncTax,
    this.costPriceExTax,
    this.costPriceTax,
    this.isRefunded,
    this.quantityRefunded,
    this.refundAmount,
    this.returnId,
    this.wrappingName,
    this.baseWrappingCost,
    this.wrappingCostExTax,
    this.wrappingCostIncTax,
    this.wrappingCostTax,
    this.wrappingMessage,
    this.quantityShipped,
    this.eventName,
    this.eventDate,
    this.fixedShippingCost,
    this.ebayItemId,
    this.ebayTransactionId,
    this.optionSetId,
    this.parentOrderProductId,
    this.isBundledProduct,
    this.binPickingNumber,
    this.externalId,
    this.fulfillmentSource,
    this.appliedDiscounts,
    this.productOptions,
    this.configurableFields,
  });

  int? id;
  int? orderId;
  int? productId;
  int? variantId;
  int? orderAddressId;
  String? name;
  String? nameCustomer;
  String? nameMerchant;
  String? sku;
  String? upc;
  String? type;
  String? basePrice;
  String? priceExTax;
  String? priceIncTax;
  String? priceTax;
  String? baseTotal;
  String? totalExTax;
  String? totalIncTax;
  String? totalTax;
  String? weight;
  String? width;
  String? height;
  String? depth;
  int? quantity;
  String? baseCostPrice;
  String? costPriceIncTax;
  String? costPriceExTax;
  String? costPriceTax;
  bool? isRefunded;
  int? quantityRefunded;
  String? refundAmount;
  int? returnId;
  String? wrappingName;
  String? baseWrappingCost;
  String? wrappingCostExTax;
  String? wrappingCostIncTax;
  String? wrappingCostTax;
  String? wrappingMessage;
  int? quantityShipped;
  dynamic eventName;
  String? eventDate;
  String? fixedShippingCost;
  String? ebayItemId;
  String? ebayTransactionId;
  dynamic optionSetId;
  dynamic parentOrderProductId;
  bool? isBundledProduct;
  String? binPickingNumber;
  dynamic externalId;
  String? fulfillmentSource;
  List<dynamic>? appliedDiscounts;
  List<ProductOption>? productOptions;
  List<dynamic>? configurableFields;

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailsModel(
        id: json["id"],
        orderId: json["order_id"],
        productId: json["product_id"],
        variantId: json["variant_id"],
        orderAddressId: json["order_address_id"],
        name: json["name"],
        nameCustomer: json["name_customer"],
        nameMerchant: json["name_merchant"],
        sku: json["sku"],
        upc: json["upc"],
        type: json["type"],
        basePrice: json["base_price"],
        priceExTax: json["price_ex_tax"],
        priceIncTax: json["price_inc_tax"],
        priceTax: json["price_tax"],
        baseTotal: json["base_total"],
        totalExTax: json["total_ex_tax"],
        totalIncTax: json["total_inc_tax"],
        totalTax: json["total_tax"],
        weight: json["weight"],
        width: json["width"],
        height: json["height"],
        depth: json["depth"],
        quantity: json["quantity"],
        baseCostPrice: json["base_cost_price"],
        costPriceIncTax: json["cost_price_inc_tax"],
        costPriceExTax: json["cost_price_ex_tax"],
        costPriceTax: json["cost_price_tax"],
        isRefunded: json["is_refunded"],
        quantityRefunded: json["quantity_refunded"],
        refundAmount: json["refund_amount"],
        returnId: json["return_id"],
        wrappingName: json["wrapping_name"],
        baseWrappingCost: json["base_wrapping_cost"],
        wrappingCostExTax: json["wrapping_cost_ex_tax"],
        wrappingCostIncTax: json["wrapping_cost_inc_tax"],
        wrappingCostTax: json["wrapping_cost_tax"],
        wrappingMessage: json["wrapping_message"],
        quantityShipped: json["quantity_shipped"],
        eventName: json["event_name"],
        eventDate: json["event_date"],
        fixedShippingCost: json["fixed_shipping_cost"],
        ebayItemId: json["ebay_item_id"],
        ebayTransactionId: json["ebay_transaction_id"],
        optionSetId: json["option_set_id"],
        parentOrderProductId: json["parent_order_product_id"],
        isBundledProduct: json["is_bundled_product"],
        binPickingNumber: json["bin_picking_number"],
        externalId: json["external_id"],
        fulfillmentSource: json["fulfillment_source"],
        appliedDiscounts: json["applied_discounts"] == null
            ? null
            : List<dynamic>.from(json["applied_discounts"].map((x) => x)),
        productOptions: json["product_options"] == null
            ? null
            : List<ProductOption>.from(
                json["product_options"].map((x) => ProductOption.fromJson(x))),
        configurableFields: json["configurable_fields"] == null
            ? null
            : List<dynamic>.from(json["configurable_fields"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "product_id": productId,
        "variant_id": variantId,
        "order_address_id": orderAddressId,
        "name": name,
        "name_customer": nameCustomer,
        "name_merchant": nameMerchant,
        "sku": sku,
        "upc": upc,
        "type": type,
        "base_price": basePrice,
        "price_ex_tax": priceExTax,
        "price_inc_tax": priceIncTax,
        "price_tax": priceTax,
        "base_total": baseTotal,
        "total_ex_tax": totalExTax,
        "total_inc_tax": totalIncTax,
        "total_tax": totalTax,
        "weight": weight,
        "width": width,
        "height": height,
        "depth": depth,
        "quantity": quantity,
        "base_cost_price": baseCostPrice,
        "cost_price_inc_tax": costPriceIncTax,
        "cost_price_ex_tax": costPriceExTax,
        "cost_price_tax": costPriceTax,
        "is_refunded": isRefunded,
        "quantity_refunded": quantityRefunded,
        "refund_amount": refundAmount,
        "return_id": returnId,
        "wrapping_name": wrappingName,
        "base_wrapping_cost": baseWrappingCost,
        "wrapping_cost_ex_tax": wrappingCostExTax,
        "wrapping_cost_inc_tax": wrappingCostIncTax,
        "wrapping_cost_tax": wrappingCostTax,
        "wrapping_message": wrappingMessage,
        "quantity_shipped": quantityShipped,
        "event_name": eventName,
        "event_date": eventDate,
        "fixed_shipping_cost": fixedShippingCost,
        "ebay_item_id": ebayItemId,
        "ebay_transaction_id": ebayTransactionId,
        "option_set_id": optionSetId,
        "parent_order_product_id": parentOrderProductId,
        "is_bundled_product": isBundledProduct,
        "bin_picking_number": binPickingNumber,
        "external_id": externalId,
        "fulfillment_source": fulfillmentSource,
        "applied_discounts": appliedDiscounts == null
            ? null
            : List<dynamic>.from(appliedDiscounts!.map((x) => x)),
        "product_options": productOptions == null
            ? null
            : List<dynamic>.from(productOptions!.map((x) => x.toJson())),
        "configurable_fields": configurableFields == null
            ? null
            : List<dynamic>.from(configurableFields!.map((x) => x)),
      };
}

class ProductOption {
  ProductOption({
    this.id,
    this.optionId,
    this.orderProductId,
    this.productOptionId,
    this.displayName,
    this.displayNameCustomer,
    this.displayNameMerchant,
    this.displayValue,
    this.displayValueCustomer,
    this.displayValueMerchant,
    this.value,
    this.type,
    this.name,
    this.displayStyle,
  });

  int? id;
  int? optionId;
  int? orderProductId;
  int? productOptionId;
  String? displayName;
  String? displayNameCustomer;
  String? displayNameMerchant;
  String? displayValue;
  String? displayValueCustomer;
  String? displayValueMerchant;
  String? value;
  String? type;
  String? name;
  String? displayStyle;

  factory ProductOption.fromJson(Map<String, dynamic> json) => ProductOption(
        id: json["id"],
        optionId: json["option_id"],
        orderProductId: json["order_product_id"],
        productOptionId: json["product_option_id"],
        displayName: json["display_name"],
        displayNameCustomer: json["display_name_customer"],
        displayNameMerchant: json["display_name_merchant"],
        displayValue: json["display_value"],
        displayValueCustomer: json["display_value_customer"],
        displayValueMerchant: json["display_value_merchant"],
        value: json["value"],
        type: json["type"],
        name: json["name"],
        displayStyle: json["display_style"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "option_id": optionId,
        "order_product_id": orderProductId,
        "product_option_id": productOptionId,
        "display_name": displayName,
        "display_name_customer": displayNameCustomer,
        "display_name_merchant": displayNameMerchant,
        "display_value": displayValue,
        "display_value_customer": displayValueCustomer,
        "display_value_merchant": displayValueMerchant,
        "value": value,
        "type": type,
        "name": name,
        "display_style": displayStyle,
      };
}
