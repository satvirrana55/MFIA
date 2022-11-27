import 'package:mi_studio/constants/export.dart';
import 'package:mi_studio/screens/cart/cart_screen.dart';
import 'package:mi_studio/screens/home/home_page.dart';
import 'package:mi_studio/screens/shop/new_arrivals_screen.dart';
import 'package:mi_studio/screens/shop/shop_screen.dart';

import '../../models/bottom_bar_item_model.dart';
import '../profile/profile_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int selectedIndex = 0;
  List screens = [
    const HomePage(),
    const NewArrivals(isFromTab: true),
    const ShopScreen(),
    const CartScreen(),
    const ProfileScreen()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomCustomBar(),
      body: Center(
        child: screens[selectedIndex],
      ),
    );
  }

  Widget bottomBar() {
    List<BottomNavigationBarItem> items = List.generate(
        bottomBarList.length,
        (index) => BottomNavigationBarItem(
            label: bottomBarList[index].title,
            backgroundColor:
                selectedIndex == index ? Colors.black : Colors.white,
            icon: SvgPicture.asset(
              bottomBarList[index].imagePath ?? "",
              color: ColorConstants.blackColor,
            ),
            activeIcon: SvgPicture.asset(
              bottomBarList[index].imagePath ?? "",
              color: ColorConstants.whiteColor,
            )));
    return BottomNavigationBar(
      items: items,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      selectedItemColor: ColorConstants.whiteColor,
      unselectedItemColor: ColorConstants.blackColor,
      selectedLabelStyle: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: ColorConstants.whiteColor),
      unselectedLabelStyle: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: ColorConstants.whiteColor),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget bottomCustomBar() {
    return Container(
        height: 55.h,
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: ColorConstants.greyColor))),
        child: ListView.builder(
            itemCount: bottomBarList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  width: 82.sp,
                  padding: EdgeInsets.only(top: 9.sp),
                  color: selectedIndex == index
                      ? ColorConstants.blackColor
                      : ColorConstants.whiteColor,
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        bottomBarList[index].imagePath ?? "",
                        color: selectedIndex == index
                            ? ColorConstants.whiteColor
                            : ColorConstants.blackColor,
                      ),
                      SizedBox(
                        height: 3.4.sp,
                      ),
                      HelperUtility.customText(
                          title: bottomBarList[index].title?.tr,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: selectedIndex == index
                              ? ColorConstants.whiteColor
                              : ColorConstants.blackColor),
                    ],
                  ),
                ),
              );
            }));
  }
}
