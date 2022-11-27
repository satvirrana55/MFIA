import 'dart:ffi';

import 'package:mi_studio/constants/export.dart';
import 'package:mi_studio/screens/profile/controller/profile_controller.dart';
import 'package:mi_studio/screens/profile/order_detail_screen.dart';

import '../../network/constants/graph_ql_query.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  ProfileController profileController = Get.find<ProfileController>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getOrders();
    });

    super.initState();
  }

  Future<void> getOrders() async {
    await Get.find<ProfileController>().allOrders(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.lightGreyishColor,
        appBar: HelperUtility.commonAppBar(
            title: "app_bar_orders".tr, context: context),
        body: GetBuilder<ProfileController>(builder: (controller) {
          return SafeArea(
            child: profileController.orderDetailList != null
                ? ListView.builder(
                    padding: EdgeInsets.symmetric(
                        horizontal: 25.sp, vertical: 16.sp),
                    itemCount: profileController.orderDetailList?.length ?? 0,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var orders =
                          Get.find<ProfileController>().orderDetailList;
                      return InkWell(
                        onTap: () async {
                          controller.productList.clear();
                          /*  await Get.find<ProfileController>()
                              .orderDetails(context, orders![index].id ?? 0);

                          for (var singleOrder
                              in Get.find<ProfileController>().orderDetail) {
                            // ignore: use_build_context_synchronously
                            await profileController.productWithHexCode(
                                context, {
                              "query": GraphQlQuery.productWithHexColorQuery(
                                  singleOrder.productId.toString())
                            });
                          } */
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OrderDetail(
                                        order: orders![index],
                                        quantity:
                                            orders[index].itemsTotal.toString(),
                                      )));
                          // await Get.to(OrderDetail(order: orders[index]));
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 13.sp, vertical: 17.sp),
                            margin: EdgeInsets.symmetric(vertical: 5.sp),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.r),
                                color: ColorConstants.whiteColor),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: HelperUtility.customText(
                                          title:
                                              "Order No :${orders?[index].id ?? ""}  ",
                                          color: ColorConstants.blackColor,
                                          fontSize: 11.sp,
                                          textAlign: TextAlign.left,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: HelperUtility.customText(
                                          title: orders?[index].status ??
                                              "7823 - Short gown dress",
                                          color: ColorConstants.blackColor,
                                          fontSize: 11.sp,
                                          textAlign: TextAlign.left,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15.sp),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
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
                                            title: orders?[index]
                                                    .itemsTotal
                                                    .toString() ??
                                                '1',
                                            color: ColorConstants.blackColor,
                                            fontSize: 10.sp,
                                            textAlign: TextAlign.left,
                                            fontWeight: FontWeight.w400),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        HelperUtility.customText(
                                            title: "Ordered on",
                                            color: ColorConstants.textGreyColor,
                                            fontSize: 10.sp,
                                            textAlign: TextAlign.left,
                                            fontWeight: FontWeight.w400),
                                        HelperUtility.customText(
                                            title: orders?[index].dateCreated !=
                                                    ""
                                                ? '${orders?[index].dateCreated?.split(',').last.split(' ')[1] ?? ""} ${orders?[index].dateCreated?.split(',').last.split(' ')[2] ?? ""} ${orders?[index].dateCreated?.split(',').last.split(' ')[3] ?? ""}'
                                                : " ",
                                            color: ColorConstants.blackColor,
                                            fontSize: 10.sp,
                                            textAlign: TextAlign.left,
                                            fontWeight: FontWeight.w400),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        HelperUtility.customText(
                                            title: "Amount:",
                                            color: ColorConstants.textGreyColor,
                                            fontSize: 10.sp,
                                            textAlign: TextAlign.left,
                                            fontWeight: FontWeight.w400),
                                        HelperUtility.customText(
                                            title: orders?[index]
                                                    .totalIncTax
                                                    .toString() ??
                                                '1',
                                            color: ColorConstants.blackColor,
                                            fontSize: 10.sp,
                                            textAlign: TextAlign.left,
                                            fontWeight: FontWeight.w400),
                                      ],
                                    ),
                                  ],
                                ),

                                /* Padding(
                            padding: EdgeInsets.only(bottom: 7.sp),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                HelperUtility.customText(
                                    title: orders![index].status,
                                    color: ColorConstants.blackColor,
                                    fontSize: 12.sp,
                                    textAlign: TextAlign.left,
                                    fontWeight: FontWeight.w400),
                                const Spacer(),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 17.sp, vertical: 7.sp),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.r),
                                      color: ColorConstants.lightGreyColor),
                                  child: HelperUtility.customText(
                                      title: "Reorder",
                                      color: ColorConstants.blackColor,
                                      fontSize: 12.sp,
                                      textAlign: TextAlign.center,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                          Divider(
                            height: 5,
                            color: ColorConstants.lightGreyColor,
                            thickness: 5.sp,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      /*  Container(
                                height: 100.sp,
                                width: 77.sp,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage(AppImages.bestSellerImage))),
                              ),
                              SizedBox(
                                width: 12.sp,
                              ), */
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          HelperUtility.customText(
                                              title: orders?[index].status ??
                                                  "7823 - Short gown dress",
                                              color: ColorConstants.blackColor,
                                              fontSize: 11.sp,
                                              textAlign: TextAlign.left,
                                              fontWeight: FontWeight.w500),
                                          SizedBox(
                                            height: 24.sp,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              /* Column(
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
                                        width: 50.sp,
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
                                              fontWeight: FontWeight.w400),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 50.sp,
                                      ),*/
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  HelperUtility.customText(
                                                      title: "Quantity:",
                                                      color: ColorConstants
                                                          .textGreyColor,
                                                      fontSize: 10.sp,
                                                      textAlign: TextAlign.left,
                                                      fontWeight: FontWeight.w400),
                                                  HelperUtility.customText(
                                                      title: orders?[index]
                                                              .itemsTotal
                                                              .toString() ??
                                                          '1',
                                                      color:
                                                          ColorConstants.blackColor,
                                                      fontSize: 10.sp,
                                                      textAlign: TextAlign.left,
                                                      fontWeight: FontWeight.w400),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  HelperUtility.customText(
                                                      title: "Amount:",
                                                      color: ColorConstants
                                                          .textGreyColor,
                                                      fontSize: 10.sp,
                                                      textAlign: TextAlign.left,
                                                      fontWeight: FontWeight.w400),
                                                  HelperUtility.customText(
                                                      title: orders?[index]
                                                              .totalIncTax
                                                              .toString() ??
                                                          '1',
                                                      color:
                                                          ColorConstants.blackColor,
                                                      fontSize: 10.sp,
                                                      textAlign: TextAlign.left,
                                                      fontWeight: FontWeight.w400),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 14.sp,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  HelperUtility.customText(
                                                      title: "Ordered on",
                                                      color: ColorConstants
                                                          .textGreyColor,
                                                      fontSize: 10.sp,
                                                      textAlign: TextAlign.left,
                                                      fontWeight: FontWeight.w400),
                                                  HelperUtility.customText(
                                                      title: orders?[index]
                                                              .dateCreated
                                                              ?.split('+')
                                                              .first ??
                                                          "12 May 2022",
                                                      color:
                                                          ColorConstants.blackColor,
                                                      fontSize: 10.sp,
                                                      textAlign: TextAlign.left,
                                                      fontWeight: FontWeight.w400),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 17.sp,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  HelperUtility.customText(
                                                      title: "Shipped on",
                                                      color: ColorConstants
                                                          .textGreyColor,
                                                      fontSize: 10.sp,
                                                      textAlign: TextAlign.left,
                                                      fontWeight: FontWeight.w400),
                                                  HelperUtility.customText(
                                                      title: orders?[index]
                                                              .dateShipped
                                                              ?.split('+')
                                                              .first ??
                                                          "null",
                                                      color:
                                                          ColorConstants.blackColor,
                                                      fontSize: 10.sp,
                                                      textAlign: TextAlign.left,
                                                      fontWeight: FontWeight.w400),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  )*/
                              ],
                            )),
                      );
                    })
                : profileController.orderDetailList == null
                    ? Center(
                        child: Text(
                          "no_orders_found".tr,
                          style:
                              TextStyle(color: Colors.black, fontSize: 12.sp),
                        ),
                      )
                    : const Center(child: SizedBox()),
          );
        }));
  }
}
