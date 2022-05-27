// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ecommerce/model/categoriesModel.dart';
import 'package:ecommerce/model/categoryadatamodel.dart';
import 'package:http/http.dart' as http;

const _url =
    'https://www.hepsiburada.com/api/v1/navigationConverter?platform=mobile';

class Api {
  static Future<List<CategoriesModel>> categoryNamesGet() async {
    var get = await http.get(Uri.parse(_url));
    List arr = jsonDecode(get.body)['data']['result']['components'];
    List<CategoriesModel> categoriesData = [];
    for (var element in arr) {
      categoriesData.add(CategoriesModel(
          iconUrl: element['iconUrl'],
          id: element['id'],
          title: element['title']));
    }
    return categoriesData;
  }

  static Future<List<CategoryDataModel>> getCategoryData(int id) async {
    var _url =
        'https://www.hepsiburada.com/api/v1/navigationConverter/$id?platform=mobile';
    var get = await http.get(Uri.parse(_url));
    var _data = jsonDecode(get.body);
    List arr = _data['data']['items'];
    List<CategoryDataModel> _arr = [];
    for (var element in arr) {
      _arr.add(CategoryDataModel(
          children: element['children'],
          title: element['title'],
          id: element['id']));
    }
    return _arr;
  }
}
