import 'dart:developer';

import 'package:intl/intl.dart';
import 'package:mi_studio/models/base_model.dart';
import 'package:mi_studio/models/productWithHexColor.dart' as a;
import 'package:mi_studio/models/products_model.dart';
import 'package:mi_studio/network/constants/graph_ql_query.dart';
import 'package:mi_studio/network/network_services/big_commerece_graphQl/graph_ql_services.dart';
import 'package:mi_studio/screens/search/search_controller/search_controller.dart';
import 'package:mi_studio/widgets/my_custom_container.dart';

import '../../../constants/export.dart';
import '../../shop/product_detail_screen.dart';

class SellerItem extends StatefulWidget {
  final ProductsEdge? item;
  final NumberFormat? format;
  final bool? isFromProductPage;

  const SellerItem({super.key, this.item, this.format, this.isFromProductPage});

  @override
  State<SellerItem> createState() => _SellerItemState();
}

class _SellerItemState extends State<SellerItem> {
  SearchController searchController = Get.put(SearchController());
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

  @override
  void initState() {
    log("<<<<<<<<00 ${widget.item!.node!.entityId}");
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      productWithHexCode(context, {
        "query": GraphQlQuery.productWithHexColorQuery(
            widget.item!.node!.entityId.toString())
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_productWithHexColor != null) {
      var tempVal = _productWithHexColor!
          .data!.site!.products!.edges!.first.node!.productOptions!.edges!;
      var colorItem = tempVal
          .where((element) => element.node!.displayName == "Color")
          .toList();

      // var secondHex = colorItem.isNotEmpty
      //     ? colorItem.first.node!.hexColors!.length > 1
      //     ? colorItem.first.node!.hexColors!.last
      //     .toString()
      //     .split('#')
      //     : null
      //     : null;
      return GestureDetector(
        onTap: () {
          if (widget.isFromProductPage == true) {
            log("Step 1 happeed");
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => ProductDetail(
                      edge: widget.item,
                      currencySymbol: widget.format!.currencySymbol,
                    )));
          } else {
            log("Step 3 happeed");
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductDetail(
                      edge: widget.item,
                      currencySymbol: widget.format!.currencySymbol,
                    )));
          }
          // Get.to(() => ProductDetail(
          //       edge: item,
          //       currencySymbol: format.currencySymbol,
          //     ));
          searchController.setRecentViewName(
            '${widget.item!.node!.sku}-${widget.item!.node!.name}',
          );
          searchController.setRecentViewImage(
              '${widget.item!.node!.images!.edges![0].node!.url}');
        },
        child: Container(
          width: 129.sp,
          padding: EdgeInsets.only(
            left: 15.sp,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 168.sp,
                width: 129.sp,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(widget
                            .item!.node!.images!.edges!.first.node!.url!))),
              ),
              SizedBox(
                height: 10.sp,
              ),
              HelperUtility.customText(
                  title: widget.item!.node!.name,
                  color: ColorConstants.blackColor,
                  fontSize: 10.sp,
                  textAlign: TextAlign.left,
                  textOverFlow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w500),
              SizedBox(
                height: 8.sp,
              ),
              SizedBox(
                height: 10,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: colorItem.first.node!.values!.edges!.length == 1
                        ? 1
                        : colorItem.first.node!.values!.edges!.isNotEmpty
                            ? colorItem.first.node!.values!.edges!.length
                            : 0,
                    itemBuilder: (context, index) {
                      log("<><><><><><> 12345 ${colorItem.length}");
                      var hexCode = colorItem.isNotEmpty
                          ? colorItem.first.node!.values!.edges![index].node!
                              .hexColors!.first
                              .toString()
                              .split('#')
                          : [];
                      var secondHex = colorItem.isNotEmpty
                          ? colorItem.first.node!.values!.edges![index].node!
                                      .hexColors!.length >
                                  1
                              ? colorItem.first.node!.values!.edges![index]
                                  .node!.hexColors!.last
                                  .toString()
                                  .split('#')
                              : null
                          : null;
                      return secondHex == null
                          ? Icon(
                              Icons.circle,
                              color: Color(hexCode.isNotEmpty
                                  ? int.parse("0xFF${hexCode[1]}")
                                  : 0),
                              size: 10,
                            )
                          : Container(
                              decoration:
                                  const BoxDecoration(shape: BoxShape.circle),
                              height: 10,
                              width: 10,
                              child: MyCustomContainer(
                                progress: 0.5,
                                size: 10.sp,
                                backgroundColor:
                                    Color(int.parse("0xFF${hexCode[1]}")),
                                progressColor:
                                    Color(int.parse("0xFF${secondHex[1]}")),
                              ),
                            );
                    }),
              ),
              SizedBox(
                height: 8.sp,
              ),
              Expanded(
                child: HelperUtility.customText(
                    title:
                        "${widget.format!.currencySymbol} ${widget.item!.node!.prices!.price!.value}",
                    color: ColorConstants.blackColor,
                    fontSize: 10.sp,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
