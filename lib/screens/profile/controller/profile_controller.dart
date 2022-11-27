import 'dart:developer';
import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:language_picker/languages.dart';
import 'package:mi_studio/constants/export.dart';
import 'package:mi_studio/helper/helper_functions.dart';
import 'package:mi_studio/models/order_detail_model.dart';
import 'package:mi_studio/models/productWithHexColor.dart';
import 'package:mi_studio/models/product_variant_model.dart';
import 'package:mi_studio/models/user_data_model.dart';
import 'package:mi_studio/network/network_services/big_commerece_graphQl/graph_ql_services.dart';
import 'package:mi_studio/widgets/loader_dialog.dart';

import '../../../app_controller.dart';
import '../../../models/base_model.dart';
import '../../../models/orders_model.dart';
import '../../../network/network_services/big_commerece_http_apis/api_services.dart';

class ProfileController extends GetxController {
  UserDataModel? _userDataModel;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController lastNAmeNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
  File? imageFile;
  List<String> optionsList = [
    "orders",
    "shipping_and_return",
    //"payment_options",
    "addresses",
    "recently_viewed",
    "account_settings",
    "logout"
  ];
  CountryCode? pickedData;
  Language? selectedDialogLanguage;

  UserDataModel? get userData => _userDataModel;

  getUserData(UserDataModel? value) {
    _userDataModel = value;
    update();
  }

  updateCountry(CountryCode val) {
    pickedData = val;
    update();
  }

  updateLanguage(Language val) {
    selectedDialogLanguage = val;
    update();
  }

  final userDetail = Get.find<AppController>().userInfo;
  void initUserData() async {
    firstNameController.text =
        Get.find<AppController>().userInfo?.data![0].firstName ?? "";
    lastNameController.text =
        Get.find<AppController>().userInfo?.data![0].lastName ?? "";
    companyNameController.text =
        Get.find<AppController>().userInfo?.data![0].company ?? "";
    companyAddressController.text = "Company Address";
    stateController.text = "State";
    postalController.text = "456555";
    countryController.text = "Italy";
    languageController.text = "Italian";
    emailController.text =
        Get.find<AppController>().userInfo?.data![0].email ?? "";
    phoneNumberController.text =
        Get.find<AppController>().userInfo?.data![0].phone ?? "";
    vatController.text = "IT 12345678901";
    italianCompanyController.text = "A4707H7";
  }

  gteImageFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      update();
    }
  }

  Future<UserDataModel> updateUser(BuildContext context) async {
    var map = [
      {
        "email": emailController.text,
        "first_name": firstNameController.text,
        "last_name": lastNameController.text,
        "company": companyNameController.text,
        "phone": phoneNumberController.text,
        "notes": "tset abc",
        "tax_exempt_category": "qwerty",
        "customer_group_id": 0,
        "id": Get.find<AppController>().userInfo!.data![0].id,
        "addresses": [
          {
            "address1": "Test",
            "address2": "tset",
            "address_type": "wer",
            "city": "sdfvc",
            "company": companyAddressController.text,
            "country_code": countryController.text,
            "first_name": "Test",
            "last_name": "Abc",
            "phone": "1234567890",
            "postal_code": postalController.text,
            "state_or_province": "sas"
          }
        ],
        "authentication": {
          "force_password_reset": true,
          "new_password": "string123"
        },
        "accepts_product_review_abandoned_cart_emails": true,
        "store_credit_amounts": [
          {"amount": 43.15}
        ],
        "origin_channel_id":
            Get.find<AppController>().userInfo!.data![0].originChannelId,
        "channel_ids": [
          Get.find<AppController>().userInfo!.data![0].originChannelId
        ]
      }
    ];
    log("message: ${map.toString()}");
    BaseModel<UserDataModel> response =
        await ApiServices().updateUser(context, map);

    UserDataModel userDataModel = response.data!;
    Get.find<AppController>().userInfo = userDataModel;
    log("Update User: ${response.data!.data![0]}");

    // ignore: use_build_context_synchronously
    HelperFunctions.showDoneDialog(context, "Update User Success", "ok", () {
      Get.back();
    });

    //Get.offAll(() => const ProfileScreen());

    update();
    return userDataModel;
  }

  List<OrderModel>? orderDetailList;
  Future<void> allOrders(BuildContext context) async {
    LoaderDialog.showLoadingDialog(context);
    var response = await ApiServices().getAllOrders(
        Get.find<AppController>().userInfo!.data![0].id ?? 0, context);
    orderDetailList = response != null ? response.data! : null;
    Get.back();
    update();
  }

  List<OrderDetailsModel> orderDetail = [];

  Future<List<OrderDetailsModel>> orderDetails(
      BuildContext context, int id) async {
    BaseModel<List<OrderDetailsModel>> response =
        await ApiServices().orderDetails(id, context);
    orderDetail = response.data!;
    log('Order Details Response:- ${response.data!}');
    update();
    return response.data!;
  }

  ProductVariant? productVariantData;

  Future<void> getProductVariants(BuildContext context, String? id,
      {int? index}) async {
    BaseModel<ProductVariant> response =
        await ApiServices().fetchProductVariants(context, id!);
    productVariantData = response.data!;
  }

  List productList = [];

  List<ProductWithHexColor>? listData;
  ProductWithHexColor? productWithHexColor;

  late BaseModel<ProductWithHexColor> response;
  Future<void> productWithHexCode(
      BuildContext context, Map<String, dynamic> map) async {
    log('hello data');
    response = (await GraphQlServices().fetchProductWithHexColor(context, map));
    productWithHexColor = response.data;
    // ignore: use_build_context_synchronously
    await getProductVariants(
        context,
        productWithHexColor!.data!.site!.products!.edges![0].node?.entityId
            .toString());
    if (productList.isNotEmpty) {
      productList.clear();
      productList.add(response.data);
    } else {
      productList.add(response.data);
    }
    log('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%:3------- ${orderDetail.length}}');
    log('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%:3------- ${productList.length}}');

    log('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%:3------- ${productVariantData?.data!.length}}');

    update();
  }
}
