import 'dart:developer';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:mi_studio/constants/export.dart';
import 'package:mi_studio/models/base_model.dart';
import 'package:mi_studio/models/products_model.dart';
import 'package:mi_studio/screens/home/components/seller_Item.dart';
import 'package:mi_studio/screens/home/home_controller.dart';
import 'package:mi_studio/screens/search/search_controller/search_controller.dart';
import 'package:mi_studio/screens/shop/product_detail_screen.dart';

import '../../../models/productWithHexColor.dart';
import '../../../network/network_services/big_commerece_graphQl/graph_ql_services.dart';

class BestSellerList extends StatelessWidget {
  final ProductsModel? productsModel;

  BestSellerList({Key? key, this.productsModel}) : super(key: key);
  HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      if (controller.bestSeller != null) {
        return SizedBox(
          height: 250.sp,
          width: 1.sw,
          child: ListView.builder(
              itemCount: controller
                  .bestSeller!.data!.site!.route!.node!.products!.edges!.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                var item = controller.bestSeller!.data!.site!.route!.node!
                    .products!.edges![index];
                var format = NumberFormat.simpleCurrency(
                    locale: Platform.localeName,
                    name: item.node!.prices!.price!.currencyCode!);

                return SellerItem(item: item, format: format);
              }),
        );
      } else {
        return Container();
      }
    });
  }

  // Widget bestSellerItem(BuildContext context, var item, NumberFormat format) {
  //
  //
  //   return GestureDetector(
  //     onTap: () {
  //       Navigator.of(context).push(MaterialPageRoute(
  //           builder: (context) => ProductDetail(
  //                 edge: item,
  //                 currencySymbol: format.currencySymbol,
  //               )));
  //       // Get.to(() => ProductDetail(
  //       //       edge: item,
  //       //       currencySymbol: format.currencySymbol,
  //       //     ));
  //       searchController.setRecentViewName(
  //         '${item.node!.sku}-${item.node!.name}',
  //       );
  //       searchController
  //           .setRecentViewImage('${item.node!.images!.edges![0].node!.url}');
  //     },
  //     child: Container(
  //       width: 129.sp,
  //       padding: EdgeInsets.only(
  //         left: 15.sp,
  //       ),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Container(
  //             height: 168.sp,
  //             width: 129.sp,
  //             decoration: BoxDecoration(
  //                 image: DecorationImage(
  //                     fit: BoxFit.fill,
  //                     image: NetworkImage(
  //                         item.node!.images!.edges!.first.node!.url!))),
  //           ),
  //           SizedBox(
  //             height: 10.sp,
  //           ),
  //           HelperUtility.customText(
  //               title: item.node!.name,
  //               color: ColorConstants.blackColor,
  //               fontSize: 10.sp,
  //               textAlign: TextAlign.left,
  //               textOverFlow: TextOverflow.ellipsis,
  //               fontWeight: FontWeight.w500),
  //           SizedBox(
  //             height: 8.sp,
  //           ),
  //           const Icon(
  //             Icons.circle,
  //             color: Color.fromRGBO(240, 197, 194, 1),
  //             size: 10,
  //           ),
  //           SizedBox(
  //             height: 8.sp,
  //           ),
  //           Expanded(
  //             child: HelperUtility.customText(
  //                 title:
  //                     "${format.currencySymbol} ${item.node!.prices!.price!.value}",
  //                 color: ColorConstants.blackColor,
  //                 fontSize: 10.sp,
  //                 textAlign: TextAlign.center,
  //                 fontWeight: FontWeight.w500),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
