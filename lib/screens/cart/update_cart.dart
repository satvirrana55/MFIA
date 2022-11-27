
import 'package:mi_studio/constants/export.dart';
import 'package:mi_studio/helper/helper_functions.dart';
import 'package:mi_studio/screens/cart/cart_shipping_address.dart';
import 'package:mi_studio/screens/cart/controller/cart_controller.dart';
import 'package:mi_studio/screens/shop/component/product_detail_listview.dart';

class UpdateCart extends StatefulWidget {
  const UpdateCart({Key? key}) : super(key: key);

  @override
  State<UpdateCart> createState() => _UpdateCartState();
}

class _UpdateCartState extends State<UpdateCart> {
  CartController cartController = Get.put(CartController());
  TextEditingController cardNameControler = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController cardHolderNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HelperUtility.commonAppBar(title: 'Your Cart'),
      body: body(),
    );
  }

  Widget body() {
    return SafeArea(child: Container(
        width: 1.sw,
        padding: EdgeInsets.symmetric(horizontal: 25.sp),
        decoration: BoxDecoration(
            color: ColorConstants.whiteColor,
            border: Border(
              bottom: BorderSide(width: 2, color: ColorConstants.greyColor),
              top: BorderSide(width: 2, color: ColorConstants.greyColor),
            )),
        child: ListView(

          children: [
            SizedBox(height: 20.sp,),
            HelperUtility.customText(
                title: "Update your cart",
                color: ColorConstants.blackColor,
                fontSize: 16.sp,
                textAlign: TextAlign.left,
                fontWeight: FontWeight.w500),
            SizedBox(height: 16.sp,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 100.sp,
                  width: 77.sp,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image:
                          AssetImage(AppImages.bestSellerImage))),
                ),
                SizedBox(
                  width: 12.sp,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    HelperUtility.customText(
                        title: "4900 - Elegant one piece kimono",
                        color: ColorConstants.blackColor,
                        fontSize: 13.sp,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w500),

                    SizedBox(height: 8.sp,),

                    Container(
                      height: 1.sw * 0.8,
                      width: 1.sw * 0.6,
                      child: ListView.builder(
                          itemCount: 5,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.only(
                                  bottom: 10.sp, top: 10.sp),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(width: 2.sp,
                                          color: ColorConstants.greyColor)
                                  )
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      HelperUtility.customText(
                                          title: "Color:",
                                          color: ColorConstants.textGreyColor,
                                          fontSize: 10.sp,
                                          textAlign: TextAlign.left,
                                          fontWeight: FontWeight.w400),
                                      Icon(
                                        Icons.circle,
                                        color: ColorConstants.lightBrownColor,
                                        size: 15,
                                      ),

                                    ],
                                  ),
                                  SizedBox(
                                    width: 20.sp,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      HelperUtility.customText(
                                          title: "Size:",
                                          color: ColorConstants.textGreyColor,
                                          fontSize: 10.sp,
                                          textAlign: TextAlign.left,
                                          fontWeight: FontWeight.w400),
                                      HelperUtility.customText(
                                          title: "One Size",
                                          color: ColorConstants.blackColor,
                                          fontSize: 10.sp,
                                          textAlign: TextAlign.left,
                                          fontWeight: FontWeight.w500),

                                    ],
                                  ),
                                  SizedBox(
                                    width: 20.sp,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      HelperUtility.customText(
                                          title: "Quantity:",
                                          color: ColorConstants.textGreyColor,
                                          fontSize: 10.sp,
                                          textAlign: TextAlign.left,
                                          fontWeight: FontWeight.w400),
                                      HelperUtility.customText(
                                          title: "106",
                                          color: ColorConstants.blackColor,
                                          fontSize: 10.sp,
                                          textAlign: TextAlign.left,
                                          fontWeight: FontWeight.w500),

                                    ],
                                  ),
                                  SizedBox(
                                    width: 20.sp,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      HelperUtility.customText(
                                          title: "Total:",
                                          color: ColorConstants.textGreyColor,
                                          fontSize: 10.sp,
                                          textAlign: TextAlign.left,
                                          fontWeight: FontWeight.w400),
                                      HelperUtility.customText(
                                          title: "€443,00",
                                          color: ColorConstants.blackColor,
                                          fontSize: 10.sp,
                                          textAlign: TextAlign.left,
                                          fontWeight: FontWeight.w500),

                                    ],
                                  ),
                                ],
                              ),
                            );
                          }),
                    )


                  ],
                )
              ],
            ),
            SizedBox(height: 16.sp,),
            Container(
              width: 1.sw,
              padding: EdgeInsets.symmetric(vertical: 25.sp),
              decoration: BoxDecoration(
                  color: ColorConstants.whiteColor,
                  border: Border(
                    bottom: BorderSide(
                        width: 2, color: ColorConstants.greyColor),
                    top: BorderSide(width: 2, color: ColorConstants.greyColor),
                  )),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [
                      HelperUtility.customText(
                          title: "Subtotal",
                          color: ColorConstants.blackColor,
                          fontSize: 12.sp,
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.w500),
                      SizedBox(height: 10.sp,),
                      HelperUtility.customText(
                          title: "Discount",
                          color: ColorConstants.blackColor,
                          fontSize: 12.sp,
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.w500),
                      SizedBox(height: 10.sp,),
                      HelperUtility.customText(
                          title: "Shipping",
                          color: ColorConstants.blackColor,
                          fontSize: 12.sp,
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.w500),
                      SizedBox(height: 10.sp,),
                      HelperUtility.customText(
                          title: "Tax",
                          color: ColorConstants.blackColor,
                          fontSize: 12.sp,
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.w500),


                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      HelperUtility.customText(
                          title: "€2098",
                          color: ColorConstants.blackColor,
                          fontSize: 12.sp,
                          textAlign: TextAlign.right,
                          fontWeight: FontWeight.w500),
                      SizedBox(height: 10.sp,),
                      HelperUtility.customText(
                          title: "00 -€300",
                          color: ColorConstants.blackColor,
                          fontSize: 12.sp,
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.w500),
                      SizedBox(height: 10.sp,),
                      HelperUtility.customText(
                          title: "00 €140",
                          color: ColorConstants.blackColor,
                          fontSize: 12.sp,
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.w500),
                      SizedBox(height: 10.sp,),
                      HelperUtility.customText(
                          title: "00 €160,00",
                          color: ColorConstants.blackColor,
                          fontSize: 12.sp,
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.w500),


                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 9.sp,),
            Row(
              children: [
                HelperUtility.customText(
                    title: "Subtotal (330 Items)",
                    color: ColorConstants.blackColor,
                    fontSize: 18.sp,
                    textAlign: TextAlign.left,
                    fontWeight: FontWeight.w500),
                const Spacer(),
                HelperUtility.customText(
                    title: "€2098,00",
                    color: ColorConstants.blackColor,
                    fontSize: 18.sp,
                    textAlign: TextAlign.left,
                    fontWeight: FontWeight.w500),
              ],
            ),
            SizedBox(height: 34.sp,),
            HelperUtility.editButton(
                onTap: () {
                  Get.to(const CartShippingAddress());
                }
            ),
            SizedBox(height: 59.sp,),
            HelperUtility.customText(
                title: "Billing Address",
                color: ColorConstants.blackColor,
                fontSize: 16.sp,
                textAlign: TextAlign.left,
                fontWeight: FontWeight.w500),
            SizedBox(
              height: 21.sp,
            ),
            HelperUtility.customText(
                title: "Your product/s will be delivered to below address",
                color: ColorConstants.blackColor,
                fontSize: 13.sp,
                textAlign: TextAlign.left,
                fontWeight: FontWeight.w400),
            SizedBox(
              height: 9.sp,
            ),
            Container(
              padding: EdgeInsets.only(top: 22.sp, left: 19.sp, bottom: 22.sp),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: ColorConstants.greyColor.withOpacity(0.2)

              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HelperUtility.customText(
                      title:
                      "Gianantonio Rizzo Borgo",
                      color: ColorConstants.blackColor,
                      fontSize: 12.sp,
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w400),
                  SizedBox(height: 5.sp,),
                  HelperUtility.customText(
                      title:
                      "Eufemia 029 Appartamento",
                      color: ColorConstants.blackColor,
                      fontSize: 12.sp,
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w400),
                  SizedBox(height: 5.sp,),
                  HelperUtility.customText(
                      title:
                      "35, Matteo sardo, Trapani,",
                      color: ColorConstants.blackColor,
                      fontSize: 12.sp,
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w400),
                  SizedBox(height: 5.sp,),
                  HelperUtility.customText(
                      title:
                      "18922 +86 620 91 58 7076",
                      color: ColorConstants.blackColor,
                      fontSize: 12.sp,
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w400),
                ],
              ),
            ),
            SizedBox(
              height: 56.sp,
            ),
            HelperUtility.customText(
                title: "Payment",
                color: ColorConstants.blackColor,
                fontSize: 16.sp,
                textAlign: TextAlign.left,
                fontWeight: FontWeight.w500),
            SizedBox(
              height: 18.sp,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  cartController.value = "Credit Cards";
                  cartController.isCreditCard = !cartController.isCreditCard!;
                  cartController.isPayPal = false;
                  cartController.isTestPayment = false;
                });
              },
              child: Container(
                  width: 1.sw,
                  padding: EdgeInsets.symmetric(
                      horizontal: 13.sp, vertical: 25.sp),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: ColorConstants.greyColor.withOpacity(0.2)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          cartController.isCreditCard == true ?
                          Icon(
                            Icons.radio_button_checked,
                            color: ColorConstants.blackColor,
                            size: 20,
                          ) : Icon(
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
                          isNumeric: true,
                          hintText: "Card Number",
                          controller: cardNameControler),
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
                              isNumeric: true,
                              hintText: "CVV",
                              controller: expiryDateController),)
                        ],
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      CustomTextFormField(
                          isColor: false,
                          hintText: "Name on Card",
                          controller: cardHolderNameController),

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
                  cartController.isPayPal = !cartController.isPayPal!;
                  cartController.isCreditCard = false;
                  cartController.isTestPayment = false;
                });
              },
              child: Container(
                  width: 1.sw,
                  padding: EdgeInsets.symmetric(
                      horizontal: 13.sp, vertical: 25.sp),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: ColorConstants.greyColor.withOpacity(0.2)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          cartController.isPayPal == true ?
                          Icon(
                            Icons.radio_button_checked,
                            color: ColorConstants.blackColor,
                            size: 20,
                          ) : Icon(
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
              onTap: () {
                setState(() {
                  cartController.value = "Test Payment Provider";
                  cartController.isTestPayment = !cartController.isTestPayment!;
                  cartController.isCreditCard = false;
                  cartController.isPayPal = false;
                });
              },
              child: Container(
                  width: 1.sw,
                  padding: EdgeInsets.symmetric(
                      horizontal: 13.sp, vertical: 25.sp),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: ColorConstants.greyColor.withOpacity(0.2)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          cartController.isTestPayment == true ?
                          Icon(
                            Icons.radio_button_checked,
                            color: ColorConstants.blackColor,
                            size: 20,
                          ) : Icon(
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
            SizedBox(
              height: 31.sp,
            ),

            // CustomButton(
            //     title: "Place Order",
            //     callback: () {
            //       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UsePaypal(
            //           sandboxMode: true,
            //           clientId:
            //           "AZRmYTLZLFQS9DdmRv3EqtUkfbwOR75xsUBw-SONndmBt9WOU9PHT99-KUA8kjBASTUjYvr1jBtp0MGg",
            //           secretKey:
            //           "EPQ6UXo4t9BA3fGuvYh9OWhGy0x072Nchl7QyfTHVaNxwYtHpx3LTrxjeSNEH75n4oHxqu-DbaIANB-C",
            //           returnURL: "https://samplesite.com/return",
            //           cancelURL: "https://samplesite.com/cancel",
            //           transactions: const [
            //             {
            //               "amount": {
            //                 "total": '10.12',
            //                 "currency": "USD",
            //                 "details": {
            //                   "subtotal": '10.12',
            //                   "shipping": '0',
            //                   "shipping_discount": 0
            //                 }
            //               },
            //               "description":
            //               "The payment transaction description.",
            //               // "payment_options": {
            //               //   "allowed_payment_method":
            //               //       "INSTANT_FUNDING_SOURCE"
            //               // },
            //               "item_list": {
            //                 "items": [
            //                   {
            //                     "name": "A demo product",
            //                     "quantity": 1,
            //                     "price": '10.12',
            //                     "currency": "USD"
            //                   }
            //                 ],
            //
            //                 // shipping address is not required though
            //                 "shipping_address": {
            //                   "recipient_name": "Jane Foster",
            //                   "line1": "Travis County",
            //                   "line2": "",
            //                   "city": "Austin",
            //                   "country_code": "US",
            //                   "postal_code": "73301",
            //                   "phone": "+00000000",
            //                   "state": "Texas"
            //                 },
            //               }
            //             }
            //           ],
            //           note: "Contact us for any questions on your order.",
            //           onSuccess: (Map params) async {
            //             print("onSuccess: $params");
            //           },
            //           onError: (error) {
            //             print("onError: $error");
            //           },
            //           onCancel: (params) {
            //             print('cancelled: $params');
            //           })));
            //       HelperFunctions.customDialougeBox(
            //           context: context,
            //           title: "Order Confirmed!",
            //           subtitle: "Dear Emma John, your order has successfully been placed. The estimated delivery date is 30 May 2022",
            //           logo: AppImages.orderConfirmedLogo,
            //           buttonText: "Continue Shopping"
            //       );
            //     }),
            SizedBox(
              height: 46.sp,
            ),
          ],
        )
    ));
  }
}

