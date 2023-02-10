import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {



  final Uri _url1 = Uri.parse('https://www.facebook.com/sujonmolla420');
  final Uri _url2 = Uri.parse('https://www.facebook.com/muhammadwasimbishal');
  final Uri _url3 = Uri.parse('https://www.facebook.com/mahiya.jannat.775');

  Future<void> _launchUrl1() async {
    if (!await launchUrl(_url1)) {
      throw 'Could not launch $_url1';
    }
  }

  Future<void> _launchUrl2() async {
    if (!await launchUrl(_url2)) {
      throw 'Could not launch $_url2';
    }
  }

  Future<void> _launchUrl3() async {
    if (!await launchUrl(_url3)) {
      throw 'Could not launch $_url3';
    }
  }


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

        title: Text("About us",style: TextStyle(color: Colors.white,fontSize: 16),),
        centerTitle: true,
      ),



      body: Stack(
        children: [
          Image.asset('assets/background.png',height: double.infinity,width: double.infinity,fit: BoxFit.cover),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 20,),
                  Text("Get ready for your daily shopping and use the 'My Offer app' to find incredible bargains and discounts online."
                      "You can access everything from fashion to beauty, home furnishings, clothes, shoes, electronics, and more.The"
                      "'My Offer App' allows you immediate, limitless access to all the necessary resources so you can get ready for"
                      "your shopping whenever and wherever you are.",style: GoogleFonts.lobster(textStyle: TextStyle(fontSize:20, color: Colors.white, letterSpacing: .5),),),

                  SizedBox(height: 20,),
                  Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/sujan.jpg"),
                      radius: 60,
                    ),
                  ),

                  SizedBox(height: 5,),
                  Center(child: Text("Sujan sunny",style: GoogleFonts.lobster(textStyle: TextStyle(fontSize:20, color: Colors.white, letterSpacing: .5),),)),

                  SizedBox(height: 10,),
                  Text("University of Information Technology And Sciences(UITS)\n"
                      "Email: Sujansunny9@gmail.com\n"
                      "Phone: 01688519033",
                    style: GoogleFonts.lobster(textStyle: TextStyle(fontSize:17, color: Colors.white, letterSpacing: .5),),),


                  SizedBox(height: 10,),
                  Center(
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          _launchUrl1();
                        });
                      },
                      child: Container(
                        height: 45,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black45,
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.facebook,color: Colors.white,),
                            SizedBox(width: 2,),
                            Text("Facebook",style: TextStyle(color: Colors.white),),
                          ],
                        ),
                      ),
                    ),
                  ),




                  SizedBox(height: 30,),
                  Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/washim.jpg"),
                      radius: 60,
                    ),
                  ),

                  SizedBox(height: 5,),
                  Center(child: Text("Muhammad Wasim",style: GoogleFonts.lobster(textStyle: TextStyle(fontSize:20, color: Colors.white, letterSpacing: .5),),)),

                  SizedBox(height: 10,),
                  Text("University of Information Technology And Sciences(UITS)\n"
                      "Email: muhammadwasimbishal@gmail.com\n"
                      "Phone: 01534-372437",
                    style: GoogleFonts.lobster(textStyle: TextStyle(fontSize:17, color: Colors.white, letterSpacing: .5),),),


                  SizedBox(height: 10,),
                  Center(
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          _launchUrl2();
                        });
                      },
                      child: Container(
                        height: 45,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black45,
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.facebook,color: Colors.white,),
                            SizedBox(width: 2,),
                            Text("Facebook",style: TextStyle(color: Colors.white),),
                          ],
                        ),
                      ),
                    ),
                  ),




                  SizedBox(height: 30,),
                  Center(
                    child: CircleAvatar(
                      child: Icon(Icons.face,size: 100,),
                      //backgroundImage: AssetImage("assets/washim.jpg"),
                      radius: 60,
                    ),
                  ),

                  SizedBox(height: 5,),
                  Center(child: Text("Mahiya Jannat",style: GoogleFonts.lobster(textStyle: TextStyle(fontSize:20, color: Colors.white, letterSpacing: .5),),)),

                  SizedBox(height: 10,),
                  Text("University of Information Technology And Sciences(UITS)\n"
                      "Email: mahiyajannat515@gmail.com\n"
                      "Phone: 01866-360147",
                    style: GoogleFonts.lobster(textStyle: TextStyle(fontSize:17, color: Colors.white, letterSpacing: .5),),),


                  SizedBox(height: 10,),
                  Center(
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          _launchUrl3();
                        });
                      },
                      child: Container(
                        height: 45,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black45,
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.facebook,color: Colors.white,),
                            SizedBox(width: 2,),
                            Text("Facebook",style: TextStyle(color: Colors.white),),
                          ],
                        ),
                      ),
                    ),
                  ),



                ],
              )
            ),
          ),
        ],
      ),


    );
  }
}
