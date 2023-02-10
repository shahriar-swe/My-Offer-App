class UserModel {
  String? uid;
  String? email;
  String? userName;
  //String? secondName;

  UserModel({this.uid, this.email, this.userName});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      userName: map['userName'],
      //secondName: map['secondName'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'userName': userName,
      //'secondName': secondName,
    };
  }
}