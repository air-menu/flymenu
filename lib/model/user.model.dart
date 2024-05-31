import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flymenu/constants/user.constant.dart';

class UserModel {
  final String uid;
  final String email;
  final String password;
  final String lastname;
  final String firstname;
  final String birthdate;
  final String nickname;
  final bool accountregistered;

  UserModel({
    this.lastname ='',
    this.firstname= '',
    required this.email,
    this.password ='',
    this.birthdate = '',
    this.nickname = '',
    this.uid = '',
    this.accountregistered = false,
  });

  Map<String, dynamic> toMap() {
    return {
      UserConstant.uid: uid,
      UserConstant.email: email,
      UserConstant.lastname: lastname,
      UserConstant.firstname: firstname,
      UserConstant.birthdate: birthdate,
      UserConstant.nickname: nickname,
      UserConstant.accountregistered: accountregistered,
    };
  }

  Map<String, dynamic> toJson() => {
        UserConstant.uid: uid,
        UserConstant.email: email,
        UserConstant.lastname: lastname,
        UserConstant.firstname: firstname,
        UserConstant.birthdate: birthdate,
        UserConstant.nickname: nickname,
        UserConstant.accountregistered: accountregistered,
      };

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map[UserConstant.uid],
      email: map[UserConstant.email] ?? '',
      password: map[UserConstant.password] ?? '',
      firstname: map[UserConstant.firstname] ?? '',
      lastname: map[UserConstant.lastname] ?? '',
      birthdate: map[UserConstant.birthdate] ?? '',
      nickname: map[UserConstant.nickname] ?? '',
      accountregistered: map[UserConstant.accountregistered] ?? false,
    );
  }

  factory UserModel.fromFirestore(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return UserModel(
      uid: snapshot.id,
      email: data[UserConstant.email],
      lastname: data[UserConstant.lastname],
      firstname: data[UserConstant.firstname],
      password: data[UserConstant.password],
      birthdate: data[UserConstant.birthdate],
      nickname: data[UserConstant.nickname],
      accountregistered: data[UserConstant.accountregistered],
    );
  }

  @override
  String toString() {
    return 'UserModel{uid: $uid, email: $email, password: $password, '
        'lastname: $lastname, firstname: $firstname, '
        'birthdate: $birthdate, nickname: $nickname, accountregistered: $accountregistered}';
  }
}
