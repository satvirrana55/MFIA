import 'dart:convert';
import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:mi_studio/app_controller.dart';
import 'package:mi_studio/constants/export.dart';
import 'package:mi_studio/helper/helper_functions.dart';
import 'package:mi_studio/main.dart';
import 'package:mi_studio/models/create_cart_model.dart';
import 'package:mi_studio/network/constants/graph_ql_query.dart';
import 'package:mi_studio/network/network_services/big_commerece_graphQl/graph_ql_services.dart';
import 'package:mi_studio/screens/home/components/new_arrivals_list.dart';
import 'package:mi_studio/screens/search/search_controller/search_controller.dart';
import 'package:mi_studio/screens/shop/component/product_detail_listview.dart';
import 'package:mi_studio/screens/shop/controller/shop_controller.dart';
import 'package:mi_studio/widgets/loader_dialog.dart';

import '../../constants/prefs_key.dart';
import '../../models/base_model.dart';
import '../../models/products_model.dart';
import '../../network/network_services/big_commerece_http_apis/api_services.dart';

class ProductDetail extends StatefulWidget {
  final ProductsEdge? edge;
  final String? currencySymbol;

  const ProductDetail({
    super.key,
    this.edge,
    this.currencySymbol,
  });

  @override
  State<ProductDetail> createState() => _ProductDetailScrenState();
}

class _ProductDetailScrenState extends State<ProductDetail> {
  List<Map<String, dynamic>> listData = [];

  int currentPos = 0;
  String? chosenValue;
  final getUserData = Get.find<AppController>();
  ShopController shopController = Get.put(ShopController());
  SearchController searchController = Get.put(SearchController());

  Future<void> letsCreateCart(BuildContext context) async {
    log("is cart create done");
    log("is cart create done ${preferences!.getBool(PrefsKey.isFirstCart)}");


    LoaderDialog.showLoadingDialog(context);
    Map<String, dynamic> map = {
      "channel_id": getUserData.userInfo!.data![0].channelIds?[0] ?? 1,
      "customer_id": getUserData.userInfo!.data![0].id,
      "line_items": shopController.addedItems
    };

    log("Map values:- $map");
    BaseModel<CreateCartModel> response =
        await ApiServices().createCart(context, map);
    shopController.emptyAddedItems();
    if (response.data != null) {

      Get.back();
      preferences!.setBool(PrefsKey.isFirstCart, false);
      addToCartDialouge(context);
      preferences!.setString(PrefsKey.cartId, response.data?.data_id ?? '');
    }

    // addToCart();
    //
    // return response.data;
  }

  addToCart() async {
    log("is cart create done ${preferences!.getBool(PrefsKey.isFirstCart)}");
    LoaderDialog.showLoadingDialog(context);
    log("shopController.qty${shopController.qty}");
    Map<String, dynamic> addToCartRequestJson = {
      "line_items": shopController.addedItems
    };
    log("this is addtocart ${addToCartRequestJson}");

    BaseModel<CreateCartModel> response = await ApiServices().addItemCart(
        context,
        addToCartRequestJson,
        preferences!.getString(PrefsKey.cartId).toString());
    shopController.emptyAddedItems();
    if (response.data != null) {

      Get.back();
      // Navigator.pop(context);
      addToCartDialouge(context);
    } else {
      // Navigator.pop(context);
      log('Failed to add to cart');
    }

    return response;
  }

  //set RecentView data in sharedPerferance

  setRecentViewDataFunction() async {
    await searchController.setJsonData(json.encode(widget.edge));
  }

  fetchDataWithColorOption() {
    GraphQlServices().fetchProductWithHexColor(
        context, {"query": GraphQlQuery.productWithHexColorQuery('')});
  }

  fetchProductVariants() {}
  @override
  void initState() {
    setRecentViewDataFunction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log("Cart :- ${preferences!.getBool(PrefsKey.isFirstCart)}");
    return Scaffold(
      appBar: HelperUtility.commonAppBar(
          context: context, title: widget.edge!.node!.name!, isbottomTab: true),
      body: body(),
    );
  }

