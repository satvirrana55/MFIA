import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dialog.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:language_picker/language_picker_dialog.dart';
import 'package:language_picker/languages.dart';
import 'package:mi_studio/constants/export.dart';
import 'package:mi_studio/helper/helper_functions.dart';
import 'package:mi_studio/screens/auth/auth_controller/auth_controller.dart';
import 'package:mi_studio/screens/auth/login_screen.dart';
import 'package:mi_studio/screens/profile/controller/profile_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController companyAddressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController vatController = TextEditingController();
  TextEditingController italianCompanyController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postalController = TextEditingController();
  CountryCode? pickedData;
  AuthController authController = Get.find<AuthController>();
  ProfileController profileController = Get.find<ProfileController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Country country =
      Country(isoCode: 'IT', iso3Code: 'IT', phoneCode: '39', name: 'Italy');
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      body: body(),
    );
  }

// TODO: validate all fields as not null except vat number and italian company field.
  Widget body() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: GetBuilder<AuthController>(builder: (controller) {
          return Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80.sp,
                ),
                FadeAnimation(
                    delay: 1,
                    child: Hero(
                        tag: 'logo',
                        transitionOnUserGestures: false,
                        child: Image.asset(
                          AppImages.appLogo,
                          width: 111.sp,
                          height: 39.sp,
                        ))),
                HelperUtility.customText(
                    title: "B2B_App".toString(),
                    color: ColorConstants.blackColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600),
                SizedBox(
                  height: 40.sp,
                ),
                Center(
                  child: HelperUtility.customText(
                      title: "create_new_account".tr,
                      color: ColorConstants.blackColor,
                      fontSize: 18.sp,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 6.sp,
                ),
                HelperUtility.customText(
                    title: "fill_the_details",
                    color: ColorConstants.darkGreyColor,
                    fontSize: 12.sp,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w300),
                SizedBox(
                  height: 12.sp,
                ),
                CustomTextFormField(
                    controller: firstNameController,
                    hintText: "first_name".tr,
                    validator: HelperFunctions.firstNameValidator),
                SizedBox(
                  height: 12.sp,
                ),
                CustomTextFormField(
                    controller: lastNameController,
                    hintText: "last_name".tr,
                    validator: HelperFunctions.lastNameValidator),
                SizedBox(
                  height: 12.sp,
                ),
                CustomTextFormField(
                    controller: companyNameController,
                    hintText: "company_name".tr,
                    validator: HelperFunctions.companyNameValidator),
                SizedBox(
                  height: 12.sp,
                ),
                CustomTextFormField(
                    controller: companyAddressController,
                    hintText: "company_address".tr,
                    validator: HelperFunctions.companyAddressValidator),
                SizedBox(
                  height: 12.sp,
                ),
                CustomTextFormField(
                    controller: stateController,
                    hintText: "state_provience".tr,
                    validator: HelperFunctions.stateValidator),
                SizedBox(
                  height: 12.sp,
                ),
                CustomTextFormField(
                    controller: cityController,
                    hintText: "city".tr,
                    validator: HelperFunctions.cityValidator),
                SizedBox(
                  height: 12.sp,
                ),
                CustomTextFormField(
                    controller: postalController,
                    validator: HelperFunctions.postalNumberValidator,
                    isNumeric: true,
                    hintText: "postal_code".tr),
                SizedBox(
                  height: 12.sp,
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Theme(
                          data: Theme.of(context)
                              .copyWith(primaryColor: Colors.pink),
                          child: CountryPickerDialog(
                              titlePadding: EdgeInsets.all(8.0),
                              searchCursorColor: Colors.pinkAccent,
                              searchInputDecoration:
                                  InputDecoration(hintText: "search".tr),
                              isSearchable: true,
                              title: Text("select_phone_code".tr),
                              onValuePicked: (Country val) =>
                                  setState(() => country = val),
                              // itemFilter: (c) => ['AR', 'DE', 'GB', 'CN'].contains(c.isoCode),
                              priorityList: [
                                // CountryPickerUtils.getCountryByIsoCode('TR'),
                                CountryPickerUtils.getCountryByIsoCode('US'),
                              ],
                              itemBuilder: _buildDropdownItem)),
                    );
                    // showCountryPicker(
                    //   context: context,
                    //   //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
                    //   exclude: <String>['KN', 'MF'],
                    //   favorite: <String>['SE'],
                    //   //Optional. Shows phone code before the country name.
                    //   showPhoneCode: true,
                    //   onSelect: (Country country) {
                    //     print('Select country: ${country.displayName}');
                    //   },
                    //   // Optional. Sets the theme for the country list picker.
                    //   countryListTheme: CountryListThemeData(
                    //     // Optional. Sets the border radius for the bottomsheet.
                    //     borderRadius: const BorderRadius.only(
                    //       topLeft: Radius.circular(40.0),
                    //       topRight: Radius.circular(40.0),
                    //     ),
                    //     // Optional. Styles the search field.
                    //     inputDecoration: InputDecoration(
                    //       labelText: 'Search',
                    //       hintText: 'Start typing to search',
                    //       prefixIcon: const Icon(Icons.search),
                    //       border: OutlineInputBorder(
                    //         borderSide: BorderSide(
                    //           color: const Color(0xFF8C98A8).withOpacity(0.2),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // );
                  },
                  child: Container(
                    height: 50.sp,
                    width: 1.sw,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: ColorConstants.lightGreyColor),
                    child: Row(
                      children: [
                        SizedBox(width: 10.sp),
                        country.name.isNotEmpty
                            ? HelperUtility.customText(
                                title: country.name,
                                fontWeight: FontWeight.w700,
                                color: ColorConstants.blackColor,
                                fontSize: 15.sp)
                            : HelperUtility.customText(
                                title: "select_country".tr,
                                fontWeight: FontWeight.w400,
                                color: ColorConstants.darkGreyColor,
                                fontSize: 12.sp),
                        const Spacer(flex: 2),
                        CountryPickerUtils.getDefaultFlagImage(country),
                        const Icon(
                          Icons.arrow_drop_down_sharp,
                          size: 30,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 25.sp),
                        // CountryPickerDropdown(
                        //
                        //   itemBuilder: _buildDropdownItem,
                        //
                        //   priorityList:[
                        //     CountryPickerUtils.getCountryByIsoCode('GB'),
                        //     CountryPickerUtils.getCountryByIsoCode('CN'),
                        //   ],
                        //   sortComparator: (Country a, Country b) => a.isoCode.compareTo(b.isoCode),
                        //   onValuePicked: (Country country) {
                        //
                        //   },
                        // )

                        // CountryCodePicker(enabled: false,
                        //   showDropDownButton: true,
                        //   alignLeft: false,
                        //   padding: EdgeInsets.zero,
                        //   showFlag: true,
                        //   showCountryOnly: true,
                        //   onChanged: (val) {
                        //     controller.updateCountry(val);
                        //   },
                        //   hideMainText: true,
                        //   initialSelection: '+39',
                        //   showFlagDialog: true,
                        //   favorite: const ['+39'],
                        // ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.sp,
                ),
                GestureDetector(
                  onTap: () {
                    _openLanguagePickerDialog();
                  },
                  child: Container(
                    height: 50.sp,
                    width: 1.sw,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: ColorConstants.lightGreyColor),
                    child: Row(
                      children: [
                        SizedBox(width: 10.sp),
                        controller.selectedDialogLanguage != null
                            ? HelperUtility.customText(
                                title: controller.selectedDialogLanguage!.name,
                                fontWeight: FontWeight.w700,
                                color: ColorConstants.blackColor,
                                fontSize: 15.sp)
                            : HelperUtility.customText(
                                title: "select_language".tr,
                                fontWeight: FontWeight.w400,
                                color: ColorConstants.darkGreyColor,
                                fontSize: 12.sp),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_drop_down_sharp,
                          size: 30,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 25.sp),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.sp,
                ),
                CustomTextFormField(
                    controller: userNameController,
                    hintText: "email".tr,
                    validator: HelperFunctions.emailValidator),
                SizedBox(
                  height: 12.sp,
                ),
                CustomTextFormField(
                    controller: passwordController,
                    onTap: () {},
                    hasIcon: true,
                    onTapIcon: () {
                      toggleEye();
                    },
                    hintText: "password".tr,
                    validator: HelperFunctions.validatePasswordStructure,
                    isObscureText: isPasswordVisible),
                SizedBox(
                  height: 12.sp,
                ),
                CustomTextFormField(
                    controller: phoneNumberController,
                    isNumeric: true,
                    validator: HelperFunctions.phoneNumberValidator,
                    hintText: "phone_number".tr),
                SizedBox(
                  height: 12.sp,
                ),
                CustomTextFormField(
                    controller: vatController, hintText: "vat_number".tr),
                SizedBox(
                  height: 12.sp,
                ),
                CustomTextFormField(
                    controller: italianCompanyController,
                    hintText: "codice".tr),
                SizedBox(
                  height: 12.sp,
                ),
                captcha(),
                SizedBox(
                  height: 12.sp,
                ),
                termsAndCondition(),
                SizedBox(
                  height: 12.sp,
                ),
                CustomButton(
                  title: "sign_up".tr,
                  callback: () {
                    if (_formKey.currentState!.validate()) {
                      registerNewUser();
                    } else if (authController.pickedData == null) {}
                  },
                ),
                SizedBox(
                  height: 15.sp,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "already_have_an_account".tr,
                      style: CustomTextStyle.smallTextStyle.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w300,
                          color: ColorConstants.darkGreyColor)),
                  TextSpan(
                      text: "sign_in".tr,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.offAll(() => const LoginScreen()),
                      style: CustomTextStyle.smallTextStyle.copyWith(
                          fontSize: 12.sp, fontWeight: FontWeight.w600)),
                ])),
                SizedBox(
                  height: 50.sp,
                )
              ],
            ),
          );
        }),
      ),
    );
  }

  // method to open dialog box to pick language
  void _openLanguagePickerDialog() => showDialog(
        context: context,
        builder: (context) => Theme(
            data: Theme.of(context).copyWith(primaryColor: Colors.pink),
            child: LanguagePickerDialog(
                titlePadding: const EdgeInsets.all(8.0),
                searchCursorColor: Colors.pinkAccent,
                searchInputDecoration: InputDecoration(hintText: "search".tr),
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
                  authController.updateLanguage(language);
                },
                itemBuilder: _buildDialogItem)),
      );

