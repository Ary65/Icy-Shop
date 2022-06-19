import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:icy_shop/constants/error_handleing.dart';
import 'package:icy_shop/constants/global_variables.dart';
import 'package:icy_shop/constants/utils.dart';
import 'package:icy_shop/models/product.dart';
import 'package:http/http.dart' as http;

class ProductServices {
  Future<List<Product>> fetchAllProducts(BuildContext context) async {
    List<Product> productList = [];

    try {
      http.Response res = await http.get(Uri.parse('$uri/products'), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });
    
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(res.body).length; i++) {
              productList
                  .add(Product.fromJson(jsonEncode(jsonDecode(res.body)[i])));
            }
          });
    } catch (e) {
      print(e);
      // showSnackBar(context, e.toString());
    }
    return productList;
  }
}
