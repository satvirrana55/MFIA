import 'package:dio/dio.dart';
import 'package:mi_studio/models/CartBillingModel.dart';
import 'package:mi_studio/models/cart_shipping_model.dart';
import 'package:mi_studio/models/create_cart_model.dart';

import 'package:mi_studio/models/orders_model.dart';

import 'package:mi_studio/models/orders_data_model.dart';

import 'package:mi_studio/models/product_variant_model.dart';
import 'package:mi_studio/models/token_model.dart';
import 'package:mi_studio/models/user_data_model.dart';
import 'package:mi_studio/models/validate_user_model.dart';
import 'package:mi_studio/network/constants/network_config.dart';
import 'package:retrofit/retrofit.dart';

import '../../../models/cart_data_model.dart';
import '../../../models/order_detail_model.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: NetworkConfig.apiBaseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio) {
    dio.options = BaseOptions(receiveTimeout: 50000, connectTimeout: 50000);
    return _ApiClient(dio, baseUrl: NetworkConfig.apiBaseUrl);
  }

  @PUT("v3/customers")
  Future<UserDataModel> updateUser(
      @Header("X-Auth-Token") String token, @Body() var map);

  @GET("v2/orders")

  Future<List<OrderModel>> getOrdersFromID(@Header("X-Auth-Token") String token,

      @Header("Accept") String accept, @Query('customer_id') int customerId);

  @GET("v2/orders/{id}/products")
  Future<List<OrderDetailsModel>> orderDetails(
      @Header("X-Auth-Token") String token,
      @Header("Accept") String accept,
      @Header("Accept") String contentType,
      @Path("id") int id);

  @POST("v3/customers/validate-credentials")
  Future<ValidateUserModel> validateUser(
      @Header("X-Auth-Token") String token, @Body() Map<String, dynamic> map);

  @POST("v3/carts")
  Future<CreateCartModel> createCart(
      @Header("X-Auth-Token") String token, @Body() Map<String, dynamic> map);

  @GET("v3/customers")
  Future<UserDataModel> getUserFromID(
      @Header("X-Auth-Token") String token, @Query("id:in") int customerId);

  @POST("v3/customers")
  Future<UserDataModel> createUser(
      @Header("X-Auth-Token") String token, @Body() var map);

  @POST("v3/storefront/api-token")
  Future<TokenModel> generateToke(
      @Header("X-Auth-Token") String token, @Body() var map);

  @POST("v3/checkouts/0b27cc82-b9d5-4eaa-b24d-12d9fdefb4fe/billing-address")
  Future<CartBillingModel> createBilling(
      @Header("X-Auth-Token") String token, @Body() var map);

  @POST(
      "v3/checkouts/0b27cc82-b9d5-4eaa-b24d-12d9fdefb4fe/consignments?include=consignments.available_shipping_options")
  Future<CartShippingModel> createShipping(
      @Header("X-Auth-Token") String token, @Body() var map);

  @GET("v3/catalog/variants?product_id={id}")
  Future<ProductVariant> fetchProductVariants(
      @Header("X-Auth-Token") String token, @Path() String id);

  @GET("v3/carts/{id}?include=redirect_urls")
  Future<CartDataModel> getCartWithRedirectUrl(
      @Header("X-Auth-Token") String token, @Path("id") String cartId);

  @PUT ("v3/carts/{id}/items/{productId}")
  Future<CartDataModel> updateCartItem(
      @Header("X-Auth-Token") String token, @Path("id") String cartId,@Path("productId") String productId,@Body() Map<String,dynamic> map);

  @DELETE("v3/carts/{id}/items/{productId}")
  Future<HttpResponse> deleteCartItem(
      @Header("X-Auth-Token") String token, @Path("id") String cartId,@Path("productId") String productId);

  @POST("v3/carts/{id}/items")
  Future<CreateCartModel> addCart(
      @Header("X-Auth-Token") String token, @Path("id") String cartId,@Body() Map<String,dynamic> map);

}