// It's sample code of Dialog Item.
  Widget _buildDialogItem(Language language) => Row(
        children: <Widget>[
          Text(language.name),
          const SizedBox(width: 8.0),
          Flexible(child: Text("(${language.isoCode})"))
        ],
      );

  Widget captcha() {
    return Container(
      width: 1.sw,
      decoration: BoxDecoration(
          color: ColorConstants.lightGreyColor,
          boxShadow: [
            BoxShadow(
              color: ColorConstants.lightGreyColor,
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(color: ColorConstants.greyColor)),
      child: Row(children: [
        Checkbox(
            value: authController.isCaptcha,
            activeColor: ColorConstants.blackColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.r)),
            side: BorderSide(
                width: 1,
                color: ColorConstants.blackColor,
                style: BorderStyle.solid),
            onChanged: (val) {
              authController.updateCaptcha(val!);
            }),
        HelperUtility.customText(
            title: "i_am_not_a_robot".tr,
            color: ColorConstants.blackColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(AppImages.captcha),
        )
      ]),
    );
  }

  Widget termsAndCondition() {
    return Row(
      children: [
        Checkbox(
            value: authController.isTermsAccepted,
            activeColor: ColorConstants.blackColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.r)),
            side: BorderSide(
                width: 1,
                color: ColorConstants.blackColor,
                style: BorderStyle.solid),
            onChanged: (val) {
              authController.updateTerms(val!);
            }),
        HelperUtility.customText(
            title: "i_accept_all".tr,
            color: ColorConstants.blackColor,
            fontWeight: FontWeight.w400,
            fontSize: 12.sp),
        HelperUtility.customText(
            title: "terms_and_conditions".tr,
            color: Colors.blue,
            fontWeight: FontWeight.w400,
            fontSize: 12.sp)
      ],
    );
  }

  // TODO: connect all text-fields with nodes and mark then un-focus on button tap
  unFocusAllNodes() {}

  void registerNewUser() async {
    authController.createUser(context,
        password: passwordController.text,
        email: userNameController.text,
        address: companyAddressController.text,
        city: cityController.text,
        company: companyAddressController.text,
        countryCode: country.isoCode,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        phone: phoneNumberController.text,
        postalCode: postalController.text,
        state: stateController.text);
  }

  Widget _buildDropdownItem(Country val) => Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(val),
          const SizedBox(
            width: 8.0,
          ),
          Text("+${val.phoneCode}(${val.name})",
              overflow: TextOverflow.ellipsis),
        ],
      );

  void toggleEye() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }
}
