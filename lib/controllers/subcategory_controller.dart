import 'dart:convert';
import 'package:eticaret_fullstack/global_varibles.dart';
import 'package:eticaret_fullstack/models/subcategory_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SubcategoryController {
  Future<List<SubcategoryModel>> getSubcategoriesByCategoryName(
      String categoryName) async {
    try {
      final response = await http.get(
        Uri.parse("$uri/api/categories/$categoryName/subcategories"),
      );
      print("API Response Status: ${response.statusCode}");
      print("API Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((e) => SubcategoryModel.fromJson(e)).toList();
      } else {
        throw "Failed to load subcategories - Status: ${response.statusCode}, Body: ${response.body}";
      }
    } catch (e) {
      print("getSubcategoriesByCategoryName error: $e");
      rethrow; // Hatanın çağıran tarafa iletilmesi için
    }
  }

  Future<List<SubcategoryModel>> loadSubcategories() async {
    try {
      http.Response response = await http.get(
        Uri.parse("$uri/api/subcategories"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        List<SubcategoryModel> categories = [];
        List<dynamic> body = jsonDecode(response.body);
        for (var item in body) {
          categories.add(SubcategoryModel.fromJson(item));
        }
        return categories;
      } else {
        throw "Failed to load categories";
      }
    } catch (e) {
      print("load Subcategories error: $e");
      return [];
    }
  }
}
