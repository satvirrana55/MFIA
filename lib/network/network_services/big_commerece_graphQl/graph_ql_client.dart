import 'package:dio/dio.dart';
import 'package:mi_studio/models/productWithHexColor.dart';
import 'package:mi_studio/models/products_model.dart';
import 'package:mi_studio/models/search_result_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../constants/network_config.dart';

part 'graph_ql_client.g.dart';

@RestApi(baseUrl: NetworkConfig.graphQlUrl)
abstract class GraphQlClient {
  factory GraphQlClient(Dio dio) {
    dio.options = BaseOptions(receiveTimeout: 50000, connectTimeout: 50000);
    return _GraphQlClient(dio, baseUrl: NetworkConfig.graphQlUrl);
  }

  @POST("graphql")
  Future<ProductsModel> fetchProductFromUrl(
      @Header("Authorization") String token,
      @Header("Content-Type") String contentType,
      @Body() Map<String, dynamic> map);

  @POST("graphql")
  Future<SearchResultModel> search(
      @Header("Authorization") String token,
      @Header("Content-Type") String contentType,
      @Body() Map<String, dynamic> map);

  @POST("graphql")
  Future<ProductWithHexColor> productWithHexColor(
      @Header("Authorization") String token,
      @Header("Content-Type") String contentType,
      @Body() Map<String, dynamic> map);


}
