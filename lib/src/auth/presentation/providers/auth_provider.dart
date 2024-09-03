import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {

  bool _flagFillForm;
  String _name;
  String _lastNames;
  String _phone;
  String _email;
  String _birthdate;
  String _gender;

  AuthProvider({
    bool flagFillForm = false,
    String name = 'Pending to fill',
    String lastNames = '',
    String phone = 'XXXXXX',
    String email = '',
    String birthdate = '',
    String gender = '',
  })  : _flagFillForm = flagFillForm,
        _name = name,
        _lastNames = lastNames,
        _phone = phone,
        _email = email,
        _birthdate = birthdate,
        _gender = gender;

  bool get flagFillForm => _flagFillForm;
  String get name => _name;
  String get lastNames => _lastNames;
  String get phone => _phone;
  String get email => _email;
  String get birthdate => _birthdate;
  String get gender => _gender;

  void setUserInfo({
    required String name,
    required String lastNames,
    required String phone,
    required String email,
    required String birthdate,
    required String gender
  }) {
    _name = name;
    _lastNames = lastNames;
    _phone = phone;
    _email = email;
    _birthdate = birthdate;
    _gender = gender;
    _flagFillForm = true;
    notifyListeners();
  }

  factory AuthProvider.fromMap(Map<String, dynamic> map)
    => AuthProvider(
      flagFillForm: map['flagFillForm'] ?? false,
      name: map['name'] ?? 'Pending to fill',
      lastNames: map['lastNames'] ?? '',
      phone: map['phone'] ?? 'XXXXXX',
      email: map['email'] ?? '',
      birthdate: map['birthdate'] ?? '',
      gender: map['gender'] ?? ''
    );

  

}