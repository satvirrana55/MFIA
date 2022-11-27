import 'dart:convert';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:mi_studio/constants/export.dart';
import 'package:mi_studio/models/products_model.dart';
import 'package:mi_studio/screens/home/components/seller_Item.dart';
import 'package:mi_studio/screens/search/search_controller/search_controller.dart';

class RecentlyViewedScreen extends StatefulWidget {
  const RecentlyViewedScreen({Key? key}) : super(key: key);

  @override
  State<RecentlyViewedScreen> createState() => _RecentlyViewedScreenState();
}

class _RecentlyViewedScreenState extends State<RecentlyViewedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightGreyishColor,
      appBar: HelperUtility.commonAppBar(
          title: 'recently_viewed'.tr, context: context),
      body: body(),
    );
  }
}

Widget body() {
  SearchController searchController = Get.put(SearchController());

  return SafeArea(
      child: Column(children: [
    Container(
      padding: EdgeInsets.symmetric(vertical: 5.sp),
      decoration: BoxDecoration(
          color: ColorConstants.whiteColor,
          border: Border(
            bottom: BorderSide(width: 3, color: ColorConstants.greyColor),
            top: BorderSide(width: 3, color: ColorConstants.greyColor),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(
            flex: 1,
          ),
          HelperUtility.customText(
              title: "filter".tr,
              color: ColorConstants.blackColor,
              fontSize: 12.sp,
              textAlign: TextAlign.left,
              fontWeight: FontWeight.w500),
          const Spacer(
            flex: 1,
          ),
          Container(
            width: 3.sp,
            height: 25.sp,
            color: ColorConstants.greyColor,
          ),
          const Spacer(
            flex: 1,
          ),
          HelperUtility.customText(
              title: "sort".tr,
              color: ColorConstants.blackColor,
              fontSize: 12.sp,
              textAlign: TextAlign.left,
              fontWeight: FontWeight.w500),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    ),
    Expanded(
      child: GridView.builder(
        padding: EdgeInsets.only(left: 25.sp),
        shrinkWrap: true,
        itemCount: searchController.getJsonList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 4.0, childAspectRatio: 2.6 / 4),
        itemBuilder: (BuildContext context, int index) {
          ProductsEdge productsEdge = ProductsEdge.fromJson(
              json.decode(searchController.getJsonList[index]));
          var format = NumberFormat.simpleCurrency(
              locale: Platform.localeName,
              name: productsEdge.node!.prices!.price!.currencyCode!);
          return SellerItem(
            item: productsEdge,
            format: format,
          );
        },
      ),
    )
  ]));
}
