import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prof_ecommerce/utils/formatters/formatter.dart';

class UserModel {
  // keep those value final which you do not want to update
  final String id;
  final String userName;
  String firstName;
  String lastName;
  final String email;
  String phoneNumber;
  String profilePicture;

  // Constructor
  UserModel({
    required this.id,
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  // helper functions to get the full name of the user
  String get fullName => '$firstName $lastName';

  // helper functions to get format phone number
  String get formattedPhoneNumber => TFormatter.formatPhoneNumber(phoneNumber);

  // static function to split full name into first and last name
  static List<String> nameParts(fullName) => fullName.split('');

  // static functio to generate a user nmae from the full name
  static String generateUserName(fullName) {
    List<String> nameParts = fullName.split('');
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";
    String camelCaseUsrname = "$firstName$lastName";
    String userNameWithPrefix = "cwt_$camelCaseUsrname";
    return userNameWithPrefix;
  }

  //  static function to create an empty user model
  static UserModel empty() => UserModel(
      id: '',
      userName: '',
      firstName: '',
      lastName: '',
      email: '',
      phoneNumber: '',
      profilePicture: '');

  // Convert UserModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
    };
  }

  // Create UserModel from JSON
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data();

      return UserModel(
        id: document.id,
        userName: data!['userName'] ?? '',
        firstName: data['firstName'] ?? '',
        lastName: data['lastName'] ?? '',
        email: data['email'] ?? '',
        phoneNumber: data['phoneNumber'] ?? '',
        profilePicture: data['profilePicture'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }
}
