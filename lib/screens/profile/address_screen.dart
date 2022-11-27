import 'package:mi_studio/constants/export.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightGreyishColor,
      appBar: HelperUtility.commonAppBar(title: "app_bar_addresses".tr,context: context),
      body: body(),
    );
  }
}

Widget body() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 25.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 31.sp,
        ),
        HelperUtility.customText(
            title: "billing_address".tr,
            color: ColorConstants.blackColor,
            fontSize: 16.sp,
            textAlign: TextAlign.left,
            fontWeight: FontWeight.w500),
        SizedBox(
          height: 14.sp,
        ),
        Container(
            width: 1.sw,
            margin: EdgeInsets.symmetric(vertical: 10.sp),
            padding: EdgeInsets.symmetric(vertical: 22.sp, horizontal: 25.sp),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                color: ColorConstants.whiteColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HelperUtility.customText(
                    title:
                        "Gianantonio Rizzo Borgo\nEufemia 029 Appartamento\n35, Matteo sardo, Trapani,\n18922 +86 620 91 58 7076",
                    color: ColorConstants.blackColor,
                    fontSize: 10.sp,
                    textAlign: TextAlign.left,
                    fontWeight: FontWeight.w400),
              ],
            )),
      ],
    ),
  );
}
