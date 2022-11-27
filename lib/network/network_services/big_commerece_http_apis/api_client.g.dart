// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _ApiClient implements ApiClient {
  _ApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.bigcommerce.com/stores/z5zid6mes9/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<UserDataModel> updateUser(token, map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'X-Auth-Token': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = map;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserDataModel>(
            Options(method: 'PUT', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v3/customers',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserDataModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<OrderModel>> getOrdersFromID(token, accept, customerId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'customer_id': customerId};
    final _headers = <String, dynamic>{
      r'X-Auth-Token': token,
      r'Accept': accept
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<OrderModel>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v2/orders',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => OrderModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<OrderDetailsModel>> orderDetails(
      token, accept, contentType, id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'X-Auth-Token': token,
      r'Accept': contentType
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<OrderDetailsModel>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v2/orders/${id}/products',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) =>
            OrderDetailsModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<ValidateUserModel> validateUser(token, map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'X-Auth-Token': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(map);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ValidateUserModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v3/customers/validate-credentials',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ValidateUserModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CreateCartModel> createCart(token, map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'X-Auth-Token': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(map);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CreateCartModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v3/carts',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CreateCartModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserDataModel> getUserFromID(token, customerId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'id:in': customerId};
    final _headers = <String, dynamic>{r'X-Auth-Token': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserDataModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v3/customers',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserDataModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserDataModel> createUser(token, map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'X-Auth-Token': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = map;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserDataModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v3/customers',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserDataModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TokenModel> generateToke(token, map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'X-Auth-Token': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = map;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TokenModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v3/storefront/api-token',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TokenModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CartBillingModel> createBilling(token, map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'X-Auth-Token': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = map;
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        CartBillingModel>(Options(
            method: 'POST', headers: _headers, extra: _extra)
        .compose(_dio.options,
            'v3/checkouts/0b27cc82-b9d5-4eaa-b24d-12d9fdefb4fe/billing-address',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CartBillingModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CartShippingModel> createShipping(token, map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'X-Auth-Token': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = map;
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        CartShippingModel>(Options(
            method: 'POST', headers: _headers, extra: _extra)
        .compose(_dio.options,
            'v3/checkouts/0b27cc82-b9d5-4eaa-b24d-12d9fdefb4fe/consignments?include=consignments.available_shipping_options',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CartShippingModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ProductVariant> fetchProductVariants(token, id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'X-Auth-Token': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ProductVariant>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v3/catalog/variants?product_id=${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ProductVariant.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CartDataModel> getCartWithRedirectUrl(token, cartId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'X-Auth-Token': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CartDataModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(
                    _dio.options, 'v3/carts/${cartId}?include=redirect_urls',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CartDataModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CartDataModel> updateCartItem(token, cartId, productId, map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'X-Auth-Token': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(map);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CartDataModel>(
            Options(method: 'PUT', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v3/carts/${cartId}/items/${productId}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CartDataModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<HttpResponse<dynamic>> deleteCartItem(token, cartId, productId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'X-Auth-Token': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch(_setStreamType<HttpResponse<dynamic>>(
        Options(method: 'DELETE', headers: _headers, extra: _extra)
            .compose(_dio.options, 'v3/carts/${cartId}/items/${productId}',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<CreateCartModel> addCart(token, cartId, map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'X-Auth-Token': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(map);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CreateCartModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v3/carts/${cartId}/items',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CreateCartModel.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
