import 'package:mi_studio/constants/export.dart';
import 'package:mi_studio/constants/prefs_key.dart';
import 'package:mi_studio/main.dart';
import 'package:mi_studio/screens/auth/login_screen.dart';
import 'package:mi_studio/screens/cart/controller/cart_controller.dart';
import 'package:mi_studio/screens/profile/account_settings.dart';
import 'package:mi_studio/screens/profile/address_screen.dart';
import 'package:mi_studio/screens/profile/controller/profile_controller.dart';
import 'package:mi_studio/screens/profile/orders_screen.dart';
import 'package:mi_studio/screens/profile/payment_options_screen.dart';
import 'package:mi_studio/screens/profile/recently_viewed_screen.dart';
import 'package:mi_studio/screens/profile/shipping_&_returns.dart';

import '../../app_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileController profileController = Get.find<ProfileController>();
  final getUserData = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightGreyishColor,
      appBar:
          HelperUtility.commonAppBar(title: "Profile".tr, isbottomTab: false),
      body: body(),
    );
  }

  Widget body() {
    return GetBuilder<ProfileController>(
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 29.sp, vertical: 12.sp),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 80.sp,
                    width: 80.sp,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AppImages.topsImage),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: 12.sp,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HelperUtility.customText(
                          title:
                              "${getUserData.userInfo?.data![0].firstName ?? ""} ${getUserData.userInfo?.data![0].lastName ?? ""}",
                          color: ColorConstants.blackColor,
                          fontSize: 15.sp,
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.w400),
                      SizedBox(
                        height: 2.sp,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 9.5.sp,
                            width: 14.sp,
                            color: ColorConstants.greyColor,
                          ),
                          SizedBox(
                            width: 5.sp,
                          ),
                          HelperUtility.customText(
                              title: "italy".tr,
                              color: ColorConstants.blackColor,
                              fontSize: 10.sp,
                              textAlign: TextAlign.left,
                              fontWeight: FontWeight.w400),
                        ],
                      ),
                      SizedBox(
                        height: 14.sp,
                      ),
                      HelperUtility.customText(
                          title: "italian".tr,
                          color: ColorConstants.blackColor,
                          fontSize: 10.sp,
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.w400),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20.sp,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.optionsList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () async {
                        if (index == 0) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const OrdersScreen()));
                          // Get.to(() => const OrdersScreen());
                        }
                        if (index == 1) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ShippingAndReturns()));
                          // Get.to(const ShippingAndReturns());
                        }
                        // if (index == 2) {
                        //   Navigator.push(context, MaterialPageRoute(builder: (context)=>const PaymentOptionsScreen()));
                        //   // Get.to(const PaymentOptionsScreen());
                        // }
                        if (index == 2) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AddressScreen()));
                          // Get.to(const AddressScreen());
                        }
                        if (index == 3) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RecentlyViewedScreen()));
                          // Get.to(const RecentlyViewedScreen());
                        }
                        if (index == 4) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AccountSettings()));
                          // Get.to(const AccountSettings());
                        }
                        if (index == 5) {
                          logout();
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 2.sp),
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.sp, vertical: 18.sp),
                        decoration: BoxDecoration(
                            color: ColorConstants.whiteColor,
                            borderRadius: BorderRadius.circular(4.r)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            HelperUtility.customText(
                                title: controller.optionsList[index].tr,
                                color: ColorConstants.blackColor,
                                fontSize: 12.sp,
                                textAlign: TextAlign.left,
                                fontWeight: FontWeight.w400),
                            const Spacer(),
                            index == controller.optionsList.length - 1
                                ? const SizedBox()
                                : Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: ColorConstants.blackColor,
                                    size: 14,
                                  )
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        );
      },
    );
  }

  void logout() {
    preferences!.remove(PrefsKey.userInfo).then((value) {
      CartController controller = Get.find<CartController>();
      preferences!.remove(PrefsKey.token);
      preferences!.setBool(PrefsKey.isFirstCart, true);
      preferences!.remove(PrefsKey.cartId);
      controller.clearCart();
      Get.offAll(() => const LoginScreen());
      // Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(builder: (context) => const LoginScreen()),
      //     (route) => false);
    });
  }
}
