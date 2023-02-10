import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPassPage extends StatefulWidget {
  const ForgetPassPage({Key? key}) : super(key: key);

  @override
  State<ForgetPassPage> createState() => _ForgetPassPageState();
}

class _ForgetPassPageState extends State<ForgetPassPage> {


  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _emailController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios,color: Colors.white,),
        ),

        title: Text("Forget Your Password",style: TextStyle(color: Colors.white,fontSize: 16),),
        centerTitle: true,
      ),




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


                    SizedBox(height: 35,),
                    Text("Note: Please provide your login email address, we will send you a forgot password link",style: GoogleFonts.lobster(textStyle: TextStyle(fontSize:20, color: Colors.white, letterSpacing: .5),),),


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





                    SizedBox(height: 30,),
                    RaisedButton.icon(
                      onPressed: ()async{
                        print('Forget Button Clicked.');


                        if (_formKey.currentState!.validate()) {
                          _auth.sendPasswordResetEmail(email: _emailController.text.toString()).then((value) => {
                          Fluttertoast.showToast(msg: "We have sent you a mail ,please cheack your mail inbox or spam.")
                          }).onError((error, stackTrace) => {
                          Fluttertoast.showToast(msg: "Something went wrong,please try again")
                          });
                          print("Successful");


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
                        child: Text('Forgot Password', style: GoogleFonts.lobster(textStyle: TextStyle(fontSize:20, color: Colors.white, letterSpacing: .5),),),
                      ),
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 50,right: 10,top: 10,bottom: 10),
                        child: Icon(Icons.password, color:Colors.white,),
                      ),
                      textColor: Colors.white,
                      splashColor: Colors.red,
                      color: Colors.black45,
                    ),


                    //SizedBox(height: 20,),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),


    );
  }
}
