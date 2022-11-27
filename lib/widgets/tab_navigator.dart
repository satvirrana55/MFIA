// import 'package:mi_studio/models/bottom_bar_item_model.dart';
// import 'package:mi_studio/screens/home/home_page.dart';
// import 'package:mi_studio/screens/shop/new_arrivals_screen.dart';
//
// import '../constants/export.dart';
// import '../screens/cart/cart_screen.dart';
// import '../screens/profile/profile_screen.dart';
// import '../screens/shop/shop_screen.dart';
//
// class BottomNavigationBarController extends StatefulWidget {
//   const BottomNavigationBarController({required Key key}) : super(key: key);
//
//   @override
//   _BottomNavigationBarControllerState createState() =>
//       _BottomNavigationBarControllerState();
// }
//
// class _BottomNavigationBarControllerState
//     extends State<BottomNavigationBarController>
//     with SingleTickerProviderStateMixin {
//   int _selectedIndex = 0;
//   final List<int> _history = [0];
//   final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
//   TabController? _tabController;
//   List<Widget>? mainTabs;
//   List<BuildContext?> navStack = [
//     null,
//     null
//   ]; // one buildContext for each tab to store history  of navigation
//
//   @override
//   void initState() {
//     _tabController = TabController(vsync: this, length: 2);
//     mainTabs = <Widget>[
//       Navigator(onGenerateRoute: (RouteSettings settings) {
//         return PageRouteBuilder(pageBuilder: (context, animiX, animiY) {
//           // use page PageRouteBuilder instead of 'PageRouteBuilder' to avoid material route animation
//           navStack[0] = context;
//           return const HomePage();
//         });
//       }),
//       Navigator(onGenerateRoute: (RouteSettings settings) {
//         return PageRouteBuilder(pageBuilder: (context, animiX, animiY) {
//           // use page PageRouteBuilder instead of 'PageRouteBuilder' to avoid material route animation
//           navStack[0] = context;
//           return const NewArrivals(isFromTab: true);
//         });
//       }),
//       Navigator(onGenerateRoute: (RouteSettings settings) {
//         return PageRouteBuilder(pageBuilder: (context, animiX, animiY) {
//           // use page PageRouteBuilder instead of 'PageRouteBuilder' to avoid material route animation
//           navStack[0] = context;
//           return const ShopScreen();
//         });
//       }),
//       Navigator(onGenerateRoute: (RouteSettings settings) {
//         return PageRouteBuilder(pageBuilder: (context, animiX, animiY) {
//           // use page PageRouteBuilder instead of 'PageRouteBuilder' to avoid material route animation
//           navStack[0] = context;
//           return const CartScreen();
//         });
//       }),
//       Navigator(onGenerateRoute: (RouteSettings settings) {
//         return PageRouteBuilder(pageBuilder: (context, animiX, animiY) {
//           // use page PageRouteBuilder instead of 'PageRouteBuilder' to avoid material route animation
//           navStack[0] = context;
//           return const ProfileScreen();
//         });
//       }),
//     ];
//     super.initState();
//   }
//
//   List screens = [
//     const HomePage(),
//     const NewArrivals(isFromTab: true),
//     const ShopScreen(),
//     const CartScreen(),
//     const ProfileScreen()
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: bottomCustomBar(),
//       body: Center(
//         child: screens[_selectedIndex],
//       ),
//     );
//   }
//
//   Widget bottomBar() {
//     List<BottomNavigationBarItem> items = List.generate(
//         bottomBarList.length,
//         (index) => BottomNavigationBarItem(
//             label: bottomBarList[index].title,
//             backgroundColor:
//                 _selectedIndex == index ? Colors.black : Colors.white,
//             icon: SvgPicture.asset(
//               bottomBarList[index].imagePath ?? "",
//               color: ColorConstants.blackColor,
//             ),
//             activeIcon: SvgPicture.asset(
//               bottomBarList[index].imagePath ?? "",
//               color: ColorConstants.whiteColor,
//             )));
//     return BottomNavigationBar(
//       items: items,
//       onTap: _onItemTapped,
//       type: BottomNavigationBarType.fixed,
//       currentIndex: _selectedIndex,
//       selectedItemColor: ColorConstants.whiteColor,
//       unselectedItemColor: ColorConstants.blackColor,
//       selectedLabelStyle: TextStyle(
//           fontSize: 12.sp,
//           fontWeight: FontWeight.w400,
//           color: ColorConstants.whiteColor),
//       unselectedLabelStyle: TextStyle(
//           fontSize: 12.sp,
//           fontWeight: FontWeight.w400,
//           color: ColorConstants.whiteColor),
//     );
//   }
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   Widget bottomCustomBar() {
//     return Container(
//         height: 55.h,
//         decoration: BoxDecoration(
//             border: Border(top: BorderSide(color: ColorConstants.greyColor))),
//         child: ListView.builder(
//             itemCount: bottomBarList.length,
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             scrollDirection: Axis.horizontal,
//             itemBuilder: (context, index) {
//               return GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     _selectedIndex = index;
//                   });
//                 },
//                 child: Container(
//                   width: 82.sp,
//                   padding: EdgeInsets.only(top: 9.sp),
//                   color: _selectedIndex == index
//                       ? ColorConstants.blackColor
//                       : ColorConstants.whiteColor,
//                   child: Column(
//                     children: [
//                       SvgPicture.asset(
//                         bottomBarList[index].imagePath ?? "",
//                         color: _selectedIndex == index
//                             ? ColorConstants.whiteColor
//                             : ColorConstants.blackColor,
//                       ),
//                       SizedBox(
//                         height: 3.4.sp,
//                       ),
//                       HelperUtility.customText(
//                           title: bottomBarList[index].title,
//                           fontSize: 12.sp,
//                           fontWeight: FontWeight.w400,
//                           color: _selectedIndex == index
//                               ? ColorConstants.whiteColor
//                               : ColorConstants.blackColor),
//                     ],
//                   ),
//                 ),
//               );
//             }));
//   }
// }
//
// class BottomNavigationBarRootItem {
//   final String routeName;
//   final NestedNavigator nestedNavigator;
//   final BottomNavigationBarItem bottomNavigationBarItem;
//
//   BottomNavigationBarRootItem({
//     required this.routeName,
//     required this.nestedNavigator,
//     required this.bottomNavigationBarItem,
//   });
// }
//
// abstract class NestedNavigator extends StatelessWidget {
//   final GlobalKey<NavigatorState> navigatorKey;
//
//   const NestedNavigator({required Key key, required this.navigatorKey})
//       : super(key: key);
// }
//
// class HomeNavigator extends NestedNavigator {
//   HomeNavigator(
//       {required Key key, required GlobalKey<NavigatorState> navigatorKey})
//       : super(
//           key: key,
//           navigatorKey: navigatorKey,
//         );
//
//   @override
//   Widget build(BuildContext context) {
//     return Navigator(
//       key: navigatorKey,
//       initialRoute: '/',
//       onGenerateRoute: (RouteSettings settings) {
//         WidgetBuilder builder;
//         switch (settings.name) {
//           case '/':
//             builder = (BuildContext context) => const HomePage();
//             break;
//           case '/home/1':
//             builder = (BuildContext context) => HomeSubPage();
//             break;
//           default:
//             throw Exception('Invalid route: ${settings.name}');
//         }
//         return MaterialPageRoute(
//           builder: builder,
//           settings: settings,
//         );
//       },
//     );
//   }
// }

import 'dart:developer';

import 'package:mi_studio/screens/home/home_page.dart';

import '../constants/export.dart';
import '../models/bottom_bar_item_model.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/cart/controller/cart_controller.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/shop/new_arrivals_screen.dart';
import '../screens/shop/shop_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _tabNavigator = GlobalKey<TabNavigatorState>();
  final _tab1 = GlobalKey<NavigatorState>();
  final _tab2 = GlobalKey<NavigatorState>();
  final _tab3 = GlobalKey<NavigatorState>();
  final _tab4 = GlobalKey<NavigatorState>();
  final _tab5 = GlobalKey<NavigatorState>();

  var _tabSelectedIndex = 0;
  var _tabPopStack = true;

  void _setIndex(index) {
    setState(() {
      _tabPopStack = _tabSelectedIndex == index;
      _tabSelectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // List<BottomNavigationBarItem> items = List.generate(
    //     bottomBarList.length,
    //     (index) => BottomNavigationBarItem(
    //         label: bottomBarList[index].title,
    //         backgroundColor:
    //             _tabSelectedIndex == index ? Colors.black : Colors.white,
    //         icon: SvgPicture.asset(
    //           bottomBarList[index].imagePath ?? "",
    //           color: ColorConstants.blackColor,
    //         ),
    //         activeIcon: SvgPicture.asset(
    //           bottomBarList[index].imagePath ?? "",
    //           color: ColorConstants.whiteColor,
    //         )));
    return WillPopScope(
      onWillPop: () async => !await _tabNavigator.currentState!.maybePop(),
      child: Scaffold(
        body: TabNavigator(
          key: _tabNavigator,
          tabs: <TabItem>[
            TabItem(_tab1, const HomePage()),
            TabItem(_tab2, const NewArrivals(isFromTab: true)),
            TabItem(_tab3, const ShopScreen()),
            TabItem(_tab4, const CartScreen()),
            TabItem(_tab5, const ProfileScreen()),
          ],
          selectedIndex: _tabSelectedIndex,
          popStack: _tabPopStack,
        ),
        bottomNavigationBar: bottomCustomBar(),
      ),
    );
  }

  Widget bottomCustomBar() {
    return FittedBox(
      fit: BoxFit.contain,
      child: Container(
          height: 55.h,
          width: .9.sw,
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
                      _tabSelectedIndex = index;
                    });
                  },
                  child: Container(
                    width: 75.sp,
                    padding: EdgeInsets.only(top: 9.sp),
                    color: _tabSelectedIndex == index
                        ? ColorConstants.blackColor
                        : ColorConstants.whiteColor,
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          bottomBarList[index].imagePath ?? "",
                          color: _tabSelectedIndex == index
                              ? ColorConstants.whiteColor
                              : ColorConstants.blackColor,
                        ),
                        SizedBox(
                          height: 3.4.sp,
                        ),
                        HelperUtility.customText(
                            title: bottomBarList[index].title!.tr,
                            maxLines: 1,
                            fontSize: 12.sp,
                            textOverFlow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w400,
                            color: _tabSelectedIndex == index
                                ? ColorConstants.whiteColor
                                : ColorConstants.blackColor),
                      ],
                    ),
                  ),
                );
              })),
    );
  }
}

