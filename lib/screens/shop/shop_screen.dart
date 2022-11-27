import 'dart:developer';

import 'package:mi_studio/constants/export.dart';
import 'package:mi_studio/screens/auth/auth_controller/auth_controller.dart';
import 'package:mi_studio/screens/shop/best_seller_screen.dart';
import 'package:mi_studio/screens/shop/categories_screen.dart';
import 'package:mi_studio/screens/shop/new_arrivals_screen.dart';
import 'package:mi_studio/screens/shop/controller/shop_controller.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  ShopController shopController = Get.put(ShopController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HelperUtility.commonAppBar(title: "shop".tr, isbottomTab: false),
      body: body(),
    );
  }

  Widget body() {
    log("Id12345:-${Get.find<AuthController>().data_id}");
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: shopController.categoryList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 4.0,
                childAspectRatio: 4 / 4),
            itemBuilder: (BuildContext context, int index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoriesScreen(
                                    url: shopController
                                        .categoryList[index].title!,
                                  )));
                    },
                    child: Container(
                      height: 93.sp,
                      width: 93.sp,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(shopController
                                      .categoryList[index].imagePath ??
                                  ""),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  HelperUtility.customText(
                      title: shopController.categoryList[index].title?.tr,
                      color: ColorConstants.blackColor,
                      fontSize: 10.sp,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w400)
                ],
              );
            },
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const BestSeller()));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 29.sp),
              width: 1.sw,
              height: 1.sw * 0.4,
              decoration: const BoxDecoration(
                  color: Colors.red,
                  image: DecorationImage(
                      image: AssetImage(AppImages.shopImage1),
                      fit: BoxFit.cover)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  HelperUtility.customText(
                      title: "best_sellers".tr,
                      color: ColorConstants.whiteColor,
                      fontSize: 13.sp,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w400),
                  SizedBox(
                    width: 30.sp,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.sp,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NewArrivals(
                            isFromTab: false,
                          )));
              // Get.to(()=>);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 29.sp),
              width: 1.sw,
              height: 1.sw * 0.4,
              decoration: const BoxDecoration(
                  color: Colors.red,
                  image: DecorationImage(
                      image: AssetImage(AppImages.shopImage2),
                      fit: BoxFit.cover)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 30.sp,
                  ),
                  HelperUtility.customText(
                      title: "new_arrival".tr,
                      color: ColorConstants.whiteColor,
                      fontSize: 13.sp,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w400),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
