import 'dart:io';

import 'package:intl/intl.dart';
import 'package:mi_studio/constants/export.dart';
import 'package:mi_studio/screens/home/components/seller_Item.dart';
import 'package:mi_studio/screens/home/home_controller.dart';
import 'package:mi_studio/screens/search/search_controller/search_controller.dart';
import 'package:mi_studio/screens/shop/product_detail_screen.dart';
import 'package:mi_studio/widgets/loader_dialog.dart';

class NewArrivals extends StatefulWidget {
  final bool? isFromTab;
  const NewArrivals({Key? key, this.isFromTab}) : super(key: key);

  @override
  State<NewArrivals> createState() => _NewArrivalsState();
}

class _NewArrivalsState extends State<NewArrivals> {
  HomeController homeController = Get.find<HomeController>();
  SearchController searchController = Get.put(SearchController());

  void _loadHomePage() {
    LoaderDialog.showLoadingDialog(context);
    homeController.fetchNewArrivals(context);
    Get.back();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _loadHomePage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HelperUtility.commonAppBar(
          title: "app_bar_new_arrivals".tr,
          isbottomTab: !widget.isFromTab!,
          context: context),
      body: body(),
    );
  }

  Widget body() {
    return SafeArea(child: GetBuilder<HomeController>(builder: (controller) {
      return controller.newArrivals != null
          ? RefreshIndicator(
              onRefresh: () async {
                return controller.fetchNewArrivals(context);
              },
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5.sp),
                    decoration: BoxDecoration(
                        color: ColorConstants.whiteColor,
                        border: Border(
                          bottom: BorderSide(
                              width: 1, color: ColorConstants.greyColor),
                          top: BorderSide(
                              width: 1, color: ColorConstants.greyColor),
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
                          width: 1.sp,
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
                      padding: EdgeInsets.symmetric(horizontal: 20.sp),
                      itemCount: controller.newArrivals!.data!.site!.route!
                          .node!.products!.edges!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              childAspectRatio: 2.7 / 4),
                      itemBuilder: (BuildContext context, int index) {
                        var item = controller.newArrivals!.data!.site!.route!
                            .node!.products!.edges![index];
                        var format = NumberFormat.simpleCurrency(
                            locale: Platform.localeName,
                            name: item.node!.prices!.price!.currencyCode!);
                        return SellerItem(format: format,item: item,);
                      },
                    ),
                  )
                ],
              ),
            )
          : Container();
    }));
  }
}
