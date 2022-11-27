// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

import 'dart:convert';

ProductsModel productsModelFromJson(String str) =>
    ProductsModel.fromJson(json.decode(str));

String productsModelToJson(ProductsModel data) => json.encode(data.toJson());

class ProductsModel {
  ProductsModel({
    this.data,
  });

  Data? data;

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.site,
  });

  Site? site;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        site: Site.fromJson(json["site"]),
      );

  Map<String, dynamic> toJson() => {
        "site": site!.toJson(),
      };
}

class Site {
  Site({
    this.route,
  });

  Route? route;

  factory Site.fromJson(Map<String, dynamic> json) => Site(
        route: Route.fromJson(json["route"]),
      );

  Map<String, dynamic> toJson() => {
        "route": route!.toJson(),
      };
}

class Route {
  Route({
    this.node,
  });

  RouteNode? node;

  factory Route.fromJson(Map<String, dynamic> json) => Route(
        node: json["node"] != null ? RouteNode.fromJson(json["node"]):null,
      );

  Map<String, dynamic> toJson() => {
        "node": node!.toJson(),
      };
}

class RouteNode {
  RouteNode({
    this.id,
    this.name,
    this.entityId,
    this.description,
    this.products,
  });

  String? id;
  String? name;
  int? entityId;
  String? description;
  Products? products;

  factory RouteNode.fromJson(Map<String, dynamic> json) => RouteNode(
        id: json["id"],
        name: json["name"],
        entityId: json["entityId"],
        description: json["description"],
        products: Products.fromJson(json["products"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "entityId": entityId,
        "description": description,
        "products": products!.toJson(),
      };
}

class Products {
  Products({
    this.edges,
  });

  List<ProductsEdge>? edges;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        edges: List<ProductsEdge>.from(
            json["edges"].map((x) => ProductsEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "edges": List<dynamic>.from(edges!.map((x) => x.toJson())),
      };
}

class ProductsEdge {
  ProductsEdge({
    this.node,
  });

  PurpleNode? node;

  factory ProductsEdge.fromJson(Map<String, dynamic> json) => ProductsEdge(
        node: PurpleNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node!.toJson(),
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
        "prices": prices!.toJson(),
        "description": description,
        "images": images!.toJson(),
        "brand": brand,
        "productOptions": productOptions!.toJson(),
      };
}

class Images {
  Images({
    this.edges,
  });

  List<ImagesEdge>? edges;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        edges: List<ImagesEdge>.from(
            json["edges"].map((x) => ImagesEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "edges": List<dynamic>.from(edges!.map((x) => x.toJson())),
      };
}

class ImagesEdge {
  ImagesEdge({
    this.node,
  });

  FluffyNode? node;

  factory ImagesEdge.fromJson(Map<String, dynamic> json) => ImagesEdge(
        node: FluffyNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node!.toJson(),
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
        price: Price.fromJson(json["price"]),
      );

  Map<String, dynamic> toJson() => {
        "price": price!.toJson(),
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
        value: json["value"],
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
        edges: List<ProductOptionsEdge>.from(
            json["edges"].map((x) => ProductOptionsEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "edges": List<dynamic>.from(edges!.map((x) => x.toJson())),
      };
}

class ProductOptionsEdge {
  ProductOptionsEdge({
    this.node,
  });

  TentacledNode? node;

  factory ProductOptionsEdge.fromJson(Map<String, dynamic> json) =>
      ProductOptionsEdge(
        node: TentacledNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node!.toJson(),
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
  DisplayName? displayName;
  bool? isRequired;
  Values? values;

  factory TentacledNode.fromJson(Map<String, dynamic> json) => TentacledNode(
        entityId: json["entityId"],
        displayName: displayNameValues.map![json["displayName"]],
        isRequired: json["isRequired"],
        values: Values.fromJson(json["values"]),
      );

  Map<String, dynamic> toJson() => {
        "entityId": entityId,
        "displayName": displayNameValues.reverse[displayName],
        "isRequired": isRequired,
        "values": values!.toJson(),
      };
}

enum DisplayName { COLOR, SIZE }

final displayNameValues =
    EnumValues({"Color": DisplayName.COLOR, "Size": DisplayName.SIZE});

class Values {
  Values({
    this.edges,
  });

  List<ValuesEdge>? edges;

  factory Values.fromJson(Map<String, dynamic> json) => Values(
        edges: List<ValuesEdge>.from(
            json["edges"].map((x) => ValuesEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "edges": List<dynamic>.from(edges!.map((x) => x.toJson())),
      };
}

class ValuesEdge {
  ValuesEdge({
    this.node,
  });

  StickyNode? node;

  factory ValuesEdge.fromJson(Map<String, dynamic> json) => ValuesEdge(
        node: StickyNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node!.toJson(),
      };
}

class StickyNode {
  StickyNode({
    this.entityId,
    this.label,
  });

  int? entityId;
  String? label;

  factory StickyNode.fromJson(Map<String, dynamic> json) => StickyNode(
        entityId: json["entityId"],
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "entityId": entityId,
        "label": label,
      };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
