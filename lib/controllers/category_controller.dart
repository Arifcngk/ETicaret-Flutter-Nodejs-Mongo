import 'dart:convert';
import 'package:eticaret_fullstack/global_varibles.dart';
import 'package:eticaret_fullstack/models/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryController {
  // load the upload category
  Future<List<CategoryModel>> loadCategories() async {
    try {
      http.Response response = await http.get(
        Uri.parse("$uri/api/categories"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        List<CategoryModel> categories = [];
        List<dynamic> body = jsonDecode(response.body);
        for (var item in body) {
          categories.add(CategoryModel.fromJson(item));
        }
        return categories;
      } else {
        throw "Failed to load categories";
      }
    } catch (e) {
      print("loadCategories error: $e");
      return [];
    }
  }
}
