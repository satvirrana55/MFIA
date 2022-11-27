import 'dart:developer';
import 'dart:io';

import 'package:mi_studio/constants/export.dart';
import 'package:mi_studio/screens/home/home_controller.dart';
import 'package:mi_studio/screens/shop/best_seller_screen.dart';
import 'package:mi_studio/screens/shop/product_detail_screen.dart';
import 'package:intl/intl.dart';
import 'package:substring_highlight/substring_highlight.dart';

import '../../models/products_model.dart';
import 'search_controller/search_controller.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  HomeController homeController = Get.put(HomeController());
  SearchController searchController = Get.put(SearchController());
  late TextEditingController searchTextController;
  late String searchHistoryLater;
  bool isSearching = false;

  @override
  void initState() {
    searchTextController = TextEditingController(text: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightGreyishColor,

      appBar: HelperUtility.commonAppBar(title: "app_bar_search".tr,context: context),

      body: body(context),
    );
  }

  Widget body(context) {
    return GetBuilder<SearchController>(
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 29.sp, vertical: 14.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  HelperUtility.showElevatedBackground(context, search());
                },
                child: TextField(
                  cursorColor: ColorConstants.blackColor,
                  enabled: false,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 4),
                      fillColor: ColorConstants.whiteColor,
                      filled: true,
                      hintText: "search_for_product".tr,
                      hintStyle: CustomTextStyle.smallTextStyle.copyWith(
                          fontSize: 12.sp, color: ColorConstants.darkGreyColor),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.sp),
                        borderSide:
                            BorderSide(color: ColorConstants.whiteColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.sp),
                        borderSide: BorderSide(
                          color: ColorConstants.whiteColor,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.sp),
                        borderSide:
                            BorderSide(color: ColorConstants.whiteColor),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.sp),
                        borderSide:
                            BorderSide(color: ColorConstants.whiteColor),
                      ),
                      suffixIcon: Padding(
                        padding: EdgeInsets.all(15.sp),
                        child: SvgPicture.asset(AppImages.searchIcon),
                      )),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Container(
                decoration: BoxDecoration(
                    color: ColorConstants.whiteColor,
                    borderRadius: BorderRadius.circular(4.r)),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 13.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.sp),
                      child: HelperUtility.customText(
                          title: "recent_Searches".tr,
                          color: ColorConstants.blackColor,
                          fontSize: 13.sp,
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    controller.searchHistoryList.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.searchHistoryList.length,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 1,
                                            color: index == -1
                                                ? ColorConstants.whiteColor
                                                : ColorConstants.greyColor))),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.sp, vertical: 11.sp),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        child: Container(
                                          height: 53.sp,
                                          width: 53.sp,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              image: DecorationImage(
                                                  image: NetworkImage(controller
                                                          .searchHistoryImageList[
                                                      index]),
                                                  fit: BoxFit.cover)),
                                        ),
                                        onTap: () async {
                                          setState(() {
                                            searchTextController =
                                                TextEditingController(
                                              text: controller
                                                  .searchHistoryList[index],
                                            );
                                          });
                                        },
                                      ),
                                      SizedBox(
                                        width: 8.sp,
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          child: HelperUtility.customText(
                                            title: controller
                                                .searchHistoryList[index],
                                            color: ColorConstants.downGreyColor,
                                            fontSize: 13.sp,
                                            textAlign: TextAlign.left,
                                            fontWeight: FontWeight.w400,
                                            textOverFlow: TextOverflow.visible,
                                          ),
                                          onTap: () {
                                            //  Get.to(() => const BestSeller());
                                            setState(() {
                                              searchTextController =
                                                  TextEditingController(
                                                text: controller
                                                    .searchHistoryList[index],
                                              );
                                            });
                                            HelperUtility
                                                .showElevatedBackground(
                                                    context, search());
                                          },
                                        ),
                                      ),
                                      InkWell(
                                        child: Icon(
                                          Icons.close,
                                          color: ColorConstants.downGreyColor,
                                          size: 20,
                                        ),
                                        onTap: () {
                                          controller.clearSearchHistoryList(
                                              controller
                                                  .searchHistoryList[index],
                                              controller.searchHistoryImageList[
                                                  index]);
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              );
                            })
                        : SizedBox(
                            child: Center(child: Text("no_data".tr)),
                          )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget search() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GetBuilder<SearchController>(builder: (controller) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: searchTextController,
                autofocus: true,
                cursorColor: ColorConstants.blackColor,
                onChanged: (val) async {
                  await controller.searchItems(context, val);
                  //controller.setRecentSearchHistory(val);
                },
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 20),
                    fillColor: ColorConstants.whiteColor,
                    filled: true,
                    hintText: "search_for_product".tr,
                    hintStyle: CustomTextStyle.smallTextStyle.copyWith(
                        fontSize: 12.sp, color: ColorConstants.darkGreyColor),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.sp),
                      borderSide: BorderSide(color: ColorConstants.whiteColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.sp),
                      borderSide: BorderSide(
                        color: ColorConstants.whiteColor,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.sp),
                      borderSide: BorderSide(color: ColorConstants.whiteColor),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.sp),
                      borderSide: BorderSide(color: ColorConstants.whiteColor),
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsets.all(15.sp),
                      child: GestureDetector(
                          onTap: () {
                            searchTextController.clear();
                            Get.back();
                          },
                          child: const Icon(Icons.close)),
                    )),
              ),
              SizedBox(
                height: 10.sp,
              ),
              controller.searchResultModel != null
                  ? searchTextController.text.isNotEmpty
                      ? Flexible(child: searchResult())
                      : Container()
                  : Container()
            ],
          );
        }),
      ),
    );
  }

  Widget searchResult() {
    return Container(
        color: ColorConstants.whiteColor,
        child: searchController.isSearching == false
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: searchController.searchResultModel!.data!.site!
                    .search!.searchProducts!.products!.edges!.length,
                itemBuilder: (context, index) {
                  var item = searchController.searchResultModel!.data!.site!
                      .search!.searchProducts!.products!.edges![index];
                  return searchTile(
                      item.node!.images!.edges!.first.node!.url.toString(),
                      item.node!.name!,
                      item);
                })
            : Container(
                height: 60.sp,
                width: 1.sw,
                color: Colors.white,
                child: Center(
                    child: CircularProgressIndicator(
                  color: ColorConstants.blackColor,
                )),
              ));
  }

  Widget searchTile(String imageUrl, String title, ProductsEdge edge) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: GestureDetector(
            onTap: () {
              Get.to(() => ProductDetail(
                    edge: edge,
                    currencySymbol: '\$',
                  ));
              searchController.setRecentSearchHistory(title);
              searchController.setHistoryViewImage(imageUrl);
            },
            child: Row(
              children: [
                Container(
                  height: 40.sp,
                  width: 40.sp,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(imageUrl), fit: BoxFit.fill)),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: SubstringHighlight(
                    text: title,
                    term: searchController.searchValue,
                    textStyle: const TextStyle(
                      color: Colors.black87,
                    ),
                    textStyleHighlight: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(
          thickness: 1,
          color: ColorConstants.greyColor,
        )
      ],
    );
  }
}
