import 'dart:developer';

import 'package:mi_studio/constants/export.dart';

class HelperFunctions {
  static String? emailValidator(String? value) {
    if (value!.isEmpty ||
        !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
      return "Enter a valid email address";
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return 'Password can not be empty';
    }
    return null;
  }

  static String? firstNameValidator(String? value) {
    if (value!.isEmpty) {
      return 'First Name can not be empty';
    }
    return null;
  }

  static String? lastNameValidator(String? value) {
    if (value!.isEmpty) {
      return 'Last Name can not be empty';
    }
    return null;
  }

  static String? companyNameValidator(String? value) {
    if (value!.isEmpty) {
      return 'Company Name can not be empty';
    }
    return null;
  }

  static String? companyAddressValidator(String? value) {
    if (value!.isEmpty) {
      return 'Company Address can not be empty';
    }
    return null;
  }

  static String? phoneNumberValidator(String? value) {
    if (value!.isEmpty) {
      return 'Phone Number can not be empty';
    }
    return null;
  }
  static String? addess1Validator(String? value) {
    if (value!.isEmpty) {
      return 'Address1 can not be empty';
    }
    return null;
  }

  static String? addess2Validator(String? value) {
    if (value!.isEmpty) {
      return 'Address2 can not be empty';
    }
    return null;
  }

  static String? validatePasswordStructure(String? value) {
    String pattern = r'^(?=.*?[a-z])(?=.*?[0-9]).{7,}$';
    RegExp regExp = RegExp(pattern);
    log(regExp.hasMatch(value!).toString());
    log(value.length.toString());
    if (regExp.hasMatch(value) == false) {
      return 'Passwords must be at least 7 characters and contain\nboth alphabetic and numeric characters';
    }
    return null;
  }

  static String? cityValidator(String? value) {
    if (value!.isEmpty) {
      return 'City can not be empty';
    }
    return null;
  }

  static String? stateValidator(String? value) {
    if (value!.isEmpty) {
      return 'State can not be empty';
    }
    return null;
  }

  static String? postalNumberValidator(String? value) {
    if (value!.isEmpty) {
      return 'Postal Code can not be empty';
    }
    return null;
  }

  static Future showDoneDialog(BuildContext context, String errorMessage,String buttonName,VoidCallback onTap) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.sp))),
          backgroundColor: ColorConstants.whiteColor.withOpacity(.85),
          contentTextStyle: CustomTextStyle.smallTextStyle
              .copyWith(fontSize: 15, fontWeight: FontWeight.w400),
          content: Text(errorMessage, textAlign: TextAlign.center),
          title: Image.asset(AppImages.tick, width: 38.sp, height: 33.sp),
          actions: [
            InkWell(onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Text(
                    buttonName,
                    style: CustomTextStyle.smallTextStyle
                        .copyWith(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  static showErrorDialog(BuildContext context, String errorMessage)  {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.sp))),
          backgroundColor: ColorConstants.whiteColor,
          contentTextStyle: CustomTextStyle.smallTextStyle
              .copyWith(fontSize: 18, fontWeight: FontWeight.w600),
          content: Text(errorMessage, textAlign: TextAlign.center),
          title: Image.asset(AppImages.error, width: 60.sp, height: 60.sp),
          actions: <Widget>[
            TextButton(
              child: Text(
                "ok",
                style: CustomTextStyle.smallTextStyle
                    .copyWith(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              onPressed: () {
               Get.back();
              },
            ),
          ],
        );
      },
    );
  }

  static showSnackMessage(String message, BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: CustomTextStyle.smallTextStyle,
      ),
      action: SnackBarAction(
        label: 'Ok',
        textColor: Theme.of(context).backgroundColor,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    ));
  }

  static customDialougeBox({context,
    String? title,
    String? subtitle,
    String ?buttonText,
    String ?logo}) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setstate) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(20.0)), //this right here
                child: Container(
                  height: 300.sp,
                  padding: EdgeInsets.only(top: 10.sp, left: 10.sp, right: 10.sp),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                              onTap: (){
                                Get.back();
                              },
                              child: Image.asset(AppImages.closeIcon))),
                      Image.asset(logo??""),
                      SizedBox(
                        height: 19.04.sp,
                      ),
                      HelperUtility.customText(
                          title: title,
                          fontWeight: FontWeight.w500,
                          color: ColorConstants.blackColor,
                          fontSize: 16.sp),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 52.sp,
                        ),
                        child: HelperUtility.customText(
                            title:
                            subtitle,
                            fontWeight: FontWeight.w400,
                            color: ColorConstants.blackColor,
                            fontSize: 10.sp,
                            textAlign: TextAlign.center),
                      ),
                      SizedBox(
                        height: 19.04.sp,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 17.sp, vertical: 7.sp),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r),
                            color: ColorConstants.lightGreyColor),
                        child: HelperUtility.customText(
                            title: buttonText,
                            color: ColorConstants.blackColor,
                            fontSize: 12.sp,
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w500),
                      ),

                    ],
                  ),
                ),
              );
            },
          );
        });
  }
  static transParentPopUp(BuildContext context,String text) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setstate) {
            return Dialog(
              backgroundColor: ColorConstants.whiteColor.withOpacity(0.8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)), //this right here
              child: Container(
                height: 1.sw * 0.5,
                padding: EdgeInsets.only(
                    top: 19.sp, left: 60.sp, right: 60.sp, bottom: 23.sp),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Image.asset(
                      AppImages.addCartLogo,
                    ),
                    SizedBox(
                      height: 13.sp,
                    ),
                    HelperUtility.customText(
                        title: text,
                        fontWeight: FontWeight.w500,
                        color: ColorConstants.blackColor,
                        fontSize: 15.sp),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}