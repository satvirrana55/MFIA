// To parse this JSON data, do
//
//     final productWithHexColor = productWithHexColorFromJson(jsonString);

import 'dart:convert';

ProductWithHexColor productWithHexColorFromJson(String str) =>
    ProductWithHexColor.fromJson(json.decode(str));

String productWithHexColorToJson(ProductWithHexColor data) =>
    json.encode(data.toJson());

class ProductWithHexColor {
  ProductWithHexColor({
    this.data,
  });

  Data? data;

  factory ProductWithHexColor.fromJson(Map<String, dynamic> json) =>
      ProductWithHexColor(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? null : data!.toJson(),
      };
}

class Data {
  Data({
    this.site,
  });

  Site? site;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        site: json["site"] == null ? null : Site.fromJson(json["site"]),
      );

  Map<String, dynamic> toJson() => {
        "site": site == null ? null : site!.toJson(),
      };
}

class Site {
  Site({
    this.products,
  });

  Products? products;

  factory Site.fromJson(Map<String, dynamic> json) => Site(
        products: json["products"] == null
            ? null
            : Products.fromJson(json["products"]),
      );

  Map<String, dynamic> toJson() => {
        "products": products == null ? null : products!.toJson(),
      };
}

class Products {
  Products({
    this.edges,
  });

  List<ProductsEdge>? edges;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        edges: json["edges"] == null
            ? null
            : List<ProductsEdge>.from(
                json["edges"].map((x) => ProductsEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "edges": edges == null
            ? null
            : List<dynamic>.from(edges!.map((x) => x.toJson())),
      };
}

class ProductsEdge {
  ProductsEdge({
    this.node,
  });

  PurpleNode? node;

  factory ProductsEdge.fromJson(Map<String, dynamic> json) => ProductsEdge(
        node: json["node"] == null ? null : PurpleNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node == null ? null : node!.toJson(),
      };
}

class PurpleNode {
  PurpleNode({
    this.name,
    this.sku,
    this.entityId,
    this.prices,
    this.description,
    this.images,
    this.brand,
    this.productOptions,
  });

  String? name;
  String? sku;
  int? entityId;
  Prices? prices;
  String? description;
  Images? images;
  dynamic brand;
  ProductOptions? productOptions;

  factory PurpleNode.fromJson(Map<String, dynamic> json) => PurpleNode(
        name: json["name"],
        sku: json["sku"],
        entityId: json["entityId"],
        prices: json["prices"] == null ? null : Prices.fromJson(json["prices"]),
        description: json["description"],
        images: json["images"] == null ? null : Images.fromJson(json["images"]),
        brand: json["brand"],
        productOptions: json["productOptions"] == null
            ? null
            : ProductOptions.fromJson(json["productOptions"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "sku": sku,
        "entityId": entityId,
        "prices": prices == null ? null : prices!.toJson(),
        "description": description,
        "images": images == null ? null : images!.toJson(),
        "brand": brand,
        "productOptions":
            productOptions == null ? null : productOptions!.toJson(),
      };
}

class Images {
  Images({
    this.edges,
  });

  List<ImagesEdge>? edges;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        edges: json["edges"] == null
            ? null
            : List<ImagesEdge>.from(
                json["edges"].map((x) => ImagesEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "edges": edges == null
            ? null
            : List<dynamic>.from(edges!.map((x) => x.toJson())),
      };
}

class ImagesEdge {
  ImagesEdge({
    this.node,
  });

  FluffyNode? node;

  factory ImagesEdge.fromJson(Map<String, dynamic> json) => ImagesEdge(
        node: json["node"] == null ? null : FluffyNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node == null ? null : node!.toJson(),
      };
}

class FluffyNode {
  FluffyNode({
    this.url,
  });

  String? url;

  factory FluffyNode.fromJson(Map<String, dynamic> json) => FluffyNode(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

class Prices {
  Prices({
    this.price,
  });

  Price? price;

  factory Prices.fromJson(Map<String, dynamic> json) => Prices(
        price: json["price"] == null ? null : Price.fromJson(json["price"]),
      );

  Map<String, dynamic> toJson() => {
        "price": price == null ? null : price!.toJson(),
      };
}

class Price {
  Price({
    this.value,
    this.currencyCode,
  });

  double? value;
  String? currencyCode;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        value: json["value"] == null ? null : json["value"].toDouble(),
        currencyCode: json["currencyCode"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "currencyCode": currencyCode,
      };
}

class ProductOptions {
  ProductOptions({
    this.edges,
  });

  List<ProductOptionsEdge>? edges;

  factory ProductOptions.fromJson(Map<String, dynamic> json) => ProductOptions(
        edges: json["edges"] == null
            ? null
            : List<ProductOptionsEdge>.from(
                json["edges"].map((x) => ProductOptionsEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "edges": edges == null
            ? null
            : List<dynamic>.from(edges!.map((x) => x.toJson())),
      };
}

class ProductOptionsEdge {
  ProductOptionsEdge({
    this.node,
  });

  TentacledNode? node;

  factory ProductOptionsEdge.fromJson(Map<String, dynamic> json) =>
      ProductOptionsEdge(
        node:
            json["node"] == null ? null : TentacledNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node == null ? null : node!.toJson(),
      };
}

class TentacledNode {
  TentacledNode({
    this.entityId,
    this.displayName,
    this.isRequired,
    this.values,
  });

  int? entityId;
  String? displayName;
  bool? isRequired;
  Values? values;

  factory TentacledNode.fromJson(Map<String, dynamic> json) => TentacledNode(
        entityId: json["entityId"],
        displayName: json["displayName"],
        isRequired: json["isRequired"],
        values: json["values"] == null ? null : Values.fromJson(json["values"]),
      );

  Map<String, dynamic> toJson() => {
        "entityId": entityId,
        "displayName": displayName,
        "isRequired": isRequired,
        "values": values == null ? null : values!.toJson(),
      };
}

class Values {
  Values({
    this.edges,
  });

  List<ValuesEdge>? edges;

  factory Values.fromJson(Map<String, dynamic> json) => Values(
        edges: json["edges"] == null
            ? null
            : List<ValuesEdge>.from(
                json["edges"].map((x) => ValuesEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "edges": edges == null
            ? null
            : List<dynamic>.from(edges!.map((x) => x.toJson())),
      };
}

class ValuesEdge {
  ValuesEdge({
    this.node,
  });

  StickyNode? node;

  factory ValuesEdge.fromJson(Map<String, dynamic> json) => ValuesEdge(
        node: json["node"] == null ? null : StickyNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node == null ? null : node!.toJson(),
      };
}

class StickyNode {
  StickyNode({
    this.entityId,
    this.label,
    this.hexColors,
  });

  int? entityId;
  String? label;
  List<String>? hexColors;

  factory StickyNode.fromJson(Map<String, dynamic> json) => StickyNode(
        entityId: json["entityId"],
        label: json["label"],
        hexColors: json["hexColors"] == null
            ? null
            : List<String>.from(json["hexColors"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "entityId": entityId,
        "label": label,
        "hexColors": hexColors == null
            ? null
            : List<dynamic>.from(hexColors!.map((x) => x)),
      };
}
