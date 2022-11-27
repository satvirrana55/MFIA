import 'package:mi_studio/screens/shop/categories_screen.dart';

import '../../../constants/export.dart';
import '../home_controller.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Drawer(
          child: Column(
            children: [
              SizedBox(
                height: 52.sp,
              ),
              ListView.builder(
                  itemCount: controller.drawerOptionsList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        String url = controller.drawerOptionsList[index];

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CategoriesScreen(
                                      url: url,
                                    )));
                      },
                      child: Container(
                        padding: EdgeInsets.all(15.sp),
                        margin: EdgeInsets.only(left: 20.sp),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: ColorConstants.greyColor,
                                    width: 1))),
                        child: HelperUtility.customText(
                            title: controller.drawerOptionsList[index].tr,
                            color: ColorConstants.blackColor,
                            fontSize: 12.sp,
                            textAlign: TextAlign.left,
                            fontWeight: FontWeight.w500),
                      ),
                    );
                  }),
              const Spacer(
                flex: 1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 48.sp, vertical: 40),
                child: CustomButton(
                  title: 'Close',
                  callback: () {
                    controller.toggleDrawer();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
