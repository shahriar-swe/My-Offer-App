import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:offer_app/home_page.dart';
import 'package:offer_app/login_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  /*final storage = new FlutterSecureStorage();
  Future<bool> checkLoginStatus()async{
    String? value = await storage.read(key: "uid");

    if(value == null){
      return false;
    }return true;
  }*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      //home: LoginPage(),
    );
  }
}


//firebase_storage: ^11.0.5
//   cloud_firestore: ^4.0.5
//   firebase_auth: ^4.0.2

//app\build.gradle-> compileSdkVersion flutter.compileSdkVersion