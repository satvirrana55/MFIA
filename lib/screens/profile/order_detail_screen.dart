import 'dart:developer';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:mi_studio/constants/export.dart';
import 'package:mi_studio/network/constants/graph_ql_query.dart';
import 'package:mi_studio/screens/profile/controller/profile_controller.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../models/orders_model.dart';

class OrderDetail extends StatefulWidget {
  final OrderModel order;
  // ignore: prefer_typing_uninitialized_variables
  final quantity;

  const OrderDetail({super.key, required this.order, this.quantity});

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  ProfileController profileController = Get.find<ProfileController>();
  bool isLoading = false;
  late WidgetsBinding widgetsBinding;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      callApi();
    });
    super.initState();
  }

  var oid;
  Future<void> callApi() async {
    setState(() {
      isLoading = true;
    });
    await Get.find<ProfileController>()
        .orderDetails(context, widget.order.id ?? 0);

    for (var singleOrder in Get.find<ProfileController>().orderDetail) {
      // ignore: use_build_context_synchronously
      await profileController.productWithHexCode(context, {
        "query": GraphQlQuery.productWithHexColorQuery(
            singleOrder.productId.toString())
      });
      Get.find<ProfileController>();
    }
    oid = Get.find<ProfileController>().orderDetail[0].orderId;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> listData = [];
    return GetBuilder<ProfileController>(builder: (controller) {
      return Scaffold(
          backgroundColor: ColorConstants.lightGreyishColor,
          appBar: HelperUtility.commonAppBar(
              title: 'Order ${oid ?? ''}', context: context),
          body: SafeArea(
            child: controller.productList.isNotEmpty &&
                    controller.orderDetail.isNotEmpty
                ? Column(
                    children: [
                      ListView.builder(
                          itemCount:
                              controller.productVariantData?.data!.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var orderDet =
                                Get.find<ProfileController>().orderDetail;
                            var format = NumberFormat.simpleCurrency(
                                locale: Platform.localeName,
                                name: widget.order.currencyCode);
                            var tempVal = controller
                                .productWithHexColor
                                ?.data!
                                .site!
                                .products!
                                .edges!
                                .first
                                .node!
                                .productOptions!
                                .edges!;

                            var colorItem = tempVal?.first.node!.displayName ==
                                    "Color"
                                ? tempVal?.first.node!.values!.edges!
                                    .where((element) {
                                    var temp = controller.productVariantData!
                                        .data![index].optionValues!;
                                    var tempId =
                                        temp.first.optionDisplayName == "Color"
                                            ? temp.first.id
                                            : temp.last.id;

                                    return element.node!.entityId == tempId!;
                                  })
                                : tempVal?.last.node!.values!.edges!
                                    .where((element) {
                                    var temp = controller.productVariantData!
                                        .data![0].optionValues!;
                                    var tempId =
                                        temp.first.optionDisplayName == "Color"
                                            ? temp.first.id
                                            : temp.last.id;

                                    return element.node!.entityId == tempId!;
                                  });
                            var hexCode = colorItem!.isNotEmpty
                                ? colorItem.first.node!.hexColors!.first
                                    .toString()
                                    .split('#')
                                : [];
                            var secondHex = colorItem.isNotEmpty
                                ? colorItem.first.node!.hexColors!.length > 1
                                    ? colorItem.first.node!.hexColors!.last
                                        .toString()
                                        .split('#')
                                    : null
                                : null;

                            if (controller
                                    .productVariantData!.data![index].id ==
                                controller.orderDetail[0].variantId) {
                              return Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 3.sp, horizontal: 29.sp),
                                  child: Container(
                                      margin:
                                          EdgeInsets.symmetric(vertical: 1.sp),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 13.sp, vertical: 18.sp),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4.r),
                                          color: ColorConstants.whiteColor),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              HelperUtility.customText(
                                                  title: orderDet[0].name,
                                                  color:
                                                      ColorConstants.blackColor,
                                                  fontSize: 12.sp,
                                                  textAlign: TextAlign.left,
                                                  fontWeight: FontWeight.w400),
                                              /* const Spacer(),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 17.sp,
                                              vertical: 7.sp),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6.r),
                                              color: ColorConstants
                                                  .lightGreyColor),
                                          child: HelperUtility.customText(
                                              title: "Reorder",
                                              color: ColorConstants.blackColor,
                                              fontSize: 12.sp,
                                              textAlign: TextAlign.center,
                                              fontWeight: FontWeight.w500),
                                        ) */
                                            ],
                                          ),
                                          SizedBox(
                                            height: 12.sp,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 100.sp,
                                                width: 77.sp,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                  image: NetworkImage(controller
                                                      .productList[0]
                                                      .data!
                                                      .site!
                                                      .products!
                                                      .edges![0]
                                                      .node!
                                                      .images!
                                                      .edges![0]
                                                      .node!
                                                      .url
                                                      .toString()),
                                                )),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  HelperUtility.customText(
                                                      title: "color".tr,
                                                      color: ColorConstants
                                                          .textGreyColor,
                                                      fontSize: 10.sp,
                                                      textAlign: TextAlign.left,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  Icon(
                                                    Icons.circle,
                                                    color: Color(hexCode
                                                            .isNotEmpty
                                                        ? int.parse(
                                                            "0xFF${hexCode[1]}")
                                                        : 0),
                                                    /* profileController
                                                            .listProdDetails![
                                                                index]
                                                            .data!
                                                            .site!
                                                            .products!
                                                            .edges![0]
                                                            .node!
                                                            .productOptions!
                                                            .edges![index]
                                                            .node!
                                                            .values!
                                                            .edges![0]
                                                            .node!
                                                            .hexColors !=
                                                        null
                                                    ? Color(int.parse(
                                                        "0xFF${profileController.listProdDetails![index].data!.site!.products!.edges![0].node!.productOptions!.edges![index].node!.values!.edges![0].node!.hexColors![0].toString().split("#").last}"))
                                                    : Colors.transparent */

                                                    size: 18,
                                                  ),
                                                  SizedBox(
                                                    height: 14.sp,
                                                  ),
                                                  HelperUtility.customText(
                                                      title: "ordered".tr,
                                                      color: ColorConstants
                                                          .textGreyColor,
                                                      fontSize: 10.sp,
                                                      textAlign: TextAlign.left,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  HelperUtility.customText(
                                                      title: widget.order
                                                                  .dateCreated !=
                                                              ""
                                                          ? '${widget.order.dateCreated?.split(',').last.split(' ')[1] ?? ""} ${widget.order.dateCreated?.split(',').last.split(' ')[2] ?? ""} ${widget.order.dateCreated?.split(',').last.split(' ')[3] ?? ""}'
                                                          : " ",
                                                      color: ColorConstants
                                                          .blackColor,
                                                      fontSize: 10.sp,
                                                      textAlign: TextAlign.left,
                                                      fontWeight:
                                                          FontWeight.w400)
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  HelperUtility.customText(
                                                      title: "size".tr,
                                                      color: ColorConstants
                                                          .textGreyColor,
                                                      fontSize: 10.sp,
                                                      textAlign: TextAlign.left,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  HelperUtility.customText(
                                                      title: orderDet[0]
                                                          .productOptions![1]
                                                          .displayValue,
                                                      color: ColorConstants
                                                          .blackColor,
                                                      fontSize: 10.sp,
                                                      textAlign: TextAlign.left,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  SizedBox(
                                                    height: 20.sp,
                                                  ),
                                                  HelperUtility.customText(
                                                      title: "delivered_on".tr,
                                                      color: ColorConstants
                                                          .textGreyColor,
                                                      fontSize: 10.sp,
                                                      textAlign: TextAlign.left,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  HelperUtility.customText(
                                                      title: widget.order
                                                                  .dateShipped !=
                                                              ""
                                                          ? '${widget.order.dateShipped?.split(',').last.split(' ')[1]} ${widget.order.dateShipped?.split(',').last.split(' ')[2] ?? ""} ${widget.order.dateShipped?.split(',').last.split(' ')[3] ?? ''}'
                                                          : "",
                                                      color: ColorConstants
                                                          .blackColor,
                                                      fontSize: 10.sp,
                                                      textAlign: TextAlign.left,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  HelperUtility.customText(
                                                      title: "quantity".tr,
                                                      color: ColorConstants
                                                          .textGreyColor,
                                                      fontSize: 10.sp,
                                                      textAlign: TextAlign.left,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  HelperUtility.customText(
                                                      title: widget.quantity,
                                                      color: ColorConstants
                                                          .blackColor,
                                                      fontSize: 10.sp,
                                                      textAlign: TextAlign.left,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  SizedBox(
                                                    height: 20.sp,
                                                  ),
                                                  HelperUtility.customText(
                                                      title: "Total Amount:",
                                                      color: ColorConstants
                                                          .textGreyColor,
                                                      fontSize: 10.sp,
                                                      textAlign: TextAlign.left,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  HelperUtility.customText(
                                                      title:
                                                          "${format.currencySymbol} ${orderDet[0].totalIncTax!.split('.').first}",
                                                      color: ColorConstants
                                                          .blackColor,
                                                      fontSize: 10.sp,
                                                      textAlign: TextAlign.left,
                                                      fontWeight:
                                                          FontWeight.w400)
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      )));
                            } else {
                              return Container();
                            }
                          }),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 29.sp),
                        child: Container(
                            width: 1.sw,
                            margin: EdgeInsets.symmetric(vertical: 1.sp),
                            padding: EdgeInsets.symmetric(
                                horizontal: 13.sp, vertical: 25.sp),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.r),
                                color: ColorConstants.whiteColor),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HelperUtility.customText(
                                    title: "shipping_Details".tr,
                                    color: ColorConstants.blackColor,
                                    fontSize: 11.sp,
                                    textAlign: TextAlign.left,
                                    fontWeight: FontWeight.w500),
                                SizedBox(
                                  height: 11.h,
                                ),
                                HelperUtility.customText(
                                    title:
                                        "${widget.order.billingAddress?.firstName}${widget.order.billingAddress?.lastName}\n${widget.order.billingAddress?.city}",
                                    color: ColorConstants.blackColor,
                                    fontSize: 10.sp,
                                    textAlign: TextAlign.left,
                                    fontWeight: FontWeight.w400),
                              ],
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 2.sp, horizontal: 29.sp),
                        child: Container(
                            width: 1.sw,
                            padding: EdgeInsets.symmetric(
                                horizontal: 13.sp, vertical: 25.sp),
                            margin: EdgeInsets.symmetric(vertical: 1.sp),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.r),
                                color: ColorConstants.whiteColor),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HelperUtility.customText(
                                    title: "payment_Details".tr,
                                    color: ColorConstants.blackColor,
                                    fontSize: 11.sp,
                                    textAlign: TextAlign.left,
                                    fontWeight: FontWeight.w500),
                                SizedBox(
                                  height: 14.h,
                                ),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        HelperUtility.customText(
                                            title:
                                                "Bank of Italy Card ****4589",
                                            color: ColorConstants.blackColor,
                                            fontSize: 10.sp,
                                            textAlign: TextAlign.left,
                                            fontWeight: FontWeight.w400),
                                        HelperUtility.customText(
                                            title: "Credit Card",
                                            color:
                                                ColorConstants.textGreyNewColor,
                                            fontSize: 9.sp,
                                            textAlign: TextAlign.left,
                                            fontWeight: FontWeight.w400),
                                      ],
                                    ),
                                    const Spacer(),
                                    Image.asset(AppImages.visaCardImage)
                                  ],
                                ),
                              ],
                            )),
                      ),
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(
                    color: Colors.black,
                  )),
          ));
    });
  }
}
