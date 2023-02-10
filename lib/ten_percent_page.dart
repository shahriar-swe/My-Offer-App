import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TenPercentPage extends StatefulWidget {
  const TenPercentPage({Key? key}) : super(key: key);

  @override
  State<TenPercentPage> createState() => _TenPercentPageState();
}

class _TenPercentPageState extends State<TenPercentPage> {


  FirebaseFirestore firestoreRef = FirebaseFirestore.instance;
  FirebaseStorage storageRef = FirebaseStorage.instance;
  String collectionName = 'ten';


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

        title: Text("10% Offer Items are displayed here",style: TextStyle(color: Colors.white,fontSize: 16),),
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
                    child: Image.asset("assets/icon10.png",height: 180,width: 225,fit: BoxFit.cover,),
                  ),


                  //SizedBox(height: 20,),
                  //Text("Panda Food Delivery",style: GoogleFonts.lobster(textStyle: TextStyle(fontSize:20, color: Colors.blue, letterSpacing: .5),),),


                  /* String? brandName = snapshot.data!.docs[index]['bname'];
            String? image = snapshot.data!.docs[index]['image'];
          String? webUrl = snapshot.data!.docs[index]['weburl'];*/
                  SizedBox(height: 35,),


                  //Firebase
                  Container(
                    height: 300,
                    child: FutureBuilder<QuerySnapshot>(
                        future: FirebaseFirestore.instance.collection(collectionName).get(),
                        builder: (context, snapshot){
                          if(snapshot.connectionState == ConnectionState.waiting){
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          else if(snapshot.hasData && snapshot.data!.docs.length >0){
                            List<DocumentSnapshot> arrData = snapshot.data!.docs;
                            return Container(
                              height: 300,
                              child: GridView.builder(
                                  itemCount: arrData.length,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 10, mainAxisSpacing: 10,),
                                  itemBuilder: (context,index){
                                    //var items = grid_item[index];
                                    String? brandName = snapshot.data!.docs[index]['bname'];
                                    String? image = snapshot.data!.docs[index]['image'];
                                    String? webUrl = snapshot.data!.docs[index]['weburl'];

                                    return InkWell(
                                      onTap: (){
                                        setState(() {
                                          //_mapurlLancher();

                                          //if (!await (launch(webUrl))) throw 'Could not find ${webUrl}';

                                          launch('${webUrl}');
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 70,
                                            width: 85,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8),
                                              color: Colors.white,

                                            ),
                                            child: Image.network(arrData[index]['image'],height: double.infinity,width: double.infinity,fit: BoxFit.fill,),
                                          ),



                                          SizedBox(height: 5,),
                                          Text(arrData[index]['bname'],style: TextStyle(fontSize: 16,color: Colors.black54,fontWeight: FontWeight.w600),),

                                        ],
                                      ),
                                    );
                                  }),
                            );
                          }else{
                            return Center(
                              child: Container(
                                height: 300,
                                width: 250,

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                ),

                                child: Image.asset("assets/nooffer.png",height: double.infinity,width: double.infinity,fit: BoxFit.cover,),
                              ),
                            );
                          }
                        }
                    ),
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
