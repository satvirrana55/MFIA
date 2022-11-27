import 'dart:ui';

import 'package:mi_studio/constants/export.dart';
import 'package:mi_studio/helper/helper_functions.dart';
import 'package:mi_studio/screens/cart/cart_billing.dart';
import 'package:mi_studio/screens/cart/component/custom_chheck_box.dart';
import 'package:mi_studio/screens/cart/controller/cart_controller.dart';

class CartShippingAddress extends StatefulWidget {
  const CartShippingAddress({Key? key}) : super(key: key);

  @override
  State<CartShippingAddress> createState() => _CartShippingAddressState();
}

class _CartShippingAddressState extends State<CartShippingAddress> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController adress2Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController stateCodeController = TextEditingController();
  TextEditingController countryCodeController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController postalController = TextEditingController();
  TextEditingController billingfirstNameController = TextEditingController();
  TextEditingController billinglastNameController = TextEditingController();
  TextEditingController billingemailController = TextEditingController();
  TextEditingController billingaddress1Controller = TextEditingController();
  TextEditingController billingcompanyAddressController = TextEditingController();
  TextEditingController billingphoneNumberController = TextEditingController();
  TextEditingController billingcountryCodeController = TextEditingController();
  TextEditingController billingstateController = TextEditingController();
  TextEditingController billingcityController = TextEditingController();
  TextEditingController billingpostalController = TextEditingController();

  CartController cartController = Get.find<CartController>();

  bool valuefirst = false;
  bool selected = false;
  bool isselected = true;
  int currentPos = 1;
  StepperType stepperType = StepperType.horizontal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HelperUtility.commonAppBar(title: 'Your Cart'),
      body: body(),
    );
  }

  Widget body() {
    return SafeArea(
        child: Container(
            width: 1.sw,
            padding: EdgeInsets.symmetric(horizontal: 25.sp),
            decoration: BoxDecoration(
                color: ColorConstants.whiteColor,
                border: Border(
                  bottom: BorderSide(width: 2, color: ColorConstants.greyColor),
                  top: BorderSide(width: 2, color: ColorConstants.greyColor),
                )),
            child: ListView(
              children: [
                // SizedBox(
                //   height: 22.sp,
                // ),
                // Container(
                //   height: 100,
                //   child: Expanded(
                //     child: Stepper(
                //       type: stepperType,
                //       physics: ScrollPhysics(),
                //       elevation: 0,
                //       currentStep: _currentStep,
                //       onStepTapped: (step) => tapped(step),
                //       onStepContinue: continued,
                //       onStepCancel: cancel,
                //       steps: <Step>[
                //         Step(
                //           title: new Text('order'),
                //           content: Container(),
                //           isActive: _currentStep >= 0,
                //           state: _currentStep >= 0
                //               ? StepState.complete
                //               : StepState.disabled,
                //         ),
                //         Step(
                //           title: new Text('Shipping'),
                //           content: Container(
                //           ),
                //           isActive: _currentStep >= 0,
                //           state: _currentStep >= 1
                //               ? StepState.complete
                //               : StepState.disabled,
                //         ),
                //         Step(
                //           title: new Text('Summary'),
                //           content: Container(),
                //           isActive: _currentStep >= 0,
                //           state: _currentStep >= 2
                //               ? StepState.complete
                //               : StepState.disabled,
                //         ),
                //         Step(
                //           title: new Text('Summary'),
                //           content: Container(),
                //           isActive: _currentStep >= 0,
                //           state: _currentStep >= 3
                //               ? StepState.complete
                //               : StepState.disabled,
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                Container(
                  height: 75.sp,

                  //color: Colors.grey.withOpacity(.5),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: 4,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return currentPos > index
                                      ? Row(
                                          children: [
                                            if (index != 0)
                                              Container(
                                                height: 2,
                                                width: 80,
                                                color: Colors.black,
                                              ),
                                            Container(
                                              height: 18,
                                              width: 18,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.black,
                                              ),
                                              child: const Center(
                                                  child: Icon(
                                                Icons.check,
                                                color: Colors.white,
                                                size: 15,
                                              )),
                                            ),
                                          ],
                                        )
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            if (index != 0)
                                              Container(
                                                height: 2.sp,
                                                width: 70,
                                                color: Colors.grey.shade700,
                                              ),
                                            Container(
                                              height: 18.sp,
                                              width: 18,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: Colors
                                                          .grey.shade700)),
                                              child: Center(
                                                child: Text(index.toString(),
                                                    style: TextStyle(
                                                        fontSize: 15.sp,
                                                        color: Colors
                                                            .grey.shade700)),
                                              ),
                                            ),
                                          ],
                                        );
                                }),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Order Details",
                                  style: TextStyle(
                                      fontSize: 9.sp, color: Colors.black),
                                ),
                                Text(
                                  "Shipping/Billing",
                                  style: TextStyle(
                                      fontSize: 9.sp, color: Colors.black),
                                ),
                                Text(
                                  "Summary",
                                  style: TextStyle(
                                      fontSize: 9.sp, color: Colors.black),
                                ),
                                Text(
                                  "Payment",
                                  style: TextStyle(
                                      fontSize: 9.sp, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                HelperUtility.customText(
                    title: "Shipping Address",
                    color: ColorConstants.blackColor,
                    fontSize: 16.sp,
                    textAlign: TextAlign.left,
                    fontWeight: FontWeight.w500),
                SizedBox(
                  height: 17.sp,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        validator: HelperFunctions.firstNameValidator,
                        controller: firstNameController,
                        hintText: "First Name",
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      CustomTextFormField(
                        validator: HelperFunctions.lastNameValidator,
                        controller: lastNameController,
                        hintText: "Last Name",
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      CustomTextFormField(
                        validator: HelperFunctions.emailValidator,
                        controller: emailController,
                        hintText: "Email Id",
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      CustomTextFormField(
                        validator: HelperFunctions.addess1Validator,
                        controller: address1Controller,
                        hintText: "Address1",
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      CustomTextFormField(
                        validator: HelperFunctions.addess2Validator,
                        controller: adress2Controller,
                        hintText: "Address2",
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      CustomTextFormField(
                        validator: HelperFunctions.cityValidator,
                        controller: cityController,
                        hintText: "City",
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      CustomTextFormField(
                        validator: HelperFunctions.stateValidator,
                        controller: stateController,
                        hintText: "State / Province",
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      CustomTextFormField(
                        controller: stateCodeController,
                        hintText: "State / Province Code",
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      CustomTextFormField(
                        controller: countryCodeController,
                        hintText: "Country Code",
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      CustomTextFormField(
                        validator: HelperFunctions.postalNumberValidator,
                        isNumeric: true,
                        controller: postalController,
                        hintText: "Postal Code",
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      CustomTextFormField(
                        validator: HelperFunctions.phoneNumberValidator,
                        isNumeric: true,
                        controller: phoneNumberController,
                        hintText: "Phone Number",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 26.sp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          selected = !selected;
                        });
                      },
                      child: Container(
                        height: 20.sp,
                        width: 20.sp,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.sp),
                            color: selected
                                ? ColorConstants.blackColor
                                : ColorConstants.whiteColor,
                            border: Border.all(
                                width: 2,
                                color: selected
                                    ? ColorConstants.whiteColor
                                    : ColorConstants.darkGreyColor)),
                        child: selected
                            ? const Center(
                                child: Icon(
                                  Icons.check,
                                  size: 18.0,
                                  color: Colors.white,
                                ),
                              )
                            : Container(),
                      ),
                    ),
                    SizedBox(
                      width: 10.sp,
                    ),
                    HelperUtility.customText(
                        title: "Save this address in my address book.",
                        color: ColorConstants.blackColor,
                        fontSize: 12.sp,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w400),
                  ],
                ),
                SizedBox(
                  height: 25.sp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isselected = !isselected;
                        });
                      },
                      child: Container(
                        height: 20.sp,
                        width: 20.sp,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.sp),
                            color: isselected
                                ? ColorConstants.blackColor
                                : ColorConstants.whiteColor,
                            border: Border.all(
                                width: 2,
                                color: isselected
                                    ? ColorConstants.whiteColor
                                    : ColorConstants.darkGreyColor)),
                        child: isselected
                            ?const Center(
                                child: Icon(
                                  Icons.check,
                                  size: 18.0,
                                  color: Colors.white,
                                ),
                              )
                            : Container(),
                      ),
                    ),
                    SizedBox(
                      width: 10.sp,
                    ),
                    Expanded(
                      child: HelperUtility.customText(
                          title:
                              "My billing address is the same as my shipping address.",
                          color: ColorConstants.blackColor,
                          fontSize: 12.sp,
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                SizedBox(
                  height: 33.sp,
                ),
                isselected
                    ? Container()
                    : Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HelperUtility.customText(
                            title: "Billing Address",
                            color: ColorConstants.blackColor,
                            fontSize: 16.sp,
                            textAlign: TextAlign.left,
                            fontWeight: FontWeight.w500),
                        SizedBox(
                          height: 17.sp,
                        ),
                        Form(
                            key: formKey,
                            child: Column(
                              children: [
                                CustomTextFormField(
                                  controller: billingfirstNameController,
                                  hintText: "First Name",
                                ),
                                SizedBox(
                                  height: 10.sp,
                                ),
                                CustomTextFormField(
                                  controller: billingfirstNameController,
                                  hintText: "Last Name",
                                ),
                                SizedBox(
                                  height: 10.sp,
                                ),
                                CustomTextFormField(
                                  controller: billingemailController,
                                  hintText: "Email Id",
                                ),
                                SizedBox(
                                  height: 10.sp,
                                ),
                                CustomTextFormField(
                                  controller: billingphoneNumberController,
                                  hintText: "Phone Number",
                                ),
                                SizedBox(
                                  height: 10.sp,
                                ),
                                CustomTextFormField(
                                  controller: billingaddress1Controller,
                                  hintText: "Company Address",
                                ),
                                SizedBox(
                                  height: 10.sp,
                                ),
                                CustomTextFormField(
                                  controller: billingcityController,
                                  hintText: "City",
                                ),
                                SizedBox(
                                  height: 10.sp,
                                ),
                                CustomTextFormField(
                                  controller: billingstateController,
                                  hintText: "State / Province",
                                ),
                                SizedBox(
                                  height: 10.sp,
                                ),
                                CustomTextFormField(
                                  isNumeric: true,
                                  controller: billingpostalController,
                                  hintText: "Postal Code",
                                ),
                                SizedBox(
                                  height: 10.sp,
                                ),
                                CustomTextFormField(
                                  controller: billingcountryCodeController,
                                  hintText: "Country Code",
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                HelperUtility.customText(
                    title: "Shipping Method",
                    color: ColorConstants.blackColor,
                    fontSize: 13.sp,
                    textAlign: TextAlign.left,
                    fontWeight: FontWeight.w500),
                SizedBox(
                  height: 8.sp,
                ),
                CustomTextFormField(
                  controller: cityController,
                  hintText:
                      "Please enter a shipping address in order to see shipping quotes",
                  isThreeLine: true,
                ),
                SizedBox(
                  height: 33.sp,
                ),
                HelperUtility.customText(
                    title: "Order Comments",
                    color: ColorConstants.blackColor,
                    fontSize: 13.sp,
                    textAlign: TextAlign.left,
                    fontWeight: FontWeight.w500),
                SizedBox(
                  height: 88.sp,
                ),
                CustomButton(
                    title: "Continue",
                    callback: () {
                      //createNewShipping();
                      if (_formKey.currentState!.validate()) {
                        cartController.createbelling(
                            context,
                            firstNameController.text,
                            lastNameController.text,
                            emailController.text,
                            address1Controller.text,
                            adress2Controller.text,
                            cityController.text,
                            stateController.text,
                            stateCodeController.text,
                            countryCodeController.text,
                            postalController.text,
                            phoneNumberController.text);
                      }

                    }),
                SizedBox(
                  height: 24.sp,
                ),
              ],
            )));
  }

  unFocusNode() {
    // emailFocusNode.unfocus();
    // passwordFocusNode.unfocus();
  }

// void createBilling() async {
//   cartController.CreateBilling(context,
//       email: italianCompanyController.text,
//       address1: companyAddressController.text,
//       city: cityController.text,
//       address2: companyAddressController.text,
//       countryCode: "In",
//       firstName: firstNameController.text,
//       lastName: lastNameController.text,
//       phone: phoneNumberController.text,
//       postalCode: postalController.text,
//       state: stateController.text);
// }

// List<Step> getSteps() => [
//       Step(
//           state: currentStep > 0 ? StepState.complete : StepState.indexed,
//           isActive: currentStep >= 0,
//           title: Text("Order Details"),
//           content: Container()),
//       Step(title: Text("Order Details"), content: Container()),
//       Step(title: Text("Order Details"), content: Container())
//     ];

  void createNewShipping() async {
    cartController.createShipping(context,
        email: billingemailController.text,
        address: billingaddress1Controller.text,
        city: billingcityController.text,
        countryCode:billingcountryCodeController.text,
        firstName: billingfirstNameController.text,
        lastName:  billinglastNameController.text,
        phone:  billingphoneNumberController.text,
        postalCode:  billingpostalController.text,
        fieldId:"field_25" ,
        fieldValue: "Great!",
        itemId: "5aeda044-2751-4e09-86da-dcf446c64717",
        state:  billingstateController.text);
  }



}
