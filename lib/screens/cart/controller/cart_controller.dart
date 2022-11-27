import 'dart:developer';

import 'package:mi_studio/constants/export.dart';
import 'package:mi_studio/main.dart';
import 'package:mi_studio/models/cart_data_model.dart';
import 'package:mi_studio/models/cart_shipping_model.dart';
import 'package:mi_studio/screens/shop/controller/shop_controller.dart';

import '../../../constants/prefs_key.dart';
import '../../../helper/helper_functions.dart';
import '../../../models/CartBillingModel.dart';
import '../../../models/base_model.dart';
import '../../../models/product_variant_model.dart';
import '../../../network/network_services/big_commerece_http_apis/api_services.dart';
import '../../../widgets/loader_dialog.dart';
import '../cart_billing.dart';

class CartController extends GetxController {
  String? value = "";
  bool? isCreditCard = false;
  bool? isPayPal = false;
  bool? isTestPayment = false;

  bool isselected = false;
  // CartModel? cartInfo;
  
  void ischeck(bool ischeck) {
    ischeck = !ischeck;
    update();
  }



  void createShipping(
    BuildContext context, {
    String? email,
    String? firstName,
    String? lastName,
    String? address,
    String? city,
    String? state,
    String? stateCode,
    String? postalCode,
    String? phone,
    String? countryCode,
    String? fieldId,
    String? fieldValue,
    String? itemId,
  }) async {
    Map<String, dynamic> map = {
      "address": {
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "address1": address,
        "city": city,
        "state_or_province": state,
        "state_or_province_code": stateCode,
        "postal_code": postalCode,
        "phone": phone,
        "country_code": countryCode,
        "custom_fields": [
          {"field_id": fieldId, "field_value": fieldValue}
        ]
      },
      "line_items": [
        {"item_id": itemId, "quantity": 1}
      ]
    };
    List<Map<String, dynamic>> mapList = [map];
    LoaderDialog.showLoadingDialog(context);
    BaseModel<CartShippingModel> response =
        await ApiServices().createshipping(context, mapList);
    log(cartShippingModelToJson(response.data!));
    CartShippingModel cartShippingModel =
        cartShippingModelFromJson(cartShippingModelToJson(response.data!));
    Navigator.of(context).push(MaterialPageRoute(builder: (contex)=>CartBillling()));

    // if (cartShippingModel.data!) {
    //   profileController.getUserData(userDataModel);
    //   preferences!
    //       .setString(PrefsKey.userInfo, userDataModelToJson(response.data!));
    //   Get.back();
    //
    //   Get.offAll(() => const BottomNavigationScreen());
    // } else {
    //   Get.back();
    //   HelperFunctions.showErrorDialog(context, "Something went wrong");
    // }
  }

  Future<CartBillingModel> letscartBilling(BuildContext context,
      {String? firstName,
      String? lastName,
      String? email,
      String? address1,
      String? address2,
      String? city,
      String? state,
      String? stateCode,
      String? countryCode,
      String? postalCode,
      String? phone}) async {
    Map<String, dynamic> map = {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "address1": address1,
      "address2": address2,
      "city": city,
      "state_or_province": state,
      "state_or_province_code": stateCode,
      "country_code": countryCode,
      "postal_code": postalCode,
      "phone": phone
    };
    BaseModel<CartBillingModel> response =
        await ApiServices().createCartBilling(context, map);
    return response.data!;
  }

