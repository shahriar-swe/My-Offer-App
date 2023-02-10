import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:offer_app/dashboard_page.dart';
import 'package:offer_app/login_page.dart';
import 'package:offer_app/navigation_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';



String ?finalEmail;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  /*Future getValidationData()async{
    final prefs = await SharedPreferences.getInstance();
    var obtainEmail = prefs.getString("email");

    setState(() {
      finalEmail = obtainEmail;
    });
    print(finalEmail);
  }*/


  final storage = new FlutterSecureStorage();
  Future<bool> checkLoginStatus()async{
    String? value = await storage.read(key: "uid");

    if(value == null){
      return false;
    }return true;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: /*Column(
          children: [
            Lottie.network("https://assets6.lottiefiles.com/packages/lf20_wzgyw4zk.json"),
            SizedBox(height: 20,),
            Text("Panda Food Delivery",style: GoogleFonts.lobster(textStyle: TextStyle(fontSize:20, color: Colors.amber, letterSpacing: .5),),),
          ],
        ),*/

        Stack(
          children: [
            //Image.asset('assets/background.png',height: double.infinity,width: double.infinity,fit: BoxFit.cover),
            Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/logo.png"),
                    radius: 60,
                  ),
                ),
                SizedBox(height: 10,),
                Text('My Offer', style: GoogleFonts.lobster(textStyle: TextStyle(fontSize:20, color: Colors.white, letterSpacing: .5),),),
              ],
            ),



          ],
        ),

        /*Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyqElvUCSdh7IgSMn071t53-0ceEGGVuXI1g&usqp=CAU"),
              radius: 60,
            ),
            //Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyqElvUCSdh7IgSMn071t53-0ceEGGVuXI1g&usqp=CAU"),
            SizedBox(height: 20,),
            Text("Panda Food Delivery"),
          ],
        ),*/
        backgroundColor: Colors.blue,
        splashIconSize: 550,
        duration: 2000,
        splashTransition: SplashTransition.fadeTransition,
        //pageTransitionType: Pagetransi,
        nextScreen: FutureBuilder(
          future: checkLoginStatus(),
            builder: (BuildContext context, AsyncSnapshot<bool>snapshot){
              if(snapshot.data == false){
                return LoginPage();
              }if(snapshot.connectionState == ConnectionState.waiting){
                return Container(
                  color: Colors.white,
                    child: Center(child: CircularProgressIndicator()));
              }return NavigationDrawer();
            }),
    );
  }
}
