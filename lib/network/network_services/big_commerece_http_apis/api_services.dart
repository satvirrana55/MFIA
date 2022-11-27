import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as https;
import 'package:mi_studio/helper/helper_functions.dart';
import 'package:mi_studio/models/CartBillingModel.dart';
import 'package:mi_studio/models/cart_shipping_model.dart';
import 'package:mi_studio/models/order_detail_model.dart';
import 'package:mi_studio/models/product_variant_model.dart';
import 'package:mi_studio/models/token_model.dart';
import 'package:mi_studio/models/user_data_model.dart';
import 'package:mi_studio/models/validate_user_model.dart';
import 'package:mi_studio/network/constants/network_config.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

import '../../../constants/export.dart';
import '../../../main.dart';
import '../../../models/base_model.dart';
import '../../../models/cart_data_model.dart';
import '../../../models/create_cart_model.dart';
import '../../utils/server_error.dart';
import 'api_client.dart';

class ApiServices {
  late Dio dio;
  late ApiClient apiClient;

  ApiServices() {
    dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    apiClient = ApiClient(dio);
  }

  Future<BaseModel<UserDataModel>> updateUser(
      BuildContext context, var map) async {
    UserDataModel response;
    try {
      response = await apiClient.updateUser(NetworkConfig.xAuthToken, map);
    } catch (error, stacktrace) {
      if (error is DioError) {
        Get.back();
        log(error.message);
        HelperFunctions.showErrorDialog(context, error.message);
        return BaseModel()..setException(ServerError.withError(error: error));
      }
      // showErrorMessage("Email Not Found", context);
      print("Exception occured: $error stackTrace: $stacktrace");

      return BaseModel()..setException(ServerError.withError(error: error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<ValidateUserModel>> validateUser(
      BuildContext context, Map<String, dynamic> map) async {
    ValidateUserModel response;
    try {
      response = await apiClient.validateUser(NetworkConfig.xAuthToken, map);
    } catch (error, stacktrace) {
      if (error is DioError) {
        Get.back();
        log(error.message);
        HelperFunctions.showErrorDialog(context, error.message);
        return BaseModel()..setException(ServerError.withError(error: error));
      }
      // showErrorMessage("Email Not Found", context);
      print("Exception occured: $error stackTrace: $stacktrace");

      return BaseModel()..setException(ServerError.withError(error: error));
    }
    return BaseModel()..data = response;
  }

  dynamic getAllOrders(int customerId, BuildContext context) async {
    //OrderListModel response;
    dynamic response;
    try {
      response = await (apiClient.getOrdersFromID(
          NetworkConfig.xAuthToken, "application/json", customerId));
      log('data12345: $response');
    } catch (error, stacktrace) {
      if (error is DioError) {
        return null;
        /* Navigator.of(navigatorKey.currentContext!, rootNavigator: true).pop();
        log(error.message);
        HelperFunctions.showErrorDialog(context, error.message); */

        // return BaseModel()..setException(ServerError.withError(error: error));
      }
      // showErrorMessage("Email Not Found", context);
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(ServerError.withError(error: error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<List<OrderDetailsModel>>> orderDetails(
      int orderId, BuildContext context) async {
    List<OrderDetailsModel>? response = [];
    try {
      //LoaderDialog.showLoadingDialog(context);
      response = await (apiClient.orderDetails(NetworkConfig.xAuthToken,
          "application/json", "application/json", orderId));

      log('data: ${response.toString()}');
    } catch (error, stacktrace) {
      if (error is DioError) {
        Get.back();
        log(error.message);
        HelperFunctions.showErrorDialog(context, error.message);
        return BaseModel()..setException(ServerError.withError(error: error));
      }
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(ServerError.withError(error: error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<CreateCartModel>> createCart(
      BuildContext context, Map<String, dynamic> map) async {
    CreateCartModel response;
    try {
      response = await apiClient.createCart(NetworkConfig.xAuthToken, map);
    } catch (error, stacktrace) {
      if (error is DioError) {
        Get.back();
        log(error.message+"<<<<<<<<<<<<<<<<<<<<<<<");
        HelperFunctions.showErrorDialog(
            context, 'This product does not have sufficient stock');
        return BaseModel()..setException(ServerError.withError(error: error));
      }
      // showErrorMessage("Email Not Found", context);
      print("Exception occured: $error stackTrace: $stacktrace");

      return BaseModel()..setException(ServerError.withError(error: error));
    }
    return BaseModel()..data = response;
  }
  Future<BaseModel<CreateCartModel>> addItemCart(
      BuildContext context, Map<String, dynamic> map,String id) async {
    CreateCartModel response;
    try {
      response = await apiClient.addCart(NetworkConfig.xAuthToken,id, map);
    } catch (error, stacktrace) {
      if (error is DioError) {

        log("<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
        Get.back();
        HelperFunctions.showErrorDialog(
            context, 'This product does not have sufficient stock');
        log(error.message);

        return BaseModel()..setException(ServerError.withError(error: error));
      }
      // showErrorMessage("Email Not Found", context);
      print("Exception occured: $error stackTrace: $stacktrace");

      return BaseModel()..setException(ServerError.withError(error: error));
    }
    return BaseModel()..data = response;
  }

  addToCart(BuildContext context, Map<String, dynamic> map, String? id) async {
    CreateCartModel response;
    try {
      var response = (await https.post(
          Uri.parse(
              'https://api.bigcommerce.com/stores/z5zid6mes9/v3/carts/$id/items'),
          headers: {"Authorization": NetworkConfig.xAuthToken},
          body: map));
      log("message: ${response.body}");
    } catch (error, stacktrace) {
      if (error is DioError) {
        Get.back();
        log(error.message);
        HelperFunctions.showErrorDialog(context, error.message);
        //return BaseModel()..setException(ServerError.withError(error: error));
      }
      // showErrorMessage("Email Not Found", context);
      print("Exception occured: $error stackTrace: $stacktrace");

      //return BaseModel()..setException(ServerError.withError(error: error));
    }
    //return BaseModel()..data = response;
  }

  Future<BaseModel<UserDataModel>> getUserData(
      int customerId, BuildContext context) async {
    UserDataModel response;
    try {
      response =
          await apiClient.getUserFromID(NetworkConfig.xAuthToken, customerId);
    } catch (error, stacktrace) {
      if (error is DioError) {
        Get.back();

        log(error.message);
        HelperFunctions.showErrorDialog(context, error.message);
        return BaseModel()..setException(ServerError.withError(error: error));
      }
      // showErrorMessage("Email Not Found", context);
      print("Exception occured: $error stackTrace: $stacktrace");

      return BaseModel()..setException(ServerError.withError(error: error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<UserDataModel>> createNewUser(
      BuildContext context, List<Map<String, dynamic>> map) async {
    UserDataModel response;
    try {
      response = await apiClient.createUser(NetworkConfig.xAuthToken, map);
    } catch (error, stacktrace) {
      if (error is DioError) {
        Get.back();
        log(error.message);
        HelperFunctions.showErrorDialog(context, error.message);
        return BaseModel()..setException(ServerError.withError(error: error));
      }
      // showErrorMessage("Email Not Found", context);
      print("Exception occured: $error stackTrace: $stacktrace");

      return BaseModel()..setException(ServerError.withError(error: error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<TokenModel>> generateToken(Map<String, dynamic> map) async {
    TokenModel? response;
    try {
      response = await apiClient.generateToke(NetworkConfig.xAuthToken, map);
    } catch (error, stacktrace) {
      if (error is DioError) {
        Get.back();
        log(error.message);
        HelperFunctions.showErrorDialog(Get.context!, error.message);
        return BaseModel()..setException(ServerError.withError(error: error));
      }
      // showErrorMessage("Email Not Found", context);
      print("Exception occured: $error stackTrace: $stacktrace");

      return BaseModel()..setException(ServerError.withError(error: error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<CartBillingModel>> createCartBilling(
      BuildContext context, Map<String, dynamic> map) async {
    CartBillingModel response;
    try {
      response = await apiClient.createBilling(NetworkConfig.xAuthToken, map);
    } catch (error, stacktrace) {
      if (error is DioError) {
        Get.back();
        log(error.message);
        HelperFunctions.showErrorDialog(context, error.message);
        return BaseModel()..setException(ServerError.withError(error: error));
      }
      // showErrorMessage("Email Not Found", context);
      print("Exception occured: $error stackTrace: $stacktrace");

      return BaseModel()..setException(ServerError.withError(error: error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<CartShippingModel>> createshipping(
      BuildContext context, List<Map<String, dynamic>> map) async {
    CartShippingModel response;
    try {
      response = await apiClient.createShipping(NetworkConfig.xAuthToken, map);
    } catch (error, stacktrace) {
      if (error is DioError) {
        Get.back();
        log(error.message);
        HelperFunctions.showErrorDialog(context, error.message);
        return BaseModel()..setException(ServerError.withError(error: error));
      }
      // showErrorMessage("Email Not Found", context);
      print("Exception occured: $error stackTrace: $stacktrace");

      return BaseModel()..setException(ServerError.withError(error: error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<ProductVariant>> fetchProductVariants(
      BuildContext context, String id) async {
    ProductVariant response;
    try {
      response =
          await apiClient.fetchProductVariants(NetworkConfig.xAuthToken, id);
    } catch (error, stacktrace) {
      if (error is DioError) {
        Get.back();
        log(error.message);
        HelperFunctions.showErrorDialog(context, error.message);
        return BaseModel()..setException(ServerError.withError(error: error));
      }
      // showErrorMessage("Email Not Found", context);
      print("Exception occured: $error stackTrace: $stacktrace");

      return BaseModel()..setException(ServerError.withError(error: error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<CartDataModel>> getCartInfo(
      String customerId, BuildContext context) async {
    CartDataModel response;
    try {
      response = await apiClient.getCartWithRedirectUrl(
          NetworkConfig.xAuthToken, customerId);
      log(response.toString());
    } catch (error, stacktrace) {
      if (error is DioError) {
        // Navigator.of(navigatorKey.currentContext!, rootNavigator: true).pop();

        log(error.message);
        // HelperFunctions.showErrorDialog(context, error.message);
        return BaseModel()..setException(ServerError.withError(error: error));
      }
      // showErrorMessage("Email Not Found", context);
      print("Exception occured: $error stackTrace: $stacktrace");

      return BaseModel()..setException(ServerError.withError(error: error));
    }
    return BaseModel()..data = response;
  }
  Future<BaseModel<CartDataModel>> updateCart(
      String customerId, BuildContext context,String productId,Map<String,dynamic> map) async {
    CartDataModel response;
    try {
      response = await apiClient.updateCartItem(
          NetworkConfig.xAuthToken, customerId,productId,map);
      log(response.toString());
    } catch (error, stacktrace) {
      if (error is DioError) {
        Get.back();

        log(error.message);
        HelperFunctions.showErrorDialog(context, error.message);
        return BaseModel()..setException(ServerError.withError(error: error));
      }
      // showErrorMessage("Email Not Found", context);
      print("Exception occured: $error stackTrace: $stacktrace");

      return BaseModel()..setException(ServerError.withError(error: error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<HttpResponse>> deleteItemsInCart(BuildContext context,
      String productId, String cartId) async {
    HttpResponse response;
    try {
      response = await apiClient.deleteCartItem(
          NetworkConfig.xAuthToken, cartId, productId);

    } catch (error, stacktrace) {
      if (error is DioError) {
        // Navigator.of(navigatorKey.currentContext!, rootNavigator: true).pop();

        log(error.message);
        HelperFunctions.showErrorDialog(context, error.message);
        return BaseModel()..setException(ServerError.withError(error: error));
      }
      // showErrorMessage("Email Not Found", context);
      print("Exception occured: $error stackTrace: $stacktrace");

      return BaseModel()..setException(ServerError.withError(error: error));
    }
    return BaseModel()..data = response;
  }
}
