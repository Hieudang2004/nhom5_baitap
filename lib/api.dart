import 'package:flutter/material.dart';
import 'package:nhom5_baitap/api.dart';
import 'package:nhom5_baitap/model/product.dart';
import 'package:dio/dio.dart';

class API {
  Future<List<Product>> getAllProduct() async {
    var dio = Dio();
    var response = await dio.get('https://fakestoreapi.com/products');

    List<Product> ls = [];

    if (response.statusCode == 200) {
      List data = response.data;
      ls = data.map((x) => Product.fromJson(x)).toList();
    } else {
      print('Loi roi!!');
    }

    return ls;
  }
}

var test_API = API();