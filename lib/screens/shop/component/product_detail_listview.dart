import 'dart:developer';

import 'package:mi_studio/constants/export.dart';
import 'package:mi_studio/models/base_model.dart';
import 'package:mi_studio/models/productWithHexColor.dart' as a;
import 'package:mi_studio/models/product_variant_model.dart';
import 'package:mi_studio/models/products_model.dart';
import 'package:mi_studio/network/constants/graph_ql_query.dart';
import 'package:mi_studio/network/network_services/big_commerece_graphQl/graph_ql_services.dart';
import 'package:mi_studio/network/network_services/big_commerece_http_apis/api_services.dart';
import 'package:mi_studio/screens/cart/controller/cart_controller.dart';
import 'package:mi_studio/screens/shop/controller/shop_controller.dart';
import 'package:mi_studio/widgets/my_custom_container.dart';

class Features extends StatefulWidget {
  final String? id;
  final ProductOptions? productOptions;
  final bool? isFromCart;
  final int? variantId;
  final int? qty;
  final int? index;

  const Features(
      {Key? key,
      this.productOptions,
      this.id,
      this.isFromCart,
      this.variantId,
      this.index,
      this.qty})
      : super(key: key);

  @override
  State<Features> createState() => _FeaturesState();
}

class _FeaturesState extends State<Features> {
  int colorIndex = 0;
  int sizeIndex = 0;
  int quantityIndex = 0;
  String? choseSizeValue;
  String? choseQuantityValue;
  ShopController shopController = Get.put(ShopController());
  CartController cartController = Get.find<CartController>();
  a.ProductWithHexColor? _productWithHexColor;

  Future<void> productWithHexCode(
      BuildContext context, Map<String, dynamic> map,
      {int? index}) async {
    BaseModel<a.ProductWithHexColor> response =
        await GraphQlServices().fetchProductWithHexColor(context, map);
    if (response.data != null) {
      setState(() {
        _productWithHexColor = response.data;
      });
    }
  }

  ProductVariant? _productVariantData;

  Future<void> getProductVariants(BuildContext context, String id,
      {int? index}) async {
    BaseModel<ProductVariant> response =
        await ApiServices().fetchProductVariants(context, id);
    setState(() {
      quantityIndex = widget.qty!;
      _productVariantData = response.data!;
    });
    // cartController.addProductVariant(index, response.data!);
    // shopController.generateItems();
  }

  @override
  void didUpdateWidget(covariant Features oldWidget) {
    if (widget.isFromCart == true) {
      loadItemsForCart();
    }
    log("something is going on");
    log(widget.index.toString());
    log(widget.variantId.toString());

    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {

    
    if (widget.isFromCart == true) {
      loadItemsForCart();
    } else {
      loadItemsforProduct();
    }
    super.initState();
  }

  loadItemsforProduct() {
    // log('this is a value ${widget.productOptions.toString()}');
    // log("this is product id ${widget.qty}");
    // log("this is product id ${widget.variantId}");
    // log("this is product id ${widget.id}");

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      log("called 2 times ");
      if (widget.index != null) {
        log("this is one");
        shopController.productWithHexCode(context,
            {"query": GraphQlQuery.productWithHexColorQuery(widget.id ?? '')},
            index: widget.index);
        shopController.getProductVariants(context, widget.id ?? '',
            index: widget.index);
      } else {
        log("this is one 2");
        shopController.productWithHexCode(
          context,
          {"query": GraphQlQuery.productWithHexColorQuery(widget.id ?? '')},
        );
        shopController.getProductVariants(context, widget.id ?? '');
      }
    });

