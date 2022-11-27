import 'dart:developer';

import 'package:mi_studio/app_controller.dart';
import 'package:mi_studio/constants/export.dart';
import 'package:mi_studio/models/base_model.dart';
import 'package:mi_studio/models/bottom_bar_item_model.dart';
import 'package:mi_studio/models/productWithHexColor.dart';
import 'package:mi_studio/models/product_variant_model.dart';
import 'package:mi_studio/network/network_services/big_commerece_graphQl/graph_ql_services.dart';
import 'package:mi_studio/network/network_services/big_commerece_http_apis/api_services.dart';
import 'package:mi_studio/screens/cart/controller/cart_controller.dart';

class ShopController extends GetxController {
  List<BottomBarItemModel> categoryList = [
    BottomBarItemModel(
        title: "best_sellers", imagePath: AppImages.outDoorImage),
    BottomBarItemModel(title: "dresses", imagePath: AppImages.dressesImage),
    BottomBarItemModel(title: "tops", imagePath: AppImages.topsImage),
    BottomBarItemModel(title: "jumpSuits", imagePath: AppImages.jumpSuitImage),
    BottomBarItemModel(title: "trousers", imagePath: AppImages.trouserImage),
    BottomBarItemModel(title: "skirts", imagePath: AppImages.skirtsImage),
    BottomBarItemModel(title: "out_doors", imagePath: AppImages.outDoorImage),
  ];
  ProductVariant? _productVariantData;

  ProductVariant? get productVariantData => _productVariantData;
  CartController cartController = Get.find<CartController>();

  List<int>? currentVariantQuantity;
  int? selectedQty = 0;
  List<ProductVariant> productVariantList = [];
  List<Map<String, dynamic>> variants = [];
  List<Map<String, dynamic>> addedItems = [];
  final getUserData = Get.find<AppController>();

  void updateIndex(int val, int index) {
    currentVariantQuantity![index] = val;
    selectedQty = val;
    update();
  }

  void updateQty(int val, int index) {
    selectedQty = val;
    update();
  }

  int qty = 0;

  resetProductVariantList() {
    // productVariantList = [];
    // productWithHexColorList = [];
    // currentVariantQuantity = [];
    // update();
  }
  List<int?> itemIds = [];
  addItemId(int id, int index) {
    if (!itemIds.contains(id)) {
      itemIds.insert(index, id);
      log("this is some thimg ${itemIds.elementAt(index)}");
    }
  }

  Future<void> getProductVariants(BuildContext context, String id,
      {int? index}) async {
    BaseModel<ProductVariant> response =
        await ApiServices().fetchProductVariants(context, id);
    _productVariantData = response.data!;

    // cartController.addProductVariant(index, response.data!);
    qty = 0;
    if (index != null) {
      productVariantList.add(response.data!);
      currentVariantQuantity!.add(qty);
      log("this is my list " + productVariantList.toList().toString());
      update();
    }
    currentVariantQuantity =
        List.generate(productVariantData!.data!.length, (index) => 0);
    if (index == null) {}
    update();
  }
  // generateItems(){
  //   currentVariantQuantity!.add(0);
  //   update();
  // }

  ProductWithHexColor? _productWithHexColor;

  ProductWithHexColor? get productWithHexColor => _productWithHexColor;

  List<ProductWithHexColor> productWithHexColorList = [];

  Future<void> productWithHexCode(
      BuildContext context, Map<String, dynamic> map,
      {int? index}) async {
    BaseModel<ProductWithHexColor> response =
        await GraphQlServices().fetchProductWithHexColor(context, map);
    _productWithHexColor = response.data;

    if (index != null) {
      productWithHexColorList.add(response.data!);
    }
    update();
  }

  addProductVariant(List<Map<String, dynamic>> map, int val, String productId) {
    addedItems.add(
        {"quantity": val, "product_id": productId, "option_selections": map});
    variants = map;
    qty = val;
    update();
    // }
  }

  emptyAddedItems() {
    addedItems = [];
    update();
  }
}
