import 'dart:convert';

class UserModel {
  final String id;
  final String fullName; // Bu değişken adı frontend'de kullanılabilir
  final String email;
  final String password;
  final String state;
  final String locality;
  final String city;
  final String token;

  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.password,
    required this.state,
    required this.locality,
    required this.city,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fullname': fullName, // Backend ile uyumlu hale getirildi
      'email': email,
      'password': password,
      'state': state,
      'locality': locality,
      'city': city,
      'token': token,
    };
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['_id'] as String? ?? '', // Backend'den gelen _id ile eşleşiyor
      fullName: map['fullname'] as String? ??
          '', // Backend'den gelen fullname ile eşleşiyor
      email: map['email'] as String? ?? '',
      password: map['password'] as String? ??
          '', // Not: Backend şifreyi döndürmüyor, bu alan genelde boş kalır
      state: map['state'] as String? ?? '',
      locality: map['locality'] as String? ?? '',
      city: map['city'] as String? ?? '',
      token: map['token'] as String? ?? '',
    );
  }

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
