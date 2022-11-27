import 'package:mi_studio/constants/export.dart';
import 'package:mi_studio/screens/cart/controller/cart_controller.dart';

class CartPayment extends StatefulWidget {
  const CartPayment({Key? key}) : super(key: key);

  @override
  State<CartPayment> createState() => _CartPaymentState();
}

class _CartPaymentState extends State<CartPayment> {
  CartController cartController = Get.put(CartController());
  TextEditingController cardNameControler = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController cardHolderNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      appBar: HelperUtility.commonAppBar(title: 'Your Cart'),
      body: body(),
    );
  }
  Widget body(){
    return SafeArea(child: Padding(
      padding:  EdgeInsets.symmetric(horizontal: 25.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 22.sp,
          ),
          HelperUtility.customText(
              title: "Payment",
              color: ColorConstants.blackColor,
              fontSize: 18.sp,
              textAlign: TextAlign.left,
              fontWeight: FontWeight.w500),
          SizedBox(
            height: 16.sp,
          ),
          InkWell(
            onTap: () {
              setState(() {
                cartController.value = "Credit Cards";
                cartController.isCreditCard =!cartController.isCreditCard!;
                cartController.isPayPal = false;
                cartController.isTestPayment = false;
              });
            },
            child: Container(
                width: 1.sw,
                padding: EdgeInsets.symmetric(horizontal: 13.sp, vertical: 25.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    color: ColorConstants.greyColor.withOpacity(0.2)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        cartController.isCreditCard == true?
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
                      height: 17.sp,
                    ),
                    CustomTextFormField(
                      isColor: false,
                        hintText: "Card Number",
                        controller: cardNameControler,
                    isNumeric: true,),
                    SizedBox(
                      height: 10.sp,

                    ),
                    Row(
                      children: [
                        Expanded(child: CustomTextFormField(
                            isColor: false,
                            hintText: "Expiry Date",
                            controller: expiryDateController),),
                        SizedBox(width: 16.sp,),
                        Expanded(child: CustomTextFormField(
                            isColor: false,
                            hintText: "CVV",
                            controller: expiryDateController,
                        isNumeric: true,),)
                      ],
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    CustomTextFormField(
                        isColor: false,
                        hintText: "Name on Card",
                        controller: cardHolderNameController,
                    ),

                  ],
                )),
          ),
          SizedBox(
            height: 10.sp,
          ),
          InkWell(
            onTap: () {
              setState(() {
                cartController.value = "PayPal";
                cartController.isPayPal =!cartController.isPayPal!;
                cartController.isCreditCard = false;
                cartController.isTestPayment = false;
              });
            },
            child: Container(
                width: 1.sw,
                padding: EdgeInsets.symmetric(horizontal: 13.sp, vertical: 25.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    color: ColorConstants.greyColor.withOpacity(0.2)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        cartController.isPayPal == true?
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
                cartController.value = "Test Payment Provider";
                cartController.isTestPayment =!cartController.isTestPayment!;
                cartController.isCreditCard = false;
                cartController.isPayPal = false;

              });
            },
            child: Container(
                width: 1.sw,
                padding: EdgeInsets.symmetric(horizontal: 13.sp, vertical: 25.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    color: ColorConstants.greyColor.withOpacity(0.2)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        cartController.isTestPayment == true?
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
    ));
  }
}
