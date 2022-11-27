// To parse this JSON data, do
//
//     final searchResultModel = searchResultModelFromJson(jsonString);

import 'dart:convert';

import 'package:mi_studio/models/products_model.dart';

SearchResultModel searchResultModelFromJson(String str) =>
    SearchResultModel.fromJson(json.decode(str));

String searchResultModelToJson(SearchResultModel data) =>
    json.encode(data.toJson());

class SearchResultModel {
  SearchResultModel({
    this.data,
  });

  Data ? data;

  factory SearchResultModel.fromJson(Map<String, dynamic> json) => SearchResultModel(
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
    this.search,
  });

  Search? search;

  factory Site.fromJson(Map<String, dynamic> json) => Site(
        search: Search.fromJson(json["search"]),
      );

  Map<String, dynamic> toJson() => {
        "search": search!.toJson(),
      };
}

class Search {
  Search({
    this.searchProducts,
  });

  SearchProducts? searchProducts;

  factory Search.fromJson(Map<String, dynamic> json) => Search(
        searchProducts: SearchProducts.fromJson(json["searchProducts"]),
      );

  Map<String, dynamic> toJson() => {
        "searchProducts": searchProducts!.toJson(),
      };
}

class SearchProducts {
  SearchProducts({
    this.products,
  });

  Products? products;

  factory SearchProducts.fromJson(Map<String, dynamic> json) => SearchProducts(
        products: Products.fromJson(json["products"]),
      );

  Map<String, dynamic> toJson() => {
        "products": products!.toJson(),
      };
}

class Products {
  Products({
    this.edges,
  });

  List<ProductsEdge>? edges;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    edges: List<ProductsEdge>.from(json["edges"].map((x) => ProductsEdge.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "edges": List<dynamic>.from(edges!.map((x) => x.toJson())),
  };
}

