import 'package:mi_studio/constants/export.dart';

class PaymentOptionsScreen extends StatefulWidget {
  const PaymentOptionsScreen({Key? key}) : super(key: key);

  @override
  State<PaymentOptionsScreen> createState() => _PaymentOptionsScreenState();
}

class _PaymentOptionsScreenState extends State<PaymentOptionsScreen> {
  String ?value = "";
  bool ?isCreditCard = false;
  bool ?isPayPal = false;
  bool ?isTestPayment = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightGreyishColor,
      appBar: HelperUtility.commonAppBar(title: 'Payment Options'),
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 29.sp, vertical: 14.sp),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                       value = "Credit Cards";
                       isCreditCard =!isCreditCard!;
                       isPayPal = false;
                       isTestPayment = false;
                    });
                  },
                  child: Container(
                      width: 1.sw,
                      padding: EdgeInsets.symmetric(horizontal: 13.sp, vertical: 25.sp),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: ColorConstants.whiteColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              isCreditCard == true?
                              Icon(
                                Icons.radio_button_checked,
                                color: ColorConstants.blackColor,
                                size: 20,
                              ):Icon(
                                Icons.radio_button_off_outlined,
                                color: ColorConstants.blackColor,
                                size: 20,
                              ),
                              SizedBox(
                                width: 10.sp,
                              ),
                              HelperUtility.customText(
                                  title: "Credit Cards",
                                  color: ColorConstants.blackColor,
                                  fontSize: 13.sp,
                                  textAlign: TextAlign.left,
                                  fontWeight: FontWeight.w500),
                              Spacer(),
                              Image.asset(AppImages.masterCardLogo),
                              SizedBox(
                                width: 5.sp,
                              ),
                              Image.asset(AppImages.visaCardImage),
                            ],
                          ),
                          SizedBox(
                            height: 30.sp,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 25.sp,
                              ),
                              HelperUtility.customText(
                                  title: "Bank of Italy Card ****4589",
                                  color: ColorConstants.blackColor,
                                  fontSize: 12.sp,
                                  textAlign: TextAlign.left,
                                  fontWeight: FontWeight.w500),
                              Spacer(),
                              Image.asset(AppImages.visaCardImage),
                            ],
                          ),
                          SizedBox(
                            height: 30.sp,
                          ),
                          Container(
                            padding:
                            EdgeInsets.symmetric(horizontal: 17.sp, vertical: 7.sp),
                            margin: EdgeInsets.symmetric(
                              horizontal: 23.sp,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.r),
                                color: ColorConstants.lightGreyColor),
                            child: HelperUtility.customText(
                                title: "Add another Card",
                                color: ColorConstants.blackColor,
                                fontSize: 12.sp,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      )),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      value = "PayPal";
                      isPayPal =!isPayPal!;
                      isCreditCard = false;
                      isTestPayment = false;
                    });
                  },
                  child: Container(
                      width: 1.sw,
                      padding: EdgeInsets.symmetric(horizontal: 13.sp, vertical: 25.sp),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: ColorConstants.whiteColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              isPayPal == true?
                              Icon(
                                Icons.radio_button_checked,
                                color: ColorConstants.blackColor,
                                size: 20,
                              ):Icon(
                                Icons.radio_button_off_outlined,
                                color: ColorConstants.blackColor,
                                size: 20,
                              ),
                              SizedBox(
                                width: 10.sp,
                              ),
                              HelperUtility.customText(
                                  title: "PayPal",
                                  color: ColorConstants.blackColor,
                                  fontSize: 13.sp,
                                  textAlign: TextAlign.left,
                                  fontWeight: FontWeight.w500),
                              SizedBox(
                                width: 21.sp,
                              ),
                              Image.asset(AppImages.payPalLogo),
                              Spacer(),
                              Image.asset(AppImages.masterCardLogo),
                              SizedBox(
                                width: 5.sp,
                              ),
                              Image.asset(AppImages.visaCardImage),
                            ],
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      value = "Test Payment Provider";
                      isTestPayment =!isTestPayment!;
                      isCreditCard = false;
                      isPayPal = false;

                    });
                  },
                  child: Container(
                      width: 1.sw,
                      padding: EdgeInsets.symmetric(horizontal: 13.sp, vertical: 25.sp),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: ColorConstants.whiteColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              isTestPayment == true?
                              Icon(
                                Icons.radio_button_checked,
                                color: ColorConstants.blackColor,
                                size: 20,
                              ):Icon(
                                Icons.radio_button_off_outlined,
                                color: ColorConstants.blackColor,
                                size: 20,
                              ),
                              SizedBox(
                                width: 10.sp,
                              ),
                              HelperUtility.customText(
                                  title: "Test Payment Provider",
                                  color: ColorConstants.blackColor,
                                  fontSize: 13.sp,
                                  textAlign: TextAlign.left,
                                  fontWeight: FontWeight.w500),
                              SizedBox(
                                width: 21.sp,
                              ),
                              Spacer(),
                              Image.asset(AppImages.amexCardLogo),
                              SizedBox(
                                width: 5.sp,
                              ),
                              Image.asset(AppImages.masterCardLogo),
                              SizedBox(
                                width: 5.sp,
                              ),
                              Image.asset(AppImages.visaCardImage),
                            ],
                          ),
                        ],
                      )),
                ),
              ],
            ),
          )),
    );
  }
}


