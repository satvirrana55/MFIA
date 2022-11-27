import 'package:mi_studio/constants/export.dart';
import 'package:mi_studio/screens/cart/cart_payment.dart';

class CartBillling extends StatefulWidget {
  const CartBillling({Key? key}) : super(key: key);

  @override
  State<CartBillling> createState() => _CartBilllingState();
}

class _CartBilllingState extends State<CartBillling> {
  int currentPos=2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      appBar: HelperUtility.commonAppBar(title: 'Your Cart'),
      body: body(),
    );
  }
  Widget body(){
    return SafeArea(child: ListView(
      padding: EdgeInsets.symmetric(horizontal: 25.sp),

      children: [
        Container(
          height: 65,

          //color: Colors.grey.withOpacity(.5),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: 4,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return currentPos > index
                              ? Row(
                            children: [
                              if (index != 0)
                                Container(
                                  height: 2,
                                  width: 80,
                                  color: Colors.black,
                                ),
                              Container(
                                height: 18,
                                width: 18,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                ),
                                child: const Center(
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 15,
                                    )),
                              ),

                            ],
                          )
                              : Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              if (index != 0)
                                Container(
                                  height: 2,
                                  width: 70,
                                  color:  Colors.grey.shade700,
                                ),
                              Container(
                                height: 18,
                                width: 18,
                                decoration:  BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.grey.shade700)
                                ),
                                child: Center(
                                  child: Text(index.toString(),
                                      style:  TextStyle(
                                          fontSize: 15, color: Colors.grey.shade700)),
                                ),
                              ),

                            ],
                          );
                        }),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Order Details",
                          style: TextStyle(fontSize: 9, color: Colors.black),
                        ),
                        Text(
                          "Shipping/Billing",
                          style: TextStyle(fontSize: 9, color: Colors.black),
                        ),
                        Text(
                          "Summary",
                          style: TextStyle(fontSize: 9, color: Colors.black),
                        ),
                        Text(
                          "Payment",
                          style: TextStyle(fontSize: 9, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 22.sp,),
        HelperUtility.customText(
            title: "Billing Address",
            color: ColorConstants.blackColor,
            fontSize: 18.sp,
            textAlign: TextAlign.left,
            fontWeight: FontWeight.w500),
        SizedBox(
          height: 29.sp,
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
          width: 1.sw,
          padding: EdgeInsets.only(top: 22.sp,left: 19.sp,bottom: 22.sp),
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
          height: 39.sp,
        ),
        HelperUtility.customText(
            title: "Products",
            color: ColorConstants.blackColor,
            fontSize: 18.sp,
            textAlign: TextAlign.left,
            fontWeight: FontWeight.w500),
        SizedBox(
          height: 16.sp,
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 2,
            shrinkWrap: true,
            itemBuilder: (context,index){
          return Container(

              margin: EdgeInsets.symmetric(vertical: 5.sp),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: ColorConstants.whiteColor),
              child:  Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                          title: "105711 - Short Dress with neck chain",
                          color: ColorConstants.blackColor,
                          fontSize: 13.sp,
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.w500),
                      SizedBox(
                        height: 16.sp,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                              SizedBox(height: 14.sp,),
                              HelperUtility.customText(
                                  title: " Size:",
                                  color: ColorConstants.textGreyColor,
                                  fontSize: 10.sp,
                                  textAlign: TextAlign.left,
                                  fontWeight: FontWeight.w400),


                            ],
                          ),
                          SizedBox(width: 5.sp,),
                          Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              HelperUtility.customText(
                                  title: "Orange",
                                  color: ColorConstants.blackColor,
                                  fontSize: 10.sp,
                                  textAlign: TextAlign.left,
                                  fontWeight: FontWeight.w400),
                              SizedBox(height: 14.sp,),
                              HelperUtility.customText(
                                  title: "One Size",
                                  color: ColorConstants.blackColor,
                                  fontSize: 10.sp,
                                  textAlign: TextAlign.left,
                                  fontWeight: FontWeight.w400),

                            ],
                          ),
                          SizedBox(width: 120.sp,),
                          HelperUtility.customText(
                              title: "€19,00",
                              color: ColorConstants.textGreyColor,
                              fontSize: 13.sp,
                              textAlign: TextAlign.left,
                              fontWeight: FontWeight.w400),

                        ],
                      ),



                    ],
                  )
                ],
              ));
        }),
        SizedBox(
          height: 9.sp,
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [
                HelperUtility.customText(
                    title: "Subtotal",
                    color: ColorConstants.blackColor,
                    fontSize: 13.sp,
                    textAlign: TextAlign.left,
                    fontWeight: FontWeight.w500),
                SizedBox(height: 10.sp,),
                HelperUtility.customText(
                    title: "Discount",
                    color: ColorConstants.blackColor,
                    fontSize: 13.sp,
                    textAlign: TextAlign.left,
                    fontWeight: FontWeight.w500),
                SizedBox(height: 10.sp,),
                HelperUtility.customText(
                    title: "Shipping",
                    color: ColorConstants.blackColor,
                    fontSize: 13.sp,
                    textAlign: TextAlign.left,
                    fontWeight: FontWeight.w500),
                SizedBox(height: 10.sp,),
                HelperUtility.customText(
                    title: "Tax",
                    color: ColorConstants.blackColor,
                    fontSize: 13.sp,
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
                    fontSize: 13.sp,
                    textAlign: TextAlign.right,
                    fontWeight: FontWeight.w500),
                SizedBox(height: 10.sp,),
                HelperUtility.customText(
                    title: "00 -€300",
                    color: ColorConstants.blackColor,
                    fontSize: 13.sp,
                    textAlign: TextAlign.left,
                    fontWeight: FontWeight.w500),
                SizedBox(height: 10.sp,),
                HelperUtility.customText(
                    title: "00 €140",
                    color: ColorConstants.blackColor,
                    fontSize: 13.sp,
                    textAlign: TextAlign.left,
                    fontWeight: FontWeight.w500),
                SizedBox(height: 10.sp,),
                HelperUtility.customText(
                    title: "00 €160,00",
                    color: ColorConstants.blackColor,
                    fontSize: 13.sp,
                    textAlign: TextAlign.left,
                    fontWeight: FontWeight.w500),


              ],
            ),
          ],
        ),
        SizedBox(
          height: 33.sp,
        ),
        Row(
          children: [
            HelperUtility.customText(
                title: "Total (EUR)",
                color: ColorConstants.blackColor,
                fontSize: 18.sp,
                textAlign: TextAlign.left,
                fontWeight: FontWeight.w500),
            const Spacer(),
            HelperUtility.customText(
                title: "€76,00",
                color: ColorConstants.blackColor,
                fontSize: 18.sp,
                textAlign: TextAlign.left,
                fontWeight: FontWeight.w500),
          ],
        ),
        SizedBox(
          height: 32.sp,
        ),
        HelperUtility.editButton(
            onTap: (){

            }
        ),
        SizedBox(
          height: 10.sp,
        ),
        CustomButton(
            title: "Continue",
            callback: (){
              Get.to(const CartPayment());
            }),
        SizedBox(
          height: 32.sp,
        ),
      ],
    ));
  }
}
