import 'dart:async';
import 'dart:convert';

import 'package:mi_studio/constants/export.dart';
import 'package:mi_studio/models/base_model.dart';
import 'package:mi_studio/models/products_model.dart';
import 'package:mi_studio/models/search_result_model.dart';
import 'package:mi_studio/network/constants/graph_ql_query.dart';
import 'package:mi_studio/network/network_services/big_commerece_graphQl/graph_ql_services.dart';
import 'dart:developer';

import 'package:mi_studio/screens/search/shared_preferences.dart';

class SearchController extends GetxController {
  SearchResultModel? _searchResultModel;
  List<dynamic> searchHistoryList = [].obs;
  List<dynamic> recentViewNameHistoryList = [].obs;
  List<dynamic> recentViewImageHistoryList = [].obs;
  List<dynamic> searchHistoryImageList = [].obs;
  List<dynamic> productIdList = [].obs;
  List<dynamic> getJsonList = [].obs;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  SearchResultModel? get searchResultModel => _searchResultModel;
  bool isSearching = false;
  static const _limt = 10; // -1 to deactivate
  static const recentViewName = "RecentViewName";
  static const recentViewimage = "RecentViewImage";
  static const recentHistory = "RecentHistory";
  static const recentHistoryImage = "RecentHistoryImage";
  static const productListData = "ProductListData";
  late String searchValue;

  @override
  void onInit() {
    super.onInit();
    getJson();
    getRecentViewImage();
    getRecentViewName();
    getSearchHistory();
    getSearchHistoryImage();
  }

  Future<void> searchItems(BuildContext context, String key) async {
    log('This is A Search Contoroller $key');
    isSearching = true;
    BaseModel<SearchResultModel> response = await GraphQlServices()
        .searchItem(context, {"query": GraphQlQuery.searchQuery(key)});
    _searchResultModel = response.data;
    isSearching = false;
    searchValue = key;
    update();
  }

//Recent View History Function

  Future<void> setRecentViewName(String name) async {
    log('Name urls is :---$name');
    final SharedPreferences prefs = await _prefs;
    List<String>? recentViewNameList = prefs.getStringList(recentViewName);
    if (recentViewNameList == null) {
      recentViewNameList = [];
      recentViewNameList.insert(0, name);
    } else {
      final val1 = recentViewNameList.indexOf(name);
      if (val1 != 0) {
        if (val1 != -1) recentViewNameList.removeAt(val1);
        recentViewNameList.insert(0, name);
        if (_limt != -1 && recentViewNameList.length > _limt) {
          recentViewNameList.removeLast();
        }
      }
    }
    update();
    prefs.setStringList(recentViewName, recentViewNameList);
    log(' Name data is  this$recentViewNameList');
    getRecentViewName();
    update();
  }

  Future<void> productRecenViewId(String id) async {
    log('Name urls is :---$id');
    final SharedPreferences prefs = await _prefs;
    List<String>? recentViewNameList = prefs.getStringList(recentViewName);
    if (recentViewNameList == null) {
      recentViewNameList = [];
      recentViewNameList.insert(0, id);
    } else {
      final val1 = recentViewNameList.indexOf(id);
      if (val1 != 0) {
        if (val1 != -1) recentViewNameList.removeAt(val1);
        recentViewNameList.insert(0, id);
        if (_limt != -1 && recentViewNameList.length > _limt) {
          recentViewNameList.removeLast();
        }
      }
    }
    update();
    prefs.setStringList(recentViewName, recentViewNameList);
    log(' Name data is  this$recentViewNameList');
    getRecentViewName();
    update();
  }

  Future<void> setRecentViewImage(String imageUrl) async {
    log('Name urls is :---$imageUrl');
    final SharedPreferences prefs = await _prefs;
    List<String>? recentViewImageList = prefs.getStringList(recentViewimage);
    if (recentViewImageList == null) {
      recentViewImageList = [];
      recentViewImageList.insert(0, imageUrl);
    } else {
      final val1 = recentViewImageList.indexOf(imageUrl);
      if (val1 != 0) {
        if (val1 != -1) recentViewImageList.removeAt(val1);
        recentViewImageList.insert(0, imageUrl);
        if (_limt != -1 && recentViewImageList.length > _limt) {
          recentViewImageList.removeLast();
        }
      }
    }
    update();
    prefs.setStringList(recentViewimage, recentViewImageList);
    log('data is  Image$recentViewImageList');
    getRecentViewImage();
    update();
  }

  Future<List<String>> getRecentViewImage() async {
    log('this value revived');
    final SharedPreferences prefs = await _prefs;
    final recentViewImageList = prefs.getStringList(recentViewimage);
    if (recentViewImageList == null) return [];
    recentViewImageHistoryList = recentViewImageList;
    log('data lengeth  set :-- ${recentViewImageHistoryList.length}');

    update();
    return recentViewImageList;
  }

  Future<List<String>> getRecentViewName() async {
    log('this value revived');
    final SharedPreferences prefs = await _prefs;
    final recentViewNameList = prefs.getStringList(recentViewName);
    if (recentViewNameList == null) return [];
    recentViewNameHistoryList = recentViewNameList;
    log('data lengeth get :-- ${recentViewNameHistoryList.length}');
    update();
    return recentViewNameList;
  }

