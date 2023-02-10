import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:offer_app/dashboard_page.dart';
import 'package:offer_app/login_page.dart';
import 'package:offer_app/navigation_drawer.dart';
import 'package:offer_app/user_model.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {


  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  bool _isObsecure = true;


  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.blue,
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
                      controller: _nameController,

                      validator: (value){
                        if (value == null || value.isEmpty) {
                          return 'Required';
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
                        labelText: 'Name',
                        labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),
                        hintText: 'Name',
                        //helperText: 'help',
                        //counterText: 'counter',
                        //icon: Icon(Icons.star),
                        //prefixIcon: Icon(Icons.drive_file_rename_outline,color: Colors.black,),
                        suffixIcon: Icon(Icons.drive_file_rename_outline,color: Colors.black,),

                      ),
                    ),




                    SizedBox(height: 14,),
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
                        //prefixIcon: Icon(Icons.email,color: Colors.black,),
                        suffixIcon: Icon(Icons.email,color: Colors.black,),

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
                        //prefixIcon: Icon(Icons.lock,color: Colors.black,),
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



                    SizedBox(height: 14,),
                    TextFormField(
                      controller: _confirmPasswordController,
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
                        labelText: 'Confirm Password',
                        labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),
                        hintText: 'Confirm Password',
                        //helperText: 'help',
                        //counterText: 'counter',
                        //icon: Icon(Icons.star),
                        //prefixIcon: Icon(Icons.lock,color: Colors.black,),
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
                      onPressed: (){
                        print('Login Button Clicked.');
                        /*if (_formKey.currentState!.validate()) {
                          //print("Successful");
                          //SignIn();
                          //Navigator.push(context, MaterialPageRoute(builder: (context) =>SignUpPage()));
                        } else {
                          print("Something wrong");
                        }*/
                        signUp(_emailController.text, _passwordController.text);

                        //Navigator.push(context, MaterialPageRoute(builder: (context) =>NavigationDrawer()));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      label: Padding(
                        padding: const EdgeInsets.only(left: 10,right: 50,top: 10,bottom: 10),
                        child: Text('Sign Up', style: GoogleFonts.lobster(textStyle: TextStyle(fontSize:20, color: Colors.white, letterSpacing: .5),),),
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
                    //Text('Forgot Password?', style: GoogleFonts.lobster(textStyle: TextStyle(fontSize:10, color: Colors.black, letterSpacing: .5),),),




                    //SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an Account?",style: TextStyle(color: Colors.white),),
                        SizedBox(width: 15,),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                          },
                          child: Text("Login",style: GoogleFonts.lobster(textStyle: TextStyle(fontSize:18, color: Colors.black, letterSpacing: .5),)),
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





  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
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
  }




  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.userName = _nameController.text;
    //userModel.secondName = secondNameEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
  }





}
