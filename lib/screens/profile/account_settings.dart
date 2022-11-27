import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:language_picker/language_picker.dart';
import 'package:language_picker/languages.dart';
import 'package:mi_studio/constants/export.dart';
import 'package:mi_studio/screens/profile/controller/profile_controller.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({Key? key}) : super(key: key);

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  ProfileController profileController = Get.find<ProfileController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    profileController.initUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightGreyishColor,
      appBar: HelperUtility.commonAppBar(
          title: "app_bar_name_profile".tr, context: context),
      body: body(),
    );
  }

  Widget body() {
    return SafeArea(child: GetBuilder<ProfileController>(
      builder: (controller) {
        return SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 29.sp, vertical: 30.sp),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        profileController.gteImageFromGallery();
                      },
                      child: Center(
                        child: Stack(
                          children: [
                            Container(
                              height: 100.sp,
                              width: 100.sp,
                              decoration: const BoxDecoration(
                                  color: Colors.blue, shape: BoxShape.circle),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: profileController.imageFile == null
                                      ? Image.asset(
                                          AppImages.profileImage,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.file(
                                          File(profileController
                                              .imageFile!.path),
                                          fit: BoxFit.cover,
                                        )),
                            ),
                            Container(
                              height: 25.sp,
                              width: 25.sp,
                              margin: EdgeInsets.only(left: 80.sp, top: 60.sp),
                              decoration: BoxDecoration(
                                  color: ColorConstants.blackColor,
                                  shape: BoxShape.circle),
                              child: Icon(
                                Icons.camera_alt,
                                color: ColorConstants.whiteColor,
                                size: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8.sp,
                    ),
                    CommonTextField(
                        labelText: "first_name".tr,
                        controller: controller.firstNameController),
                    SizedBox(
                      height: 8.sp,
                    ),
                    CommonTextField(
                        labelText: "last_name".tr,
                        controller: controller.lastNameController),
                    SizedBox(
                      height: 8.sp,
                    ),
                    CommonTextField(
                        labelText: "company_name".tr,
                        controller: controller.companyNameController),
                    SizedBox(
                      height: 8.sp,
                    ),
                    CommonTextField(
                        labelText: "company_address".tr,
                        controller: controller.companyAddressController),
                    SizedBox(
                      height: 8.sp,
                    ),
                    CommonTextField(
                        labelText: "state_provience".tr,
                        controller: controller.stateController),
                    SizedBox(
                      height: 8.sp,
                    ),
                    CommonTextField(
                        labelText: "postal_code".tr,
                        controller: controller.postalController),
                    SizedBox(
                      height: 8.sp,
                    ),
                    Container(
                        height: 50.sp,
                        width: 1.sw,
                        padding: EdgeInsets.only(left: 10.sp, top: 5.sp),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: ColorConstants.whiteColor),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HelperUtility.customText(
                                title: 'select_country'.tr,
                                fontWeight: FontWeight.w400,
                                color: ColorConstants.darkGreyColor,
                                fontSize: 9.sp),
                            Expanded(
                              child: Row(
                                children: [
                                  controller.pickedData != null
                                      ? HelperUtility.customText(
                                          title: controller.pickedData!.name!,
                                          fontWeight: FontWeight.w400,
                                          color: ColorConstants.blackColor,
                                          fontSize: 12.sp)
                                      : HelperUtility.customText(
                                          title: "India",
                                          fontWeight: FontWeight.w400,
                                          color: ColorConstants.blackColor,
                                          fontSize: 12.sp),
                                  const Spacer(),
                                  CountryCodePicker(
                                    showDropDownButton: false,
                                    alignLeft: false,
                                    padding: EdgeInsets.zero,
                                    showFlag: true,
                                    showCountryOnly: true,
                                    onChanged: (val) {
                                      controller.updateCountry(val);
                                    },
                                    hideMainText: true,
                                    initialSelection: '+91',
                                    showFlagDialog: true,
                                    favorite: const ['+91'],
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: ColorConstants.darkGreyColor,
                                  ),
                                  SizedBox(width: 10.sp),
                                ],
                              ),
                            )
                          ],
                        )),
                    SizedBox(
                      height: 8.sp,
                    ),
                    Container(
                        height: 50.sp,
                        width: 1.sw,
                        padding: EdgeInsets.only(left: 10.sp, top: 5.sp),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: ColorConstants.whiteColor),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HelperUtility.customText(
                                title: 'select_language'.tr,
                                fontWeight: FontWeight.w400,
                                color: ColorConstants.darkGreyColor,
                                fontSize: 9.sp),
                            Row(
                              children: [
                                controller.selectedDialogLanguage != null
                                    ? HelperUtility.customText(
                                        title: controller
                                            .selectedDialogLanguage!.name,
                                        fontWeight: FontWeight.w400,
                                        color: ColorConstants.blackColor,
                                        fontSize: 12.sp)
                                    : HelperUtility.customText(
                                        title: 'Hindi',
                                        fontWeight: FontWeight.w400,
                                        color: ColorConstants.blackColor,
                                        fontSize: 12.sp),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    _openLanguagePickerDialog();
                                  },
                                  child: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: ColorConstants.darkGreyColor,
                                  ),
                                ),
                                SizedBox(width: 10.sp),
                              ],
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 8.sp,
                    ),
                    CommonTextField(
                        labelText: "email".tr,
                        controller: controller.emailController),
                    SizedBox(
                      height: 8.sp,
                    ),
                    CommonTextField(
                        labelText: "phone _number".tr,
                        controller: controller.phoneNumberController),
                    SizedBox(
                      height: 8.sp,
                    ),
                    CommonTextField(
                        labelText: "vat_number".tr,
                        controller: controller.vatController),
                    SizedBox(
                      height: 8.sp,
                    ),
                    CommonTextField(
                        labelText: "codice_univoco".tr,
                        controller: controller.italianCompanyController),
                    SizedBox(
                      height: 8.sp,
                    ),
                    CustomButton(
                        title: "update_account_button".tr,
                        callback: () {
                          profileController.updateUser(context);
                        })
                  ],
                ),
              )),
        );
      },
    ));
  }

  void _openLanguagePickerDialog() => showDialog(
        context: context,
        builder: (context) => Theme(
            data: Theme.of(context).copyWith(primaryColor: Colors.pink),
            child: LanguagePickerDialog(
                titlePadding: const EdgeInsets.all(8.0),
                searchCursorColor: Colors.pinkAccent,
                searchInputDecoration: InputDecoration(hintText: 'search'.tr),
                isSearchable: true,
                title: Text("select_your_language".tr),
                onValuePicked: (Language language) async {
                  if (language.isoCode == 'en') {
                    var locale = const Locale('en');
                    await Get.updateLocale(locale);
                  } else if (language.isoCode == 'it') {
                    var locale = const Locale('it');
                    await Get.updateLocale(locale);
                  } else if (language.isoCode == 'hi') {
                    var locale = const Locale('hi');
                    await Get.updateLocale(locale);
                  } else {
                    var locale = const Locale('en');
                    await Get.updateLocale(locale);
                  }
                  profileController.updateLanguage(language);
                },
                itemBuilder: _buildDialogItem)),
      );

  Widget _buildDialogItem(Language language) => Row(
        children: <Widget>[
          Text(language.name),
          const SizedBox(width: 8.0),
          Flexible(child: Text("(${language.isoCode})"))
        ],
      );
}