  void createbelling(
      BuildContext context,
      String? firstName,
      String? lastName,
      String? email,
      String? address1,
      String? address2,
      String? city,
      String? state,
      String? stateCode,
      String? countryCode,
      String? postalCode,
      String? phone) async {
    //validation check
    // loaderInit
    //LoaderDialog.showLoadingDialog(context);
    // get response from api class
    CartBillingModel response = await letscartBilling(context,
        firstName: firstName,
        lastName: lastName,
        email: email,
        address1: address1,
        address2: address2,
        city: city,
        state: state,
        stateCode: stateCode,
        postalCode: postalCode,
        phone: phone);
    if (response.data != null) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (contex) => CartBillling()));
    }
    //log(response.customerId.toString());
    // check if user is valid
    // if (response.data == true) {
    //   // CartBillingModel cartBillingModel =
    //   // await getUserData(response.customerId!, context);
    //   // log(userDataModelToJson(userDataModel));
    //   preferences!
    //       .setString(
    //       PrefsKey.userInfo, cartBillingModelToJson(CartBillingModel()));
    //   // profileController.getUserData(userDataModel);
    //   // Get.back();
    //
    //   Get.offAll(() => const CartBillling());
    //   {
    //     Get.back();
    //     HelperFunctions.showErrorDialog(
    //         context, 'The username or password you entered is incorrect');
    //   }
    // }

    // void CreateBilling(
    //   BuildContext context, {
    //   String? firstName,
    //   String? lastName,
    //   String? email,
    //   String? address1,
    //   String? address2,
    //   String? city,
    //   String? state,
    //   String? stateCode,
    //   String? countryCode,
    //   String? postalCode,
    //   String? phone,
    // }) async {
    //   Map<String, dynamic> map = {
    //     "first_name": firstName,
    //     "last_name": lastName,
    //     "email": email,
    //     "address1": address1,
    //     "address2": address2,
    //     "city": city,
    //     "state_or_province": state,
    //     "state_or_province_code": stateCode,
    //     "country_code": countryCode,
    //     "postal_code": postalCode,
    //     "phone": phone
    //   };
    //   List<Map<String, dynamic>> mapList = [map];
    //   LoaderDialog.showLoadingDialog(context);
    //   BaseModel<CartBillingModel> response =
    //       await ApiServices().createCartBilling(context, mapList);
    //   log(cartBillingModelToJson(response.data!));
    //   CartBillingModel cartBillingModel =
    //   cartBillingModelFromJson(cartBillingModelToJson(response.data!));
    //   // if (cartBillingModel.data!.isNotEmpty) {
    //   //   profileController.getUserData(userDataModel);
    //   //   preferences!
    //   //       .setString(PrefsKey.userInfo, cartBillingModelToJson(response.data!));
    //     Get.back();
    //
    //     Get.offAll(() => const BottomNavigationScreen());
    //   }
    //   // else {
    //   //   Get.back();
    //   //   HelperFunctions.showErrorDialog(context, "Something went wrong");
    //   // }
  }

  CartDataModel? _cartDetails;

  CartDataModel? get cartDetails => _cartDetails;

  List<ProductVariant?>? get productVariantList => List.generate(
      _cartDetails!.data!.lineItems!.physicalItems!.length, (index) => null);

  Future<void> fetchProducts(BuildContext context) async {
    // LoaderDialog.showLoadingDialog(context);
    BaseModel<CartDataModel> response = await ApiServices().getCartInfo(
        preferences!.getString(PrefsKey.cartId).toString(), context);
    if (response.data != null) {
      _cartDetails = response.data!;
      update();
    }
    else{
      _cartDetails = null;
      update();
    }
    // Get.back();
    // Navigator.pop(context);
  }
  clearCart(){
    _cartDetails = null;
    update();
  }

  removeProducts(int index,BuildContext context) {
    _cartDetails!.data!.lineItems!.physicalItems!.removeAt(index);
    update();
  }


  updateProducts(int index,BuildContext context,String productId,String cartId,Map<String,dynamic> map,int qty) async {
    ShopController shopController = Get.put(ShopController());
    LoaderDialog.showLoadingDialog(context);
    await ApiServices()
        .updateCart(cartId, context, productId, map)
        .then((value) {
      if (value.data != null) {
        _cartDetails = value.data!;
        Get.back();
        HelperFunctions.transParentPopUp(context, "Your product is updated");
        update();
      }
      else{
        // log("this is my quantity ${qty}");
        // log("this is my quantity ${index}");
        // log("this is my current ${shopController.currentVariantQuantity![index]}");
        // shopController.updateIndex(qty, index);
        Get.back();
      }
    });

  }

  addProductVariant(int index, ProductVariant element) {
    productVariantList!.insert(index, element);
    update();
  }
}
