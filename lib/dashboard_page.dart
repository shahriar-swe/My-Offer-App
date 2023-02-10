import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:offer_app/fiften_percent_page.dart';
import 'package:offer_app/fifty_percent_page.dart';
import 'package:offer_app/five_percent_page.dart';
import 'package:offer_app/fourty_percent_page.dart';
import 'package:offer_app/ten_percent_page.dart';
import 'package:offer_app/thirty_percent_page.dart';
import 'package:offer_app/thirtyfive_percent_page.dart';
import 'package:offer_app/twenty_percent_page.dart';
import 'package:offer_app/twentyfive_percent_page.dart';
import 'package:offer_app/user_model.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {


  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        leading: IconButton(onPressed: ()=>ZoomDrawer.of(context)!.toggle(),
            icon: CircleAvatar(
              child: Icon(Icons.person,color: Colors.white,),
              backgroundColor: Colors.black,
            )),

        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome",style: TextStyle(color: Colors.white,fontSize: 9),),
            Text("${loggedInUser.userName}",style: TextStyle(color: Colors.white,fontSize: 14),),
          ],
        ),


        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Icon(Icons.arrow_forward_ios,color: Colors.white,),
          ),
        ],
      ),
      body: Stack(
        children: [
          Image.asset('assets/background.png',height: double.infinity,width: double.infinity,fit: BoxFit.cover),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment : MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30,right: 30,top: 10),
                    child: Image.asset("assets/big_sale.png",height: 180,width: 225,fit: BoxFit.cover,),
                  ),


                  //SizedBox(height: 20,),
                  //Text("Panda Food Delivery",style: GoogleFonts.lobster(textStyle: TextStyle(fontSize:20, color: Colors.blue, letterSpacing: .5),),),


                  SizedBox(height: 35,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(

                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => FivePercentPage()));
                      },

                        child: Container(
                          height: 70,
                          width: 85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,

                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 9,left: 4,right: 2,),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("5%",style: TextStyle(color: Colors.red,fontSize: 22,fontWeight: FontWeight.bold),),
                                Text("Discount",style: TextStyle(color: Colors.black54,fontSize: 16,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                        ),
                      ),




                      InkWell(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => TenPercentPage()));
                          },

                        child: Container(
                          height: 70,
                          width: 85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,

                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 9,left: 4,right: 2,),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("10%",style: TextStyle(color: Colors.red,fontSize: 22,fontWeight: FontWeight.bold),),
                                Text("Discount",style: TextStyle(color: Colors.black54,fontSize: 16,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                        ),
                      ),




                      InkWell(
                        onTap:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FifteenPercentPage()));
                        },
                        child: Container(
                          height: 70,
                          width: 85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,

                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 9,left: 4,right: 2,),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("15%",style: TextStyle(color: Colors.red,fontSize: 22,fontWeight: FontWeight.bold),),
                                Text("Discount",style: TextStyle(color: Colors.black54,fontSize: 16,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),





                  SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => TwentyPercentPage()));
                        },
                        child: Container(
                          height: 70,
                          width: 85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,

                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 9,left: 4,right: 2,),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("20%",style: TextStyle(color: Colors.red,fontSize: 22,fontWeight: FontWeight.bold),),
                                Text("Discount",style: TextStyle(color: Colors.black54,fontSize: 16,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                        ),
                      ),




                      InkWell(
                        onTap:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => TwentyFivePercentPage()));
                        },
                        child: Container(
                          height: 70,
                          width: 85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,

                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 9,left: 4,right: 2,),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("25%",style: TextStyle(color: Colors.red,fontSize: 22,fontWeight: FontWeight.bold),),
                                Text("Discount",style: TextStyle(color: Colors.black54,fontSize: 16,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                        ),
                      ),




                      InkWell(
                        onTap:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ThirtyPercentPage()));
                        },
                        child: Container(
                          height: 70,
                          width: 85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,

                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 9,left: 4,right: 2,),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("30%",style: TextStyle(color: Colors.red,fontSize: 22,fontWeight: FontWeight.bold),),
                                Text("Discount",style: TextStyle(color: Colors.black54,fontSize: 16,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),




                  SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ThirtyFivePercentPage()));
                        },
                        child: Container(
                          height: 70,
                          width: 85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,

                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 9,left: 4,right: 2,),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("35%",style: TextStyle(color: Colors.red,fontSize: 22,fontWeight: FontWeight.bold),),
                                Text("Discount",style: TextStyle(color: Colors.black54,fontSize: 16,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                        ),
                      ),




                      InkWell(
                        onTap:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FourtyPercentPage()));
                        },
                        child: Container(
                          height: 70,
                          width: 85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,

                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 9,left: 4,right: 2,),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("40%",style: TextStyle(color: Colors.red,fontSize: 22,fontWeight: FontWeight.bold),),
                                Text("Discount",style: TextStyle(color: Colors.black54,fontSize: 16,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                        ),
                      ),




                      InkWell(
                        onTap:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FiftyPercentPage()));
                        },
                        child: Container(
                          height: 70,
                          width: 85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,

                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 9,left: 4,right: 2,),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("50%",style: TextStyle(color: Colors.red,fontSize: 22,fontWeight: FontWeight.bold),),
                                Text("Discount",style: TextStyle(color: Colors.black54,fontSize: 16,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),



                  //SizedBox(height: 30,),
                  /*RaisedButton.icon(
                    onPressed: (){
                      print('Login Button Clicked.');
                      if (_formKey.currentState!.validate()) {
                        //print("Successful");
                        //SignIn();
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
                  ),*/


                  //SizedBox(height: 20,),




                  //SizedBox(height: 30,),
                  //Text('Forgot Password?', style: GoogleFonts.lobster(textStyle: TextStyle(fontSize:10, color: Colors.black, letterSpacing: .5),),),




                  //SizedBox(height: 20,),
                  /*Row(
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
                  ),*/

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