  Widget body() {
    return ListView(
      children: [
        Column(
          children: [
            Center(
              child: CarouselSlider.builder(
                  itemCount: widget.edge?.node?.images?.edges?.length,
                  itemBuilder: (context, index, realIndex) {
                    final urlImage =
                        widget.edge!.node!.images!.edges![index].node!.url;
                    return buildImage(urlImage!, index);
                  },
                  options: CarouselOptions(
                      height: 1.sw + 10,
                      onPageChanged: (itemIndex, reason) {
                        log("Test ${itemIndex.toString()}");
                        setState(() {
                          currentPos = itemIndex;
                        });
                      })),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                    widget.edge!.node!.images!.edges!.length,
                    (currentItemIndex) {
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentPos == currentItemIndex
                          ? const Color.fromRGBO(0, 0, 0, 0.9)
                          : const Color.fromRGBO(0, 0, 0, 0.4),
                    ),
                  );
                })),
          ],
        ),
        SizedBox(
          height: 22.sp,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HelperUtility.customText(
                  title: widget.edge!.node!.name!,
                  color: ColorConstants.blackColor,
                  fontSize: 20.sp,
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w500,
                  textOverFlow: TextOverflow.ellipsis),
              SizedBox(
                height: 12.sp,
              ),
              HelperUtility.customText(
                  title:
                      '${widget.currencySymbol} ${widget.edge!.node!.prices!.price!.value}',
                  color: ColorConstants.blackColor,
                  fontSize: 16.sp,
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w400),
              SizedBox(
                height: 32.sp,
              ),
              Features(
                  productOptions: widget.edge?.node?.productOptions,
                  id: widget.edge!.node!.entityId!.toString()),
              SizedBox(
                height: 24.sp,
              ),
              CustomButton(
                  title: "add_to_cart".tr,
                  callback: () {
                    if (shopController.qty == 0) {
                      HelperFunctions.showErrorDialog(
                          context, "Please_select_quantity".tr);
                    } else {
                      preferences!.getBool(PrefsKey.isFirstCart) == true
                          ? letsCreateCart(context)
                          : addToCart();
                    }
                  }),
              SizedBox(
                height: 22.sp,
              ),
              Container(
                  padding: EdgeInsets.only(
                      left: 10.sp, right: 10.sp, top: 14.sp, bottom: 14.sp),
                  decoration: BoxDecoration(
                      color: ColorConstants.lightGreyColor,
                      borderRadius: BorderRadius.circular(4.sp)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          HelperUtility.customText(
                              title: "details".tr,
                              color: ColorConstants.blackColor,
                              fontSize: 13.sp,
                              textAlign: TextAlign.left,
                              fontWeight: FontWeight.w500),
                          const Spacer(),
                          Container(
                            color: ColorConstants.blackColor,
                            height: 1.sp,
                            width: 8.sp,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 11.sp,
                      ),
                      HelperUtility.customText(
                          title: 'Composition: 85% nylon 15% elastan',
                          color: ColorConstants.blackColor,
                          fontSize: 12.sp,
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.w300),
                    ],
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 22.sp,
        ),
        Container(
            padding: EdgeInsets.only(
                left: 10.sp, right: 10.sp, top: 14.sp, bottom: 14.sp),
            decoration: BoxDecoration(
                color: ColorConstants.lightGreyColor,
                borderRadius: BorderRadius.circular(4.sp)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HelperUtility.customText(
                    title: "you_may_also_like".tr,
                    color: ColorConstants.blackColor,
                    fontSize: 16.sp,
                    textAlign: TextAlign.left,
                    fontWeight: FontWeight.w500),
                SizedBox(
                  height: 13.sp,
                ),
                const NewArrivalsList(
                  isOnDetailPage: true,
                )
              ],
            )),
        SizedBox(
          height: 10.sp,
        ),
      ],
    );
  }

  Widget buildImage(String urlImage, int index) {
    return Image.network(
      widget.edge!.node!.images!.edges![index].node!.url!,
      fit: BoxFit.fill,
    );
  }

  addToCartDialouge(context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setstate) {
            return Dialog(
              backgroundColor: ColorConstants.whiteColor.withOpacity(0.8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)), //this right here
              child: Container(
                height: 1.sw * 0.5,
                padding: EdgeInsets.only(
                    top: 19.sp, left: 60.sp, right: 60.sp, bottom: 23.sp),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Image.asset(
                      AppImages.addCartLogo,
                    ),
                    SizedBox(
                      height: 13.sp,
                    ),
                    HelperUtility.customText(
                        title: "added_to_cart".tr,
                        fontWeight: FontWeight.w500,
                        color: ColorConstants.blackColor,
                        fontSize: 15.sp),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
