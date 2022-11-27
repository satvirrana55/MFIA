import 'dart:developer';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mi_studio/constants/export.dart';
import 'package:mi_studio/main.dart';
import 'package:mi_studio/screens/cart/controller/cart_controller.dart';
import 'package:mi_studio/screens/shop/component/product_detail_listview.dart';
import 'package:mi_studio/screens/shop/controller/shop_controller.dart';
import 'package:mi_studio/widgets/custom_webview.dart';
import 'package:mi_studio/widgets/loader_dialog.dart';

import '../../constants/prefs_key.dart';
import '../../network/network_services/big_commerece_http_apis/api_services.dart';
import '../home/home_controller.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final HomeController _homeController = Get.put(HomeController());
  final CartController _cartController = Get.put(CartController());
  final ShopController _shopController = Get.put(ShopController());

  deleteItem(
      BuildContext context, String? itemId, int length, int index) async {
    LoaderDialog.showLoadingDialog(context);
    ApiServices()
        .deleteItemsInCart(context, itemId!,
            preferences!.getString(PrefsKey.cartId).toString())
        .then((value) {
      if (value.data!.response.statusCode! == 204 ||
          value.data!.response.statusCode! == 200) {
        if (length == 1) {
          log("this wat we are doing <><><>");
          preferences!.setBool(PrefsKey.isFirstCart, true);
          preferences!.remove(PrefsKey.cartId);
        }
        _cartController.removeProducts(index, context);
        // _cartController.fetchProducts(context);

        // Get.to(const BottomNavigationScreen());
      }
      Get.back();
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (preferences!.getString(PrefsKey.cartId) == null) {
        _cartController.fetchProducts(context);
      }
      _shopController.resetProductVariantList();
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CartScreen oldWidget) {
    log("this is my screen 2");
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (controller) {
      return Scaffold(
        bottomNavigationBar: _cartController.cartDetails != null &&
                _cartController
                    .cartDetails!.data!.lineItems!.physicalItems!.isNotEmpty
            ? SizedBox(
                width: 1.sw,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: CustomButton(
                        title: "checkout".tr,
                        callback: () {
                          ApiServices()
                              .getCartInfo(
                                  preferences!
                                      .getString(PrefsKey.cartId)
                                      .toString(),
                                  context)
                              .then((value) {
                            log(value.data!.toJson().toString());
                            if (value.data != null) {
                              Get.to(() => CustomWebView(
                                  urlRequest: URLRequest(
                                      url: Uri.parse(value.data!.data!
                                          .redirectUrls!.checkoutUrl!))));
                            }
                          });
                          // updateProduct(
                          //     context,
                          //     getProductDetails?.lineItemOptions
                          //         ?.lineItem![index].id,
                          //     getProductDetails?.lineItemOptions
                          //             ?.lineItem![index].productId ??
                          //         0);
                        }),
                  ),
                ))
            : const SizedBox(height: 1, width: 1),
        appBar: HelperUtility.commonAppBar(
            title: "app_bar_cart".tr, isbottomTab: false),
        body: body(),
      );
    });
  }

  Widget body() {
    log("Rebuild 123");
    return GetBuilder<CartController>(builder: (controller) {
      return SafeArea(
          child: controller.cartDetails != null
              ? controller
                      .cartDetails!.data!.lineItems!.physicalItems!.isNotEmpty
                  ? ListView.builder(
                      itemCount: controller
                          .cartDetails!.data!.lineItems!.physicalItems!.length,
                      itemBuilder: (context, index) {
                        var selectedItem = controller.cartDetails!.data!
                            .lineItems!.physicalItems![index];
                        return Container(
                            width: 1.sw,
                            padding: EdgeInsets.symmetric(horizontal: 25.sp),
                            decoration: BoxDecoration(
                                color: ColorConstants.whiteColor,
                                border: Border(
                                  bottom: BorderSide(
                                      width: 2,
                                      color: ColorConstants.greyColor),
                                  top: BorderSide(
                                      width: 2,
                                      color: ColorConstants.greyColor),
                                )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20.sp,
                                ),
                                HelperUtility.customText(
                                    title: "update_your_cart".tr,
                                    color: ColorConstants.blackColor,
                                    fontSize: 16.sp,
                                    textAlign: TextAlign.left,
                                    fontWeight: FontWeight.w500),
                                SizedBox(
                                  height: 16.sp,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 100.sp,
                                      width: 77.sp,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(selectedItem
                                                  .imageUrl
                                                  .toString()))),
                                    ),
                                    SizedBox(
                                      width: 12.sp,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          HelperUtility.customText(
                                              title:
                                                  selectedItem.name!.toString(),
                                              color: ColorConstants.blackColor,
                                              fontSize: 13.sp,
                                              textAlign: TextAlign.left,
                                              fontWeight: FontWeight.w500),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 16.sp,
                                ),
                                Features(
                                    productOptions: _homeController
                                        .bestSeller!
                                        .data!
                                        .site!
                                        .route!
                                        .node!
                                        .products!
                                        .edges!
                                        .first
                                        .node!
                                        .productOptions!,
                                    isFromCart: true,
                                    index: index,
                                    id: selectedItem.productId.toString(),
                                    variantId: selectedItem.variantId,
                                    qty: selectedItem.quantity),
                                SizedBox(
                                  height: 24.sp,
                                ),
                                CustomButton(
                                    title: "update_button_cart".tr,
                                    callback: () {
                                      controller.updateProducts(
                                          index,
                                          context,
                                          controller
                                              .cartDetails!
                                              .data!
                                              .lineItems!
                                              .physicalItems![index]
                                              .id
                                              .toString(),
                                          preferences!
                                              .getString(PrefsKey.cartId)
                                              .toString(),
                                          {
                                            "line_item": {
                                              "quantity":
                                                  _shopController.selectedQty,
                                              "product_id": controller
                                                  .cartDetails!
                                                  .data!
                                                  .lineItems!
                                                  .physicalItems![index]
                                                  .productId!
                                            }
                                          },
                                          selectedItem.quantity!);
                                      // updateProduct(
                                      //     context,
                                      //     getProductDetails?.lineItemOptions
                                      //         ?.lineItem![index].id,
                                      //     getProductDetails?.lineItemOptions
                                      //             ?.lineItem![index].productId ??
                                      //         0);
                                    }),
                                /* SizedBox(
                                      height: 15.sp,
                                    ),
                                    CustomButton(
                                        title: "Remove Item",
                                        callback: () {
                                          deleteItem(
                                              context,
                                              updateProduct(
                                                  context,
                                                  getProductDetails?.lineItemOptions
                                                      ?.lineItem![index].id,
                                                  getProductDetails
                                                          ?.lineItemOptions
                                                          ?.lineItem![index]
                                                          .productId ??
                                                      0));
                                        }), */
                                SizedBox(
                                  height: 15.sp,
                                ),
                                CustomButton(
                                    title: "remove_item_button".tr,
                                    callback: () {
                                      deleteItem(
                                          context,
                                          selectedItem.id!.toString(),
                                          controller.cartDetails!.data!
                                              .lineItems!.physicalItems!.length,
                                          index);
                                    }),
                                SizedBox(
                                  height: 24.sp,
                                ),
                              ],
                            ));
                      })
                  : Center(child: Text("empty_cart".tr))
              : Center(child: Text("empty_cart".tr)));
    });
  }
}
