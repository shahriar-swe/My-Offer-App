import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:offer_app/dashboard_page.dart';
import 'package:offer_app/forgetpass_page.dart';
import 'package:offer_app/navigation_drawer.dart';
import 'package:offer_app/registration_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  bool _isObsecure = true;

  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;


  final storage = new FlutterSecureStorage();


  SignIn() async{
    try {
      UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      print("credential: ${credential.user!.uid}");

      await storage.write(key: "uid", value: credential.user!.uid);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>NavigationDrawer()));

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Image.asset('assets/background.png',height: double.infinity,width: double.infinity,fit: BoxFit.cover),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: _formKey,
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment : MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/logo.png"),
                        radius: 60,
                      ),
                    ),


                    //SizedBox(height: 20,),
                    //Text("Panda Food Delivery",style: GoogleFonts.lobster(textStyle: TextStyle(fontSize:20, color: Colors.blue, letterSpacing: .5),),),


                    SizedBox(height: 35,),
                    TextFormField(
                      controller: _emailController,

                      validator: (value){
                        if (value == null || value.isEmpty) {
                          return 'Email is empty';
                        }else if(!value.contains("@")){
                          return "Invalid Email";
                        }else if(!value.contains("com")){
                          return "Invalid Email";
                        }
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(18),
                        isDense: true,
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),
                        hintText: 'Email',
                        //helperText: 'help',
                        //counterText: 'counter',
                        //icon: Icon(Icons.star),
                        prefixIcon: Icon(Icons.email,color: Colors.black,),
                        suffixIcon: Icon(Icons.alternate_email,color: Colors.black,),

                      ),
                    ),


                    SizedBox(height: 14,),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _isObsecure,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password Required";
                        }

                        if (value.length > 15) {
                          return "Password is too long";
                        }

                        if (value.length < 3) {
                          return "Password is too short";
                        }
                      },

                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(18),
                        isDense: true,
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),
                        hintText: 'Password',
                        //helperText: 'help',
                        //counterText: 'counter',
                        //icon: Icon(Icons.star),
                        prefixIcon: Icon(Icons.lock,color: Colors.black,),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isObsecure = !_isObsecure;
                            });
                          },
                          icon: Icon(_isObsecure == true
                              ? Icons.visibility_off
                              : Icons.visibility),
                          color: Colors.black,
                        ),
                        //prefixIcon: Icon(Icons.lock),
                      ),
                    ),


                    SizedBox(height: 30,),
                    RaisedButton.icon(
                      onPressed: ()async{
                        print('Login Button Clicked.');

                        //signIn(_emailController.text, _passwordController.text);
                        // Obtain shared preferences.
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setString("email", _emailController.text);
                        if (_formKey.currentState!.validate()) {
                          print("Successful");
                          Fluttertoast.showToast(msg: "Login Successful");
                          SignIn();
                          //Navigator.push(context, MaterialPageRoute(builder: (context) =>SignUpPage()));
                        } else {
                          print("Something wrong");
                        }

                        //Navigator.push(context, MaterialPageRoute(builder: (context) =>NavigationDrawer()));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      label: Padding(
                        padding: const EdgeInsets.only(left: 10,right: 50,top: 10,bottom: 10),
                        child: Text('Login', style: GoogleFonts.lobster(textStyle: TextStyle(fontSize:20, color: Colors.white, letterSpacing: .5),),),
                      ),
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 50,right: 10,top: 10,bottom: 10),
                        child: Icon(Icons.login_rounded, color:Colors.white,),
                      ),
                      textColor: Colors.white,
                      splashColor: Colors.red,
                      color: Colors.black45,
                    ),


                    //SizedBox(height: 20,),




                    SizedBox(height: 30,),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>ForgetPassPage()));
                      },
                        child: Text('Forgot Password?', style: GoogleFonts.lobster(textStyle: TextStyle(fontSize:10, color: Colors.black, letterSpacing: .5),),)),




                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have Account?",style: TextStyle(color: Colors.white),),
                        SizedBox(width: 15,),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                          },
                          child: Text("Sign Up",style: GoogleFonts.lobster(textStyle: TextStyle(fontSize:18, color: Colors.black, letterSpacing: .5),)),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }




  // login function
  /*void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NavigationDrawer()));
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
          Fluttertoast.showToast(msg: "Login Successful"),
        //Get.to(NavigationDrawer()),
        Navigator.push(context, MaterialPageRoute(builder: (context)=>NavigationDrawer())),
          //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => NavigationDrawer())),

        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }*/



}
