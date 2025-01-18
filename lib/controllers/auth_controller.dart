import 'dart:convert';

import 'package:eticaret_fullstack/global_varibles.dart';
import 'package:eticaret_fullstack/models/user.dart';
import 'package:eticaret_fullstack/services/manage_http_response.dart';
import 'package:eticaret_fullstack/views/screens/aurh_screens/login.dart';
import 'package:eticaret_fullstack/views/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthController {
  // kayıt olma işlemi
  Future<void> signUpUsers({
    required context,
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      UserModel _userModel = UserModel(
        id: '',
        fullName: fullName,
        email: email,
        password: password,
        state: '',
        locality: '',
        city: '',
        token: '',
      );
      http.Response response = await http.post(Uri.parse('$uri/api/signin'),
          body: _userModel.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      manageHttpResponse(
        response: response,
        context: context,
        onSucces: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ));
          showSnackBar(context, "Bağlantı Controller Başarılı Şekilde Çalıştı");
        },
      );
    } catch (e) {
      // ignore: avoid_print
      print("Model Hatası");
    }
  }

  // giriş yapma işlemleri
  Future<void> signInUsers({
    required context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response response = await http.post(Uri.parse('$uri/api/signin'),
          body: jsonEncode({
            'email': email,
            'password': password,
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      manageHttpResponse(
        response: response,
        context: context,
        onSucces: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeViewScreen(),
              ),
              (route) => false);

          // mesaj text içeriği 
          showSnackBar(context, "Bağlantı  Başarılı Şekilde Çalıştı");
        },
      );
    } catch (e) {
      // ignore: avoid_print
      print("Model Hatası");
    }
  }
}
