import 'package:mi_studio/constants/export.dart';

class ShippingAndReturns extends StatefulWidget {
  const ShippingAndReturns({Key? key}) : super(key: key);

  @override
  State<ShippingAndReturns> createState() => _ShippingAndReturnaState();
}

class _ShippingAndReturnaState extends State<ShippingAndReturns> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightGreyishColor,
      appBar: HelperUtility.commonAppBar(title: "app_bar_shipping_and_return".tr,context: context),
      body: body(),
    );
  }
}

Widget body() {
  return SafeArea(
      child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 25.sp, vertical: 16.sp),
    child: Column(
      children: [
        Container(
            width: 1.sw,
            margin: EdgeInsets.symmetric(vertical: 10.sp),
            padding: EdgeInsets.symmetric(vertical: 22.sp, horizontal: 15.sp),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                color: ColorConstants.whiteColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HelperUtility.customText(
                    title: "Shipping Policies",
                    color: ColorConstants.blackColor,
                    fontSize: 13.sp,
                    textAlign: TextAlign.left,
                    fontWeight: FontWeight.w500),
                SizedBox(
                  height: 13.sp,
                ),
                HelperUtility.customText(
                    title:
                        "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words. Lorem Ipsum comes from",
                    color: ColorConstants.blackColor,
                    fontSize: 12.sp,
                    textAlign: TextAlign.left,
                    fontWeight: FontWeight.w400),
                SizedBox(
                  height: 13.sp,
                ),
                HelperUtility.customText(
                    title:
                        "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words. Lorem Ipsum comes from",
                    color: ColorConstants.blackColor.withOpacity(0.9),
                    fontSize: 12.sp,
                    textAlign: TextAlign.left,
                    fontWeight: FontWeight.w400),
              ],
            )),
        SizedBox(
          height: 10.sp,
        ),
        Container(
            width: 1.sw,
            margin: EdgeInsets.symmetric(vertical: 10.sp),
            padding: EdgeInsets.symmetric(vertical: 22.sp, horizontal: 15.sp),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                color: ColorConstants.whiteColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HelperUtility.customText(
                    title: "Return Policies",
                    color: ColorConstants.blackColor,
                    fontSize: 13.sp,
                    textAlign: TextAlign.left,
                    fontWeight: FontWeight.w500),
                SizedBox(
                  height: 13.sp,
                ),
                HelperUtility.customText(
                    title:
                        "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words. Lorem Ipsum comes from",
                    color: ColorConstants.blackColor,
                    fontSize: 12.sp,
                    textAlign: TextAlign.left,
                    fontWeight: FontWeight.w400),
                SizedBox(
                  height: 13.sp,
                ),
                HelperUtility.customText(
                    title:
                        "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words. Lorem Ipsum comes from",
                    color: ColorConstants.blackColor,
                    fontSize: 12.sp,
                    textAlign: TextAlign.left,
                    fontWeight: FontWeight.w400),
              ],
            )),
      ],
    ),
  ));
}