class TabItem {
  final GlobalKey<NavigatorState> key;
  final Widget tab;

  const TabItem(this.key, this.tab);
}

class TabNavigator extends StatefulWidget {
  final List<TabItem> tabs;
  final int selectedIndex;
  final bool popStack;

  const TabNavigator({
    Key? key,
    required this.tabs,
    required this.selectedIndex,
    this.popStack = false,
  }) : super(key: key);

  @override
  TabNavigatorState createState() => TabNavigatorState();
}

class TabNavigatorState extends State<TabNavigator> {
  ///
  /// Try to pop widget, return true if popped
  ///
  ///
  final CartController _cartController = Get.put(CartController());
  Future<bool> maybePop() {
    return widget.tabs[widget.selectedIndex].key.currentState!.maybePop();
  }

  _popStackIfRequired(BuildContext context) async {
    log("<<<<<<<<<<<< savi123 ${widget.popStack}");
    if (widget.popStack) {
      widget.tabs[widget.selectedIndex].key.currentState
          ?.popUntil((route) => route.isFirst);
    }
  }

  @override
  Widget build(BuildContext context) {
    print('selectedIndex=${widget.selectedIndex}, popStack=${widget.popStack}');
    if (widget.selectedIndex == 3) {
      _cartController.fetchProducts(context);
    }

    _popStackIfRequired(context);

    return Stack(
      children: List.generate(widget.tabs.length, _buildTab),
    );
  }

  Widget _buildTab(int index) {
    return Offstage(
      offstage: widget.selectedIndex != index,
      child: Opacity(
        opacity: widget.selectedIndex == index ? 1.0 : 0.0,
        child: Navigator(
          key: widget.tabs[index].key,
          onGenerateRoute: (settings) => MaterialPageRoute(
            settings: settings,
            builder: (_) => widget.tabs[index].tab,
          ),
        ),
      ),
    );
  }
}
