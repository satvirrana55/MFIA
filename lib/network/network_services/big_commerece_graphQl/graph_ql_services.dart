import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mi_studio/constants/prefs_key.dart';
import 'package:mi_studio/helper/helper_functions.dart';
import 'package:mi_studio/models/productWithHexColor.dart';
import 'package:mi_studio/models/search_result_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../constants/export.dart';
import '../../../main.dart';
import '../../../models/base_model.dart';
import '../../../models/products_model.dart';
import '../../utils/server_error.dart';
import 'graph_ql_client.dart';

class GraphQlServices {
  late Dio dio;
  late GraphQlClient graphQlClient;

  GraphQlServices() {
    dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    graphQlClient = GraphQlClient(dio);
  }

  Future<BaseModel<ProductsModel>> fetchProductFromUrl(
      BuildContext context, Map<String, dynamic> map) async {
    ProductsModel? productsModel;

    try {
      String? token = preferences!.getString(PrefsKey.bearerToken);
      productsModel = await graphQlClient.fetchProductFromUrl(
          "Bearer $token", 'application/json', map);
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
    return BaseModel()..data = productsModel;
  }

  Future<BaseModel<SearchResultModel>> searchItem(
      BuildContext context, Map<String, dynamic> map) async {
    SearchResultModel? productsModel;
    try {
      String? token = preferences!.getString(PrefsKey.bearerToken);
      productsModel =
          await graphQlClient.search("Bearer $token", 'application/json', map);
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
    return BaseModel()..data = productsModel;
  }

  Future<BaseModel<ProductWithHexColor>> fetchProductWithHexColor(
      BuildContext context, Map<String, dynamic> map) async {
    ProductWithHexColor? productsModel;
    try {
      String? token = preferences!.getString(PrefsKey.bearerToken);
      productsModel = await graphQlClient.productWithHexColor(
          "Bearer $token", 'application/json', map);
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
    return BaseModel()..data = productsModel;
  }
}
