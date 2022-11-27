// To parse this JSON data, do
//
//     final productVaraient = productVaraientFromJson(jsonString);

import 'dart:convert';

ProductVariant productVariantFromJson(String str) =>
    ProductVariant.fromJson(json.decode(str));

String productVariantToJson(ProductVariant data) => json.encode(data.toJson());

class ProductVariant {
  ProductVariant({
    this.data,
  });

  List<ProductVariantData>? data;

  factory ProductVariant.fromJson(Map<String, dynamic> json) => ProductVariant(
        data: json["data"] == null
            ? null
            : List<ProductVariantData>.from(
                json["data"].map((x) => ProductVariantData.fromJson(x))),
      );

  get site => null;

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ProductVariantData {
  ProductVariantData({
    this.id,
    this.productId,
    this.sku,
    this.skuId,
    this.price,
    this.calculatedPrice,
    this.salePrice,
    this.retailPrice,
    this.mapPrice,
    this.weight,
    this.calculatedWeight,
    this.width,
    this.height,
    this.depth,
    this.isFreeShipping,
    this.fixedCostShippingPrice,
    this.purchasingDisabled,
    this.purchasingDisabledMessage,
    this.imageUrl,
    this.costPrice,
    this.upc,
    this.mpn,
    this.gtin,
    this.inventoryLevel,
    this.inventoryWarningLevel,
    this.binPickingNumber,
    this.optionValues,
  });

  int? id;
  int? productId;
  String? sku;
  int? skuId;
  dynamic price;
  var calculatedPrice;
  dynamic salePrice;
  dynamic retailPrice;
  dynamic mapPrice;
  dynamic weight;
  double? calculatedWeight;
  dynamic width;
  dynamic height;
  dynamic depth;
  bool? isFreeShipping;
  dynamic fixedCostShippingPrice;
  bool? purchasingDisabled;
  String? purchasingDisabledMessage;
  String? imageUrl;
  int? costPrice;
  String? upc;
  String? mpn;
  String? gtin;
  int? inventoryLevel;
  int? inventoryWarningLevel;
  String? binPickingNumber;
  List<OptionValue>? optionValues;

  factory ProductVariantData.fromJson(Map<String, dynamic> json) =>
      ProductVariantData(
        id: json["id"],
        productId: json["product_id"],
        sku: json["sku"],
        skuId: json["sku_id"],
        price: json["price"],
        calculatedPrice: json["calculated_price"],
        salePrice: json["sale_price"],
        retailPrice: json["retail_price"],
        mapPrice: json["map_price"],
        weight: json["weight"],
        calculatedWeight: json["calculated_weight"] == null
            ? null
            : json["calculated_weight"].toDouble(),
        width: json["width"],
        height: json["height"],
        depth: json["depth"],
        isFreeShipping: json["is_free_shipping"],
        fixedCostShippingPrice: json["fixed_cost_shipping_price"],
        purchasingDisabled: json["purchasing_disabled"],
        purchasingDisabledMessage: json["purchasing_disabled_message"],
        imageUrl: json["image_url"],
        costPrice: json["cost_price"],
        upc: json["upc"],
        mpn: json["mpn"],
        gtin: json["gtin"],
        inventoryLevel: json["inventory_level"],
        inventoryWarningLevel: json["inventory_warning_level"],
        binPickingNumber: json["bin_picking_number"],
        optionValues: json["option_values"] == null
            ? null
            : List<OptionValue>.from(
                json["option_values"].map((x) => OptionValue.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "sku": sku,
        "sku_id": skuId,
        "price": price,
        "calculated_price": calculatedPrice,
        "sale_price": salePrice,
        "retail_price": retailPrice,
        "map_price": mapPrice,
        "weight": weight,
        "calculated_weight": calculatedWeight,
        "width": width,
        "height": height,
        "depth": depth,
        "is_free_shipping": isFreeShipping,
        "fixed_cost_shipping_price": fixedCostShippingPrice,
        "purchasing_disabled": purchasingDisabled,
        "purchasing_disabled_message": purchasingDisabledMessage,
        "image_url": imageUrl,
        "cost_price": costPrice,
        "upc": upc,
        "mpn": mpn,
        "gtin": gtin,
        "inventory_level": inventoryLevel,
        "inventory_warning_level": inventoryWarningLevel,
        "bin_picking_number": binPickingNumber,
        "option_values": optionValues == null
            ? null
            : List<dynamic>.from(optionValues!.map((x) => x.toJson())),
      };
}

class OptionValue {
  OptionValue({
    this.id,
    this.label,
    this.optionId,
    this.optionDisplayName,
  });

  int? id;
  String? label;
  int? optionId;
  String? optionDisplayName;

  factory OptionValue.fromJson(Map<String, dynamic> json) => OptionValue(
        id: json["id"],
        label: json["label"],
        optionId: json["option_id"],
        optionDisplayName: json["option_display_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
        "option_id": optionId,
        "option_display_name": optionDisplayName,
      };
}
