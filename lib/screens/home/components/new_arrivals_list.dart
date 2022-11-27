import 'dart:io';

import 'package:intl/intl.dart';
import 'package:mi_studio/constants/export.dart';

import 'package:mi_studio/screens/home/components/seller_Item.dart';
import 'package:mi_studio/screens/home/home_controller.dart';
import 'package:mi_studio/screens/search/search_controller/search_controller.dart';

class NewArrivalsList extends StatelessWidget {
  final bool? isOnDetailPage;

  const NewArrivalsList({Key? key, this.isOnDetailPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      if (controller.newArrivals != null || controller.youMayAlsoLike != null) {
        return SizedBox(
          height: isOnDetailPage == true ? 280 : 250.sp,
          width: 1.sw,
          child: ListView.builder(
              itemCount: isOnDetailPage == true
                  ? controller.youMayAlsoLike!.data!.site!.route!.node!
                      .products!.edges!.length
                  : controller.newArrivals!.data!.site!.route!.node!.products!
                      .edges!.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                var item = isOnDetailPage == true
                    ? controller.youMayAlsoLike!.data!.site!.route!.node!
                        .products!.edges![index]
                    : controller.newArrivals!.data!.site!.route!.node!.products!
                        .edges![index];
                var format = NumberFormat.simpleCurrency(
                    locale: Platform.localeName,
                    name: item.node!.prices!.price!.currencyCode!);
                return SellerItem(
                  item: item,
                  format: format,
                  isFromProductPage: isOnDetailPage,
                );
              }),
        );
      } else {
        return Container();
      }
    });
  }

  Widget addButton(VoidCallback callback) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            border: Border.all(color: ColorConstants.blackColor)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.sp),
          child: Center(
              child: Text(
            'Add',
            style: CustomTextStyle.smallTextStyle
                .copyWith(fontWeight: FontWeight.w500, fontSize: 12.sp),
          )),
        ),
      ),
    );
  }
}