  SharedPerference sharedPerference = SharedPerference();
  Future<void> clearRecentView(name, url) async {
    log('delete the view');
    final SharedPreferences prefs = await _prefs;
    var deletenameList = prefs.getStringList(recentViewName) ?? [];
    deletenameList.removeWhere((item) => item == name);
    var deletImageList = prefs.getStringList(recentViewimage) ?? [];
    deletImageList.removeWhere((item) => item == url);
    prefs.setStringList(recentViewimage, deletImageList);
    prefs.setStringList(recentViewName, deletenameList);
    getRecentViewImage();
    getRecentViewName();
    update();
  }

//Recent Search History Function

  Future<void> setRecentSearchHistory(String historyText) async {
    log('Name urls is for search history :---$historyText');
    final SharedPreferences prefs = await _prefs;
    List<String>? recentHistoryList = prefs.getStringList(recentHistory);

    if (recentHistoryList == null) {
      recentHistoryList = [];
      recentHistoryList.insert(0, historyText);
    } else {
      final val1 = recentHistoryList.indexOf(historyText);

      if (val1 != 0) {
        if (val1 != -1) recentHistoryList.removeAt(val1);
        recentHistoryList.insert(0, historyText);
        if (_limt != -1 && recentHistoryList.length > _limt) {
          recentHistoryList.removeLast();
        }
      }
    }
    update();
    prefs.setStringList(recentHistory, recentHistoryList);
    log('data is  Image$recentHistoryList');
    getSearchHistory();
    update();
  }

  Future<List<String>> getSearchHistory() async {
    log('this value revived');
    final SharedPreferences prefs = await _prefs;
    final searchHistory = prefs.getStringList(recentHistory);
    if (searchHistory == null) return [];
    searchHistoryList = searchHistory;
    update();
    return searchHistory;
  }

  Future<void> clearSearchHistory(val) async {
    log('delete the view');
    final SharedPreferences prefs = await _prefs;
    var deleteSearchList = prefs.getStringList(recentHistory) ?? [];
    deleteSearchList.removeWhere((item) => item == val);
    prefs.setStringList(recentHistory, deleteSearchList);
    getSearchHistory();
    update();
  }

  Future<void> setHistoryViewImage(String imageUrl) async {
    log('Name urls is for History Image data :---$imageUrl');
    final SharedPreferences prefs = await _prefs;
    List<String>? historyListImage = prefs.getStringList(recentHistoryImage);
    if (historyListImage == null) {
      historyListImage = [];
      historyListImage.insert(0, imageUrl);
    } else {
      final val1 = historyListImage.indexOf(imageUrl);
      if (val1 != 0) {
        if (val1 != -1) historyListImage.removeAt(val1);
        historyListImage.insert(0, imageUrl);
        if (_limt != -1 && historyListImage.length > _limt) {
          historyListImage.removeLast();
        }
      }
    }
    update();
    prefs.setStringList(recentHistoryImage, historyListImage);
    log('Name urls is for History Image data 99999999  $historyListImage');
    getSearchHistoryImage();
    update();
  }

  Future<List<String>> getSearchHistoryImage() async {
    log('this value revived');
    final SharedPreferences prefs = await _prefs;
    final searchHistoryImage = prefs.getStringList(recentHistoryImage);
    if (searchHistoryImage == null) return [];
    searchHistoryImageList = searchHistoryImage;
    update();
    return searchHistoryImage;
  }

  Future<void> clearSearchHistoryList(name, url) async {
    log('delete the view of image');
    final SharedPreferences prefs = await _prefs;
    var deletenameList = prefs.getStringList(recentHistory) ?? [];
    deletenameList.removeWhere((item) => item == name);
    var deletImageList = prefs.getStringList(recentHistoryImage) ?? [];
    deletImageList.removeWhere((item) => item == url);
    prefs.setStringList(recentHistoryImage, deletImageList);
    prefs.setStringList(recentHistory, deletenameList);
    getSearchHistory();
    getSearchHistoryImage();
    update();
  }

  Future<void> setJsonData(String data) async {
    log('Json data is :-------------- $data');
    final SharedPreferences prefs = await _prefs;
    List<String>? recentViewData = prefs.getStringList(productListData);
    if (recentViewData == null) {
      recentViewData = [];
      recentViewData.insert(0, data);
    } else {
      final val1 = recentViewData.indexOf(data);
      if (val1 != 0) {
        if (val1 != -1) recentViewData.removeAt(val1);
        recentViewData.insert(0, data);
        if (_limt != -1 && recentViewData.length > _limt) {
          recentViewData.removeLast();
        }
      }
    }
    update();
    prefs.setStringList(productListData, recentViewData);
    log('this is a map data  $recentViewData');
    getJson();
    update();
  }

  var item;
  Future<List<String>> getJson() async {
    log('this value revived');
    final SharedPreferences prefs = await _prefs;
    final getjson = prefs.getStringList(productListData);
    if (getjson == null) return [];
    getJsonList = getjson;
    ProductsEdge recientviewModule =
        ProductsEdge.fromJson(json.decode(getJsonList[0].toString()));
    log('this value revived getJsonData ${recientviewModule.node?.name}');
    item = recientviewModule;
    update();
    return getjson;
  }

  Future<void> clearJsonList() async {
    log('delete the view of image');
    final SharedPreferences prefs = await _prefs;
    /* var deletenameList = prefs.getStringList(recentHistory) ?? [];
    deletenameList.removeWhere((item) => item == name);
    var deletImageList = p\refs.getStringList(recentHistoryImage) ?? [];
    deletImageList.removeWhere((item) =
    > item == url); */
    prefs.setStringList(productListData, []);
    getJson();
    update();
  }
}
