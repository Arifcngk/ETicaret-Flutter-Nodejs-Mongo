import 'package:eticaret_fullstack/global_varibles.dart';
import 'package:eticaret_fullstack/models/user.dart';
import 'package:eticaret_fullstack/services/manage_http_response.dart';
import 'package:http/http.dart' as http;

class AuthController {
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
          showSnackBar(context, "Bağlantı Controller BAşarılı Şekilde Çalıştı");
        },
      );
    } catch (e) {
      // ignore: avoid_print
      print("Model Hatası");
    }
  }
}