    getIndex();
  }

  loadItemsForCart() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      log("called 2 times ");
      if (widget.index != null) {
        log("this is one");
        productWithHexCode(context,
            {"query": GraphQlQuery.productWithHexColorQuery(widget.id ?? '')},
            index: widget.index);
        getProductVariants(context, widget.id ?? '', index: widget.index);
      } else {
        log("this is one 2");
        productWithHexCode(
          context,
          {"query": GraphQlQuery.productWithHexColorQuery(widget.id ?? '')},
        );
        getProductVariants(context, widget.id ?? '');
      }
    });

    getIndex();
  }

  getIndex() {
    setState(() {
      colorIndex = widget.productOptions!.edges!.indexWhere((element) {
        log(element.node!.entityId.toString());
        return element.node!.displayName == DisplayName.COLOR;
      });
      log(colorIndex.toString());

      sizeIndex = widget.productOptions!.edges!.indexWhere(
          (element) => element.node!.displayName! == DisplayName.SIZE);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: widget.isFromCart != true
                ? variantList()
                : variantListIsFromCart()),
      ],
    );
  }

  Widget variantList() {
    return GetBuilder<ShopController>(builder: (controller) {
      return ListView.builder(
          itemCount: controller.productVariantData != null
              ? controller.productVariantData!.data!.length
              : 0,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            if (widget.productOptions!.edges![colorIndex].node!.values!.edges!
                    .isNotEmpty &&
                controller.productWithHexColor != null) {
              var item = controller.productVariantData!.data![index];
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                // if(controller.itemIds[widget.index!] == null){

                // }
              });
              var tempVal = controller.productWithHexColor!.data!.site!
                  .products!.edges!.first.node!.productOptions!.edges!;

              var sizeItem = tempVal.first.node!.displayName == "Size"
                  ? tempVal.first.node!.values!.edges!.where((element) {
                      var temp =
                          _productVariantData!.data![index].optionValues!;
                      var tempId = temp.first.optionDisplayName == "Size"
                          ? temp.first.id
                          : temp.last.id;
                      return element.node!.entityId == tempId!;
                    })
                  : tempVal.last.node!.values!.edges!.where((element) {
                      var temp =
                          _productVariantData!.data![index].optionValues!;
                      var tempId = temp.first.optionDisplayName == "Size"
                          ? temp.first.id
                          : temp.last.id;
                      return element.node!.entityId == tempId!;
                    });
              var colorItem = tempVal.first.node!.displayName == "Color"
                  ? tempVal.first.node!.values!.edges!.where((element) {
                      var temp = controller
                          .productVariantData!.data![index].optionValues!;
                      var tempId = temp.first.optionDisplayName == "Color"
                          ? temp.first.id
                          : temp.last.id;
                      return element.node!.entityId == tempId!;
                    })
                  : tempVal.last.node!.values!.edges!.where((element) {
                      var temp =
                          controller.productVariantData!.data![0].optionValues!;
                      var tempId = temp.first.optionDisplayName == "Color"
                          ? temp.first.id
                          : temp.last.id;
                      return element.node!.entityId == tempId!;
                    });
              var hexCode = colorItem.isNotEmpty
                  ? colorItem.first.node!.hexColors!.first.toString().split('#')
                  : [];
              var secondHex = colorItem.isNotEmpty
                  ? colorItem.first.node!.hexColors!.length > 1
                      ? colorItem.first.node!.hexColors!.last
                          .toString()
                          .split('#')
                      : null
                  : null;

              log(" ${widget.id}this is true or false ${widget.index}<<<<<<<<<<<<<<<<<<<<<<<<<<<< ${controller.itemIds.contains(widget.variantId)}");
              log("this is varient id<<<<<<<${widget.index}<<<<<<<<<<<<<<<<<<<<< ${widget.variantId}");
              log("this is item id <<<<<<<<<${widget.index}<<<<<<<<<<<<<<<<<<< ${item.id}");

              if (widget.isFromCart == true && item.id == widget.variantId) {
                // if (widget.qty != null) {
                //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                //     if (controller.currentVariantQuantity[widget.index!] == 0) {
                //       controller.updateIndex(widget.qty!, index);
                //     }
                //   });
                // }
                return Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 10.sp,
                            right: 23.sp,
                            top: 18.sp,
                            bottom: 15.sp),
                        margin: EdgeInsets.symmetric(vertical: 5.sp),
                        decoration: BoxDecoration(
                            color: ColorConstants.lightGreyColor,
                            borderRadius: BorderRadius.circular(4.sp)),
                        child: Row(
                          children: [
                            HelperUtility.customText(
                                title: 'Color',
                                color: ColorConstants.darkGreyColor,
                                fontSize: 12.sp,
                                textAlign: TextAlign.left,
                                fontWeight: FontWeight.w400),
                            const Spacer(),
                            if (secondHex == null)
                              Icon(
                                Icons.circle,
                                color: Color(hexCode.isNotEmpty
                                    ? int.parse("0xFF${hexCode[1]}")
                                    : 0),
                                size: 18.sp,
                              ),
                            if (secondHex != null)
                              MyCustomContainer(
                                progress: 0.5,
                                size: 18.sp,
                                backgroundColor:
                                    Color(int.parse("0xFF${hexCode[1]}")),
                                progressColor:
                                    Color(int.parse("0xFF${secondHex[1]}")),
                              ),
                            // Container(
                            //     height: 15,
                            //     width: 15,
                            //     decoration: BoxDecoration(
                            //         shape: BoxShape.circle,
                            //         gradient: LinearGradient(tileMode: TileMode.clamp,begin: Alignment.centerLeft,end: Alignment.centerRight,colors: [
                            //           Color(int.parse("0xFF${hexCode[1]}")),
                            //           Color(int.parse("0xFF${secondHex![1]}"))
                            //         ])))
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 10.sp,
                            right: 10.sp,
                            top: 3.sp,
                            bottom: 15.sp),
                        margin: EdgeInsets.symmetric(
                            vertical: 5.sp, horizontal: 7.sp),
                        decoration: BoxDecoration(
                            color: ColorConstants.lightGreyColor,
                            borderRadius: BorderRadius.circular(4.sp)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HelperUtility.customText(
                                title: 'Size',
                                color: ColorConstants.blackColor,
                                fontSize: 9.sp,
                                textAlign: TextAlign.left,
                                fontWeight: FontWeight.w400),
                            SizedBox(
                              height: 5.sp,
                            ),
                            Text(
                              item.optionValues!.first.optionDisplayName! ==
                                      "Size"
                                  ? item.optionValues!.first.label!
                                  : item.optionValues!.last.label!,
                              style: TextStyle(
                                  color: ColorConstants.blackColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500),
                            )
                            // DropdownButtonHideUnderline(
                            //   child: DropdownButton<String>(
                            //     value: choseSizeValue,
                            //
                            //     //elevation: 5,
                            //     style: const TextStyle(color: Colors.black),
                            //     isDense: true,
                            //     icon: Image.asset(AppImages.downwardIcon,
                            //         color: ColorConstants.blackColor),
                            //     isExpanded: true,
                            //
                            //     items: <String>[
                            //       'S',
                            //       'M',
                            //       'L',
                            //       'XL',
                            //       'XXL',
                            //     ].map<DropdownMenuItem<String>>((String value) {
                            //       return DropdownMenuItem(
                            //         value: value,
                            //         child: Text(value),
                            //       );
                            //     }).toList(),
                            //     hint: Text(
                            //       "One Size",
                            //       style: TextStyle(
                            //           color: ColorConstants.blackColor,
                            //           fontSize: 12.sp,
                            //           fontWeight: FontWeight.w500),
                            //     ),
                            //     onChanged: (String? value) {
                            //       setState(() {
                            //         choseSizeValue = value;
                            //       });
                            //     },
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 10.sp,
                            right: 10.sp,
                            top: 3.sp,
                            bottom: 15.sp),
                        margin: EdgeInsets.symmetric(
                            vertical: 5.sp, horizontal: 7.sp),
                        decoration: BoxDecoration(
                            color: ColorConstants.lightGreyColor,
                            borderRadius: BorderRadius.circular(4.sp)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HelperUtility.customText(
                                title: 'Quantity',
                                color: ColorConstants.blackColor,
                                fontSize: 9.sp,
                                textAlign: TextAlign.left,
                                fontWeight: FontWeight.w400),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<int>(
                                value:
                                    controller.currentVariantQuantity![index],
                                style: const TextStyle(color: Colors.black),
                                isDense: true,
                                icon: Image.asset(
                                  AppImages.downwardIcon,
                                  color: ColorConstants.blackColor,
                                ),
                                isExpanded: true,
                                items: List.generate(100, (index) => index++)
                                    .toList()
                                    .map<DropdownMenuItem<int>>((int value) {
                                  return DropdownMenuItem<int>(
                                    value: value,
                                    child: Text(value.toString()),
                                  );
                                }).toList(),
                                hint: Text(
                                  "One Size",
                                  style: TextStyle(
                                      color: ColorConstants.blackColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                onChanged: (int? value) {
                                  log(value.toString());
                                  if (value! > 0) {
                                    Map<String, dynamic> colorMap = {
                                      "option_id": item
                                          .optionValues!.first.optionId, //color
                                      "option_value":
                                          item.optionValues!.first.id
                                    };
                                    Map<String, dynamic> sizerMap = {
                                      "option_id": item
                                          .optionValues!.last.optionId, //color
                                      "option_value": item.optionValues!.last.id
                                    };
                                    controller.addProductVariant(
                                        [colorMap, sizerMap],
                                        value,
                                        item.productId.toString());
                                  }
                                  controller.updateIndex(value, index);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              } else if (widget.isFromCart != true) {
                return Row(
                  children: [
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.only(
                          left: 10.sp, right: 23.sp, top: 18.sp, bottom: 15.sp),
                      margin: EdgeInsets.symmetric(vertical: 5.sp),
                      decoration: BoxDecoration(
                          color: ColorConstants.lightGreyColor,
                          borderRadius: BorderRadius.circular(4.sp)),
                      child: Row(
                        children: [
                          HelperUtility.customText(
                              title: 'Colors',
                              color: ColorConstants.darkGreyColor,
                              fontSize: 12.sp,
                              textAlign: TextAlign.left,
                              fontWeight: FontWeight.w400),
                          const Spacer(),
                          if (secondHex == null)
                            Icon(
                              Icons.circle,
                              color: Color(int.parse(
                                  "0xFF${hexCode.isNotEmpty ? hexCode[1] : 0}")),
                              size: 18.sp,
                            ),
                          if (secondHex != null)
                            MyCustomContainer(
                              progress: 0.5,
                              size: 18.sp,
                              backgroundColor:
                                  Color(int.parse("0xFF${hexCode[1]}")),
                              progressColor:
                                  Color(int.parse("0xFF${secondHex[1]}")),
                            ),
                          // Container(
                          //     height: 15,
                          //     width: 15,
                          //     decoration: BoxDecoration(
                          //         shape: BoxShape.circle,
                          //         gradient: LinearGradient(tileMode: TileMode.clamp,begin: Alignment.centerLeft,end: Alignment.centerRight,colors: [
                          //           Color(int.parse("0xFF${hexCode[1]}")),
                          //           Color(int.parse("0xFF${secondHex![1]}"))
                          //         ])))
                        ],
                      ),
                    )),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 10.sp,
                            right: 10.sp,
                            top: 3.sp,
                            bottom: 15.sp),
                        margin: EdgeInsets.symmetric(
                            vertical: 5.sp, horizontal: 7.sp),
                        decoration: BoxDecoration(
                            color: ColorConstants.lightGreyColor,
                            borderRadius: BorderRadius.circular(4.sp)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HelperUtility.customText(
                                title: 'Size',
                                color: ColorConstants.blackColor,
                                fontSize: 9.sp,
                                textAlign: TextAlign.left,
                                fontWeight: FontWeight.w400),
                            SizedBox(
                              height: 5.sp,
                            ),
                            Text(
                              item.optionValues!.first.optionDisplayName ==
                                      "Size"
                                  ? item.optionValues!.first.label!
                                  : item.optionValues!.last.label!,
                              style: TextStyle(
                                  color: ColorConstants.blackColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500),
                            )
                            // DropdownButtonHideUnderline(
                            //   child: DropdownButton<String>(
                            //     value: choseSizeValue,
                            //
                            //     //elevation: 5,
                            //     style: const TextStyle(color: Colors.black),
                            //     isDense: true,
                            //     icon: Image.asset(AppImages.downwardIcon,
                            //         color: ColorConstants.blackColor),
                            //     isExpanded: true,
                            //
                            //     items: <String>[
                            //       'S',
                            //       'M',
                            //       'L',
                            //       'XL',
                            //       'XXL',
                            //     ].map<DropdownMenuItem<String>>((String value) {
                            //       return DropdownMenuItem(
                            //         value: value,
                            //         child: Text(value),
                            //       );
                            //     }).toList(),
                            //     hint: Text(
                            //       "One Size",
                            //       style: TextStyle(
                            //           color: ColorConstants.blackColor,
                            //           fontSize: 12.sp,
                            //           fontWeight: FontWeight.w500),
                            //     ),
                            //     onChanged: (String? value) {
                            //       setState(() {
                            //         choseSizeValue = value;
                            //       });
                            //     },
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 10.sp,
                            right: 10.sp,
                            top: 3.sp,
                            bottom: 15.sp),
                        margin: EdgeInsets.symmetric(
                            vertical: 5.sp, horizontal: 7.sp),
                        decoration: BoxDecoration(
                            color: ColorConstants.lightGreyColor,
                            borderRadius: BorderRadius.circular(4.sp)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HelperUtility.customText(
                                title: 'Quantity',
                                color: ColorConstants.blackColor,
                                fontSize: 9.sp,
                                textAlign: TextAlign.left,
                                fontWeight: FontWeight.w400),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<int>(
                                value:
                                    controller.currentVariantQuantity![index],
                                style: const TextStyle(color: Colors.black),
                                isDense: true,
                                icon: Image.asset(
                                  AppImages.downwardIcon,
                                  color: ColorConstants.blackColor,
                                ),
                                isExpanded: true,
                                items: List.generate(100, (index) => index++)
                                    .toList()
                                    .map<DropdownMenuItem<int>>((int value) {
                                  return DropdownMenuItem<int>(
                                    value: value,
                                    child: Text(value.toString()),
                                  );
                                }).toList(),
                                hint: Text(
                                  "One Size",
                                  style: TextStyle(
                                      color: ColorConstants.blackColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                onChanged: (int? value) {
                                  log(value.toString());
                                  if (value! > 0) {
                                    Map<String, dynamic> colorMap = {
                                      "option_id": item
                                          .optionValues!.first.optionId, //color
                                      "option_value":
                                          item.optionValues!.first.id
                                    };
                                    Map<String, dynamic> sizerMap = {
                                      "option_id": item
                                          .optionValues!.last.optionId, //color
                                      "option_value": item.optionValues!.last.id
                                    };
                                    controller.addProductVariant(
                                        [colorMap, sizerMap],
                                        value,
                                        item.productId.toString());
                                  }
                                  controller.updateIndex(value, index);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              } else {
                return Container();
              }
            } else {
              return Container();
            }
          });
    });
  }

  Widget variantListIsFromCart() {
    return GetBuilder<ShopController>(builder: (controller) {
      return ListView.builder(
          itemCount: _productVariantData != null
              ? _productVariantData!.data!.length
              : 0,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            if (widget.productOptions!.edges![colorIndex].node!.values!.edges!
                    .isNotEmpty &&
                _productWithHexColor != null) {
              var item = _productVariantData!.data![index];
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                // if(controller.itemIds[widget.index!] == null){
                // controller.addItemId(item.id!, widget.index!);
                // }
              });
              var tempVal = _productWithHexColor!.data!.site!.products!.edges!
                  .first.node!.productOptions!.edges!;
              var sizeItem = tempVal.first.node!.displayName == "Size"
                  ? tempVal.first.node!.values!.edges!.where((element) {
                      var temp =
                          _productVariantData!.data![index].optionValues!;
                      var tempId = temp.first.optionDisplayName == "Size"
                          ? temp.first.id
                          : temp.last.id;
                      return element.node!.entityId == tempId!;
                    })
                  : tempVal.last.node!.values!.edges!.where((element) {
                      var temp =
                          _productVariantData!.data![index].optionValues!;
                      var tempId = temp.first.optionDisplayName == "Size"
                          ? temp.first.id
                          : temp.last.id;
                      return element.node!.entityId == tempId!;
                    });
              var colorItem = tempVal.first.node!.displayName == "Color"
                  ? tempVal.first.node!.values!.edges!.where((element) {
                      var temp =
                          _productVariantData!.data![index].optionValues!;
                      var tempId = temp.first.optionDisplayName == "Color"
                          ? temp.first.id
                          : temp.last.id;
                      return element.node!.entityId == tempId!;
                    })
                  : tempVal.last.node!.values!.edges!.where((element) {
                      var temp =
                          _productVariantData!.data![index].optionValues!;
                      var tempId = temp.first.optionDisplayName == "Color"
                          ? temp.first.id
                          : temp.last.id;
                      return element.node!.entityId == tempId!;
                    });
              var hexCode = colorItem.isNotEmpty
                  ? colorItem.first.node!.hexColors!.first.toString().split('#')
                  : [];
              var secondHex = colorItem.isNotEmpty
                  ? colorItem.first.node!.hexColors!.length > 1
                      ? colorItem.first.node!.hexColors!.last
                          .toString()
                          .split('#')
                      : null
                  : null;

              // log(" ${widget.id}this is true or false ${widget.index}<<<<<<<<<<<<<<<<<<<<<<<<<<<< ${controller.itemIds.contains(widget.variantId)}");
              log("this is varient id<<<<<<<${widget.index}<<<<<<<<<<<<<<<<<<<<< ${widget.variantId}");
              log("this is item id <<<<<<<<<${widget.index}<<<<<<<<<<<<<<<<<<< ${item.id}");

              if (widget.isFromCart == true && item.id == widget.variantId) {
                // if (widget.qty != null) {
                //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                //     if (controller.currentVariantQuantity![index] == 0) {
                //       controller.updateIndex(widget.qty!,index);
                //     }
                //   });
                // }
                return Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 10.sp,
                            right: 23.sp,
                            top: 18.sp,
                            bottom: 15.sp),
                        margin: EdgeInsets.symmetric(vertical: 5.sp),
                        decoration: BoxDecoration(
                            color: ColorConstants.lightGreyColor,
                            borderRadius: BorderRadius.circular(4.sp)),
                        child: Row(
                          children: [
                            HelperUtility.customText(
                                title: 'Color',
                                color: ColorConstants.darkGreyColor,
                                fontSize: 12.sp,
                                textAlign: TextAlign.left,
                                fontWeight: FontWeight.w400),
                            const Spacer(),
                            if (secondHex == null)
                              Icon(
                                Icons.circle,
                                color: Color(hexCode.isNotEmpty
                                    ? int.parse("0xFF${hexCode[1]}")
                                    : 0),
                                size: 18.sp,
                              ),
                            if (secondHex != null)
                              MyCustomContainer(
                                progress: 0.5,
                                size: 18.sp,
                                backgroundColor:
                                    Color(int.parse("0xFF${hexCode[1]}")),
                                progressColor:
                                    Color(int.parse("0xFF${secondHex[1]}")),
                              ),
                            // Container(
                            //     height: 15,
                            //     width: 15,
                            //     decoration: BoxDecoration(
                            //         shape: BoxShape.circle,
                            //         gradient: LinearGradient(tileMode: TileMode.clamp,begin: Alignment.centerLeft,end: Alignment.centerRight,colors: [
                            //           Color(int.parse("0xFF${hexCode[1]}")),
                            //           Color(int.parse("0xFF${secondHex![1]}"))
                            //         ])))
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 10.sp,
                            right: 10.sp,
                            top: 3.sp,
                            bottom: 15.sp),
                        margin: EdgeInsets.symmetric(
                            vertical: 5.sp, horizontal: 7.sp),
                        decoration: BoxDecoration(
                            color: ColorConstants.lightGreyColor,
                            borderRadius: BorderRadius.circular(4.sp)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HelperUtility.customText(
                                title: 'Size',
                                color: ColorConstants.blackColor,
                                fontSize: 9.sp,
                                textAlign: TextAlign.left,
                                fontWeight: FontWeight.w400),
                            SizedBox(
                              height: 5.sp,
                            ),
                            Text(
                              sizeItem.first.node!.label!,
                              style: TextStyle(
                                  color: ColorConstants.blackColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500),
                            )
                            // DropdownButtonHideUnderline(
                            //   child: DropdownButton<String>(
                            //     value: choseSizeValue,
                            //
                            //     //elevation: 5,
                            //     style: const TextStyle(color: Colors.black),
                            //     isDense: true,
                            //     icon: Image.asset(AppImages.downwardIcon,
                            //         color: ColorConstants.blackColor),
                            //     isExpanded: true,
                            //
                            //     items: <String>[
                            //       'S',
                            //       'M',
                            //       'L',
                            //       'XL',
                            //       'XXL',
                            //     ].map<DropdownMenuItem<String>>((String value) {
                            //       return DropdownMenuItem(
                            //         value: value,
                            //         child: Text(value),
                            //       );
                            //     }).toList(),
                            //     hint: Text(
                            //       "One Size",
                            //       style: TextStyle(
                            //           color: ColorConstants.blackColor,
                            //           fontSize: 12.sp,
                            //           fontWeight: FontWeight.w500),
                            //     ),
                            //     onChanged: (String? value) {
                            //       setState(() {
                            //         choseSizeValue = value;
                            //       });
                            //     },
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 10.sp,
                            right: 10.sp,
                            top: 3.sp,
                            bottom: 15.sp),
                        margin: EdgeInsets.symmetric(
                            vertical: 5.sp, horizontal: 7.sp),
                        decoration: BoxDecoration(
                            color: ColorConstants.lightGreyColor,
                            borderRadius: BorderRadius.circular(4.sp)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HelperUtility.customText(
                                title: 'Quantity',
                                color: ColorConstants.blackColor,
                                fontSize: 9.sp,
                                textAlign: TextAlign.left,
                                fontWeight: FontWeight.w400),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<int>(
                                value: quantityIndex,
                                style: const TextStyle(color: Colors.black),
                                isDense: true,
                                icon: Image.asset(
                                  AppImages.downwardIcon,
                                  color: ColorConstants.blackColor,
                                ),
                                isExpanded: true,
                                items: List.generate(101, (index) => index++)
                                    .skip(1)
                                    .toList()
                                    .map<DropdownMenuItem<int>>((int value) {
                                  return DropdownMenuItem<int>(
                                    value: value,
                                    child: Text(value.toString()),
                                  );
                                }).toList(),
                                hint: Text(
                                  "One Size",
                                  style: TextStyle(
                                      color: ColorConstants.blackColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                onChanged: (int? value) {
                                  log(value.toString());
                                  if (value! > 0) {
                                    Map<String, dynamic> colorMap = {
                                      "option_id": item
                                          .optionValues!.first.optionId, //color
                                      "option_value":
                                          item.optionValues!.first.id
                                    };
                                    Map<String, dynamic> sizerMap = {
                                      "option_id": item
                                          .optionValues!.last.optionId, //color
                                      "option_value": item.optionValues!.last.id
                                    };
                                    controller.addProductVariant(
                                        [colorMap, sizerMap],
                                        value,
                                        item.productId.toString());
                                  }
                                  controller.updateQty(value, index);
                                  setState(() {
                                    quantityIndex = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              } else if (widget.isFromCart != true) {
                return Row(
                  children: [
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.only(
                          left: 10.sp, right: 23.sp, top: 18.sp, bottom: 15.sp),
                      margin: EdgeInsets.symmetric(vertical: 5.sp),
                      decoration: BoxDecoration(
                          color: ColorConstants.lightGreyColor,
                          borderRadius: BorderRadius.circular(4.sp)),
                      child: Row(
                        children: [
                          HelperUtility.customText(
                              title: 'Colors',
                              color: ColorConstants.darkGreyColor,
                              fontSize: 12.sp,
                              textAlign: TextAlign.left,
                              fontWeight: FontWeight.w400),
                          const Spacer(),
                          if (secondHex == null)
                            Icon(
                              Icons.circle,
                              color: Color(int.parse(
                                  "0xFF${hexCode.isNotEmpty ? hexCode[1] : 0}")),
                              size: 18.sp,
                            ),
                          if (secondHex != null)
                            MyCustomContainer(
                              progress: 0.5,
                              size: 18.sp,
                              backgroundColor:
                                  Color(int.parse("0xFF${hexCode[1]}")),
                              progressColor:
                                  Color(int.parse("0xFF${secondHex[1]}")),
                            ),
                          // Container(
                          //     height: 15,
                          //     width: 15,
                          //     decoration: BoxDecoration(
                          //         shape: BoxShape.circle,
                          //         gradient: LinearGradient(tileMode: TileMode.clamp,begin: Alignment.centerLeft,end: Alignment.centerRight,colors: [
                          //           Color(int.parse("0xFF${hexCode[1]}")),
                          //           Color(int.parse("0xFF${secondHex![1]}"))
                          //         ])))
                        ],
                      ),
                    )),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 10.sp,
                            right: 10.sp,
                            top: 3.sp,
                            bottom: 15.sp),
                        margin: EdgeInsets.symmetric(
                            vertical: 5.sp, horizontal: 7.sp),
                        decoration: BoxDecoration(
                            color: ColorConstants.lightGreyColor,
                            borderRadius: BorderRadius.circular(4.sp)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HelperUtility.customText(
                                title: 'Size',
                                color: ColorConstants.blackColor,
                                fontSize: 9.sp,
                                textAlign: TextAlign.left,
                                fontWeight: FontWeight.w400),
                            SizedBox(
                              height: 5.sp,
                            ),
                            Text(
                              item.optionValues!.first.optionDisplayName ==
                                      "Size"
                                  ? item.optionValues!.first.label!
                                  : item.optionValues!.last.label!,
                              style: TextStyle(
                                  color: ColorConstants.blackColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500),
                            )
                            // DropdownButtonHideUnderline(
                            //   child: DropdownButton<String>(
                            //     value: choseSizeValue,
                            //
                            //     //elevation: 5,
                            //     style: const TextStyle(color: Colors.black),
                            //     isDense: true,
                            //     icon: Image.asset(AppImages.downwardIcon,
                            //         color: ColorConstants.blackColor),
                            //     isExpanded: true,
                            //
                            //     items: <String>[
                            //       'S',
                            //       'M',
                            //       'L',
                            //       'XL',
                            //       'XXL',
                            //     ].map<DropdownMenuItem<String>>((String value) {
                            //       return DropdownMenuItem(
                            //         value: value,
                            //         child: Text(value),
                            //       );
                            //     }).toList(),
                            //     hint: Text(
                            //       "One Size",
                            //       style: TextStyle(
                            //           color: ColorConstants.blackColor,
                            //           fontSize: 12.sp,
                            //           fontWeight: FontWeight.w500),
                            //     ),
                            //     onChanged: (String? value) {
                            //       setState(() {
                            //         choseSizeValue = value;
                            //       });
                            //     },
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 10.sp,
                            right: 10.sp,
                            top: 3.sp,
                            bottom: 15.sp),
                        margin: EdgeInsets.symmetric(
                            vertical: 5.sp, horizontal: 7.sp),
                        decoration: BoxDecoration(
                            color: ColorConstants.lightGreyColor,
                            borderRadius: BorderRadius.circular(4.sp)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HelperUtility.customText(
                                title: 'Quantity',
                                color: ColorConstants.blackColor,
                                fontSize: 9.sp,
                                textAlign: TextAlign.left,
                                fontWeight: FontWeight.w400),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<int>(
                                value: shopController
                                    .currentVariantQuantity![index],
                                style: const TextStyle(color: Colors.black),
                                isDense: true,
                                icon: Image.asset(
                                  AppImages.downwardIcon,
                                  color: ColorConstants.blackColor,
                                ),
                                isExpanded: true,
                                items: List.generate(100, (index) => index++)
                                    .toList()
                                    .map<DropdownMenuItem<int>>((int value) {
                                  return DropdownMenuItem<int>(
                                    value: value,
                                    child: Text(value.toString()),
                                  );
                                }).toList(),
                                hint: Text(
                                  "One Size",
                                  style: TextStyle(
                                      color: ColorConstants.blackColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                onChanged: (int? value) {
                                  log(value.toString());
                                  if (value! > 0) {
                                    Map<String, dynamic> colorMap = {
                                      "option_id": item
                                          .optionValues!.first.optionId, //color
                                      "option_value":
                                          item.optionValues!.first.id
                                    };
                                    Map<String, dynamic> sizerMap = {
                                      "option_id": item
                                          .optionValues!.last.optionId, //color
                                      "option_value": item.optionValues!.last.id
                                    };
                                    shopController.addProductVariant(
                                        [colorMap, sizerMap],
                                        value,
                                        item.productId.toString());
                                  }
                                  shopController.updateIndex(value, index);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              } else {
                return Container();
              }
            } else {
              return Container();
            }
          });
    });
  }
}
