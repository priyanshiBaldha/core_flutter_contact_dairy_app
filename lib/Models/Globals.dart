import 'dart:io';

class Global {
  static bool isDark = false;
  static List piyu = [];
}

class Contact {
  final String? firstname;
  final String? lastname;
  final String? phonenumber;
  final String? email;
  final File? Image;

  Contact({
    required this.firstname,
    required this.lastname,
    required this.phonenumber,
    required this.email,
    required this.Image,
  });
}
