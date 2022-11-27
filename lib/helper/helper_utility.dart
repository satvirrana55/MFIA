// ignore_for_file: file_names

import 'dart:io';

import '../constants/export.dart';

class HelperUtility {
  static appBar({String? title, bool isLogin = false}) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: ColorConstants.whiteColor,
      title: Text(
        title!,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            color: ColorConstants.whiteColor,
            fontSize: 35.sp,
            fontFamily: "sf"),
      ),
      centerTitle: true,
      leading: InkWell(
          onTap: () {
            if (isLogin) {
              exit(0);
            } else {
              Get.back();
            }
          },
          child: Icon(
            Icons.arrow_back,
            color: ColorConstants.whiteColor,
          )),
    );
  }

  static transparentAppBar() {
    return AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: ColorConstants.whiteColor);
  }

  static Widget customText(
      {String? title,
      FontWeight? fontWeight,
      double? fontSize,
      Color? color,
      TextAlign? textAlign,
      TextOverflow? textOverFlow,
      int? maxLines}) {
    return Text(
      title!,
      style: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: color,
          fontFamily: "sf"),
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: textOverFlow,
    );
  }

  static commonAppBar(
      {String? title, bool isbottomTab = true, BuildContext? context}) {
    return AppBar(
      backgroundColor: ColorConstants.whiteColor,
      automaticallyImplyLeading: false,
      elevation: 0,
      centerTitle: false,
      flexibleSpace: Container(
        padding: EdgeInsets.only(top: 50.sp, left: 10.sp),
        child: Row(
          children: [
            isbottomTab == true
                ? GestureDetector(
                    onTap: () {
                      Navigator.pop(context!);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_outlined,
                      color: ColorConstants.blackColor,
                      size: 20.sp,
                    ))
                : SizedBox(
                    width: 15.sp,
                  ),
            SizedBox(
              width: 10.sp,
            ),
            HelperUtility.customText(
                title: title,
                color: ColorConstants.blackColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500),
          ],
        ),
      ),
    );
  }

  static showElevatedBackground(BuildContext context, Widget child) {
    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) => Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.symmetric(vertical: 10.sp),
              child: child,
            ));
  }

  static editButton({VoidCallback? onTap}) {
    return InkWell(
      onTap: () {
        onTap;
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.sp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
            border: Border.all(color: ColorConstants.blackColor, width: 2.sp)),
        child: Center(
          child: HelperUtility.customText(
              title: "Edit Cart",
              color: ColorConstants.blackColor,
              fontSize: 12.sp,
              textAlign: TextAlign.left,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
