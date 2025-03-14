import 'dart:convert';
import 'dart:typed_data';

import 'package:eticaret_fullstack/global_varibles.dart';
import 'package:eticaret_fullstack/models/banner_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BannerController {
 

  //fetch Banners

  Future<List<BannerModel>> loadBanners() async {
    try {
      http.Response response = await http.get(
        Uri.parse("$uri/api/banner"),
        // GET isteği için Content-Type gerekmiyorsa kaldırıldı
      );
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        List<BannerModel> banners =
            body.map((dynamic item) => BannerModel.fromJson(item)).toList();
        return banners;
      } else {
        throw "Banners getirilirken hata oluştu: ${response.statusCode} - ${response.body}";
      }
    } catch (e) {
      throw Exception("Banners getirilirken hata oluştu: $e");
    }
  }
}
