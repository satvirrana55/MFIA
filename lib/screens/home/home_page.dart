import 'package:mi_studio/constants/export.dart';
import 'package:mi_studio/screens/home/components/best_seller_list.dart';
import 'package:mi_studio/screens/home/components/custome_drawer.dart';
import 'package:mi_studio/screens/home/components/new_arrivals_list.dart';
import 'package:mi_studio/screens/home/home_controller.dart';
import 'package:mi_studio/screens/shop/categories_screen.dart';

import '../../widgets/loader_dialog.dart';
import '../search/search_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = Get.put(HomeController());

  void _loadHomePage() {
    LoaderDialog.showLoadingDialog(context);
    homeController.fetchBestSeller(context);
    homeController.fetchNewArrivals(context);
    homeController.fetchYouMayAlsoLike(context);

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
      key: homeController.scaffoldKey,
      drawer: const CustomDrawer(),
      backgroundColor: ColorConstants.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorConstants.whiteColor,
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              homeController.scaffoldKey.currentState!.openDrawer();
            },
            child: Icon(
              Icons.menu,
              color: ColorConstants.blackColor,
            )),
        centerTitle: true,
        title: Image.asset(
          AppImages.appLogo,
          height: 40.sp,
        ),
        actions: [
          GestureDetector(
              onTap: () {
                Get.to(const SearchScreen());
              },
              child: SvgPicture.asset(AppImages.searchIcon)),
          SizedBox(
            width: 19.sp,
          ),
          SvgPicture.asset(AppImages.cartIcon),
          SizedBox(
            width: 21.sp,
          ),
        ],
      ),
      body: body(context),
    );
  }
}

Widget body(context) {
  return GetBuilder<HomeController>(
    builder: (controller) {
      return SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                width: 1.sw,
                child: Image.asset(
                  AppImages.homeBannerImage,
                  fit: BoxFit.fill,
                )),
            Container(
              height: 32.h,
              color: ColorConstants.lightBrownColor,
              width: 1.sw,
              child: Center(
                child: HelperUtility.customText(
                    title: "get_10%_of".tr,
                    color: ColorConstants.blackColor,
                    fontSize: 10.sp,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 14.sp, right: 14.sp),
              height: 114.sp,
              width: 1.sw,
              color: const Color.fromRGBO(245, 245, 245, 1),
              child: ListView.builder(
                  itemCount: controller.categoryList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        String? url = controller.categoryList[index].title;

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CategoriesScreen(url: url)));
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 15.sp, top: 16.sp, bottom: 14.sp),
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                height: 64.sp,
                                width: 64.sp,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(controller
                                                .categoryList[index]
                                                .imagePath ??
                                            ""),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            SizedBox(
                              height: 5.sp,
                            ),
                            HelperUtility.customText(
                                title: controller.categoryList[index].title?.tr,
                                color: ColorConstants.blackColor,
                                fontSize: 10.0 *
                                    MediaQuery.of(context).textScaleFactor,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w400),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 32.sp,
            ),
            HelperUtility.customText(
                title: controller.bestSeller != null
                    ? "this_month_best_sellers".tr
                    : '',
                color: ColorConstants.blackColor,
                fontSize: 18.sp,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w500),
            SizedBox(
              height: 11.sp,
            ),
            BestSellerList(), // This is a  Seller Lest widget
            SizedBox(
              height: 37.sp,
            ),
            HelperUtility.customText(
                title: controller.newArrivals != null
                    ? "this_week_new_arrivals".tr
                    : '',
                color: ColorConstants.blackColor,
                fontSize: 18.sp,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w500),
            SizedBox(
              height: 11.sp,
            ),
           NewArrivalsList(),
            SizedBox(
              height: 37.sp,
            ),
            HelperUtility.customText(
                title: "why_choose_us".tr,
                color: ColorConstants.blackColor,
                fontSize: 18.sp,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w500),
            SizedBox(
              height: 11.sp,
            ),
            SizedBox(
              height: 365.sp,
              child: ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                        padding: EdgeInsets.only(
                            left: 25.sp, right: 25.sp, bottom: 25.sp),
                        height: 315.sp,
                        width: 1.sw,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(AppImages.latestImage),
                                fit: BoxFit.cover)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10.sp),
                              color: ColorConstants.whiteColor.withOpacity(0.8),
                              height: 80.sp,
                              child: Column(
                                children: [
                                  HelperUtility.customText(
                                      title: "latest_trends".tr,
                                      color: ColorConstants.blackColor,
                                      fontSize: 12.sp,
                                      textAlign: TextAlign.center,
                                      fontWeight: FontWeight.w500),
                                  Expanded(
                                    child: HelperUtility.customText(
                                        title: "our_business_philosophy".tr,
                                        color: ColorConstants.blackColor,
                                        fontSize: 12.sp,
                                        textAlign: TextAlign.center,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5.sp,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  index == 0
                                      ? Icons.circle
                                      : Icons.radio_button_off,
                                  color: ColorConstants.whiteColor,
                                  size: 12,
                                ),
                                SizedBox(
                                  width: 5.sp,
                                ),
                                Icon(
                                  index == 1
                                      ? Icons.circle
                                      : Icons.radio_button_off,
                                  color: ColorConstants.whiteColor,
                                  size: 12,
                                ),
                              ],
                            )
                          ],
                        ));
                  }),
            ),
            SizedBox(
              height: 20.sp,
            )
          ],
        ),
      );
    },
  );
}

class CommonClass {
  String? title;
  String? imagePath;
  CommonClass({this.title, this.imagePath});
}
