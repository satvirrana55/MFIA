// To parse this JSON data, do
//
//     final recientviewModule = recientviewModuleFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<RecientviewModule> recientviewModuleFromJson(String str) =>
    List<RecientviewModule>.from(
        json.decode(str).map((x) => RecientviewModule.fromJson(x)));

String recientviewModuleToJson(List<RecientviewModule> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RecientviewModule {
  RecientviewModule({
    required this.edges,
    required this.cSymbol,
  });

  Edges edges;
  String cSymbol;

  factory RecientviewModule.fromJson(Map<String, dynamic> json) =>
      RecientviewModule(
        edges: Edges.fromJson(json["edges"]),
        cSymbol: json["c_symbol"],
      );

  Map<String, dynamic> toJson() => {
        // ignore: prefer_null_aware_operators
        "edges": edges == null ? null : edges.toJson(),
        "c_symbol": cSymbol,
      };
}

class Edges {
  Edges({
    required this.node,
  });

  EdgesNode node;

  factory Edges.fromJson(Map<String, dynamic> json) => Edges(
        node: EdgesNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node.toJson(),
      };
}

class EdgesNode {
  EdgesNode({
    required this.name,
    required this.sku,
    required this.entityId,
    required this.prices,
    required this.description,
    required this.images,
    required this.brand,
    required this.productOptions,
  });

  String name;
  String sku;
  int entityId;
  Prices prices;
  String description;
  Images images;
  dynamic brand;
  ProductOptions productOptions;

  factory EdgesNode.fromJson(Map<String, dynamic> json) => EdgesNode(
        name: json["name"],
        sku: json["sku"],
        entityId: json["entityId"],
        prices: Prices.fromJson(json["prices"]),
        description: json["description"],
        images: Images.fromJson(json["images"]),
        brand: json["brand"],
        productOptions: ProductOptions.fromJson(json["productOptions"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "sku": sku,
        "entityId": entityId,
        "prices": prices.toJson(),
        "description": description,
        "images": images.toJson(),
        "brand": brand,
        "productOptions": productOptions.toJson(),
      };
}

class Images {
  Images({
    required this.edges,
  });

  List<ImagesEdge> edges;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        edges: List<ImagesEdge>.from(
            json["edges"].map((x) => ImagesEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "edges": List<dynamic>.from(edges.map((x) => x.toJson())),
      };
}

class ImagesEdge {
  ImagesEdge({
    required this.node,
  });

  PurpleNode node;

  factory ImagesEdge.fromJson(Map<String, dynamic> json) => ImagesEdge(
        node: PurpleNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node.toJson(),
      };
}

class PurpleNode {
  PurpleNode({
    required this.url,
  });

  String url;

  factory PurpleNode.fromJson(Map<String, dynamic> json) => PurpleNode(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

class Prices {
  Prices({
    required this.price,
  });

  Price price;

  factory Prices.fromJson(Map<String, dynamic> json) => Prices(
        price: Price.fromJson(json["price"]),
      );

  Map<String, dynamic> toJson() => {
        "price": price.toJson(),
      };
}

class Price {
  Price({
    required this.value,
    required this.currencyCode,
  });

  double value;
  String currencyCode;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        value: json["value"].toDouble(),
        currencyCode: json["currencyCode"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "currencyCode": currencyCode,
      };
}

class ProductOptions {
  ProductOptions({
    required this.edges,
  });

  List<ProductOptionsEdge> edges;

  factory ProductOptions.fromJson(Map<String, dynamic> json) => ProductOptions(
        edges: List<ProductOptionsEdge>.from(
            json["edges"].map((x) => ProductOptionsEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "edges": List<dynamic>.from(edges.map((x) => x.toJson())),
      };
}

class ProductOptionsEdge {
  ProductOptionsEdge({
    required this.node,
  });

  FluffyNode node;

  factory ProductOptionsEdge.fromJson(Map<String, dynamic> json) =>
      ProductOptionsEdge(
        node: FluffyNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node.toJson(),
      };
}

class FluffyNode {
  FluffyNode({
    required this.entityId,
    required this.displayName,
    required this.isRequired,
    required this.values,
  });

  int entityId;
  String displayName;
  bool isRequired;
  Values values;

  factory FluffyNode.fromJson(Map<String, dynamic> json) => FluffyNode(
        entityId: json["entityId"],
        displayName: json["displayName"],
        isRequired: json["isRequired"],
        values: Values.fromJson(json["values"]),
      );

  Map<String, dynamic> toJson() => {
        "entityId": entityId,
        "displayName": displayName,
        "isRequired": isRequired,
        "values": values.toJson(),
      };
}

class Values {
  Values({
    required this.edges,
  });

  List<ValuesEdge> edges;

  factory Values.fromJson(Map<String, dynamic> json) => Values(
        edges: List<ValuesEdge>.from(
            json["edges"].map((x) => ValuesEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "edges": List<dynamic>.from(edges.map((x) => x.toJson())),
      };
}

class ValuesEdge {
  ValuesEdge({
    required this.node,
  });

  TentacledNode node;

  factory ValuesEdge.fromJson(Map<String, dynamic> json) => ValuesEdge(
        node: TentacledNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node.toJson(),
      };
}

class TentacledNode {
  TentacledNode({
    required this.entityId,
    required this.label,
  });

  int entityId;
  String label;

  factory TentacledNode.fromJson(Map<String, dynamic> json) => TentacledNode(
        entityId: json["entityId"],
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "entityId": entityId,
        "label": label,
      };
}
