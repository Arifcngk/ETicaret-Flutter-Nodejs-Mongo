import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void manageHttpResponse({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess, 
}) {
  switch (response.statusCode) {
    case 200: // OK
    case 201: // Created
      onSuccess(); 
      break;

    case 400: // Bad Request
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Hatalı istek: ${response.body}'),
          backgroundColor: Colors.redAccent,
        ),
      );
      break;

    case 401: // Unauthorized
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Yetkisiz erişim: Lütfen giriş yapın.'),
          backgroundColor: Colors.redAccent,
        ),
      );
      break;

    case 403: // Forbidden
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Erişim reddedildi.'),
          backgroundColor: Colors.redAccent,
        ),
      );
      break;

    case 404: // Not Found
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Kaynak bulunamadı.'),
          backgroundColor: Colors.redAccent,
        ),
      );
      break;

    case 500: // Internal Server Error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Sunucu hatası: ${response.body}'),
          backgroundColor: Colors.redAccent,
        ),
      );
      break;

    default: // Diğer durumlar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Bilinmeyen hata: ${response.statusCode} - ${response.body}'),
          backgroundColor: Colors.redAccent,
        ),
      );
      break;
  }
}