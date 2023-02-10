
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:offer_app/about_page.dart';
import 'package:offer_app/dashboard_page.dart';
import 'package:offer_app/home_page.dart';
import 'package:offer_app/login_page.dart';
import 'package:offer_app/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      //controller: ZoomDrawerController,
      style: DrawerStyle.defaultStyle,
      menuScreen: MenuScreen(),
      mainScreen: DashboardPage(),
      openCurve: Curves.easeIn,
      closeCurve: Curves.easeOut,
      //openCurve: Curves.fastOutSlowIn,
      //closeCurve: Curves.bounceIn,
    );
  }
}




class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {


  final storage = new FlutterSecureStorage();
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
      backgroundColor: Colors.black87,

      body: ListView(

        children: [
          UserAccountsDrawerHeader(

            accountName: Text("${loggedInUser.userName}"), accountEmail: Text("${loggedInUser.email}"),
            currentAccountPicture: CircleAvatar(
              //backgroundImage: NetworkImage("data:image/jpeg;base64,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"),

              child: Icon(Icons.person,color: Colors.white,size: 60,),
              backgroundColor: Colors.black,

            ),
            decoration: BoxDecoration(
              color: Colors.black45,
            ),
          ),


          Card(
            child: ListTile(
              leading: Icon(Icons.home,color: Colors.black,),
              title: Text("Home"),
              //tileColor: Colors.white,
            ),
          ),

          Card(
            child: ListTile(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AboutPage(

                        )));
              },
              leading: FaIcon(FontAwesomeIcons.addressCard,color: Colors.black,),
              title: Text("About"),
              //tileColor: Colors.white,
            ),
          ),

          Card(
            child: ListTile(
              onTap: (){
                /*Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GridViewBuildeClass(

                        )));*/
              },

              leading: Icon(Icons.settings,color: Colors.black,),
              title: Text("Update Profile"),
              //tileColor: Colors.white,
            ),
          ),



          Card(
            child: ListTile(
              onTap: (){


                //final prefs = await SharedPreferences.getInstance();
                //prefs.remove("email");
                Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));

                logout(context);
                /*Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GridViewBuildeClass(

                        )));*/
              },

              leading: FaIcon(FontAwesomeIcons.signOut,color: Colors.black,),
              title: Text("Sign Out"),
              //tileColor: Colors.white,
            ),
          ),



          SizedBox(height: 60,),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text("Call- 01534372437",style: TextStyle(color: Colors.white),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text("974/1 East Shewrapara",style: TextStyle(color: Colors.white),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text("Dhaka-1206",style: TextStyle(color: Colors.white),),
          ),

        ],


      ),
    );
  }

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    await storage.delete(key: "uid");
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginPage()));
  }
}

