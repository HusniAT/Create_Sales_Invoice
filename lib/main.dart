import 'package:fawaterkom/HomeScreen.dart';
import 'package:fawaterkom/select_section.dart';
import 'package:fawaterkom/show_fatwora.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//import 'Animation/FadeAnimation.dart';

void main() {

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<TableItem>(
        create: (_)=>TableItem(),
      ),
      ChangeNotifierProvider<TableItemsContent>(
        create: (_)=>TableItemsContent(),
      ),

    ],
    child: const MyApp(),
  ),
  );


     // const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:  LogIn(),
    );
  }
}

class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background.png'),
                          fit: BoxFit.fill
                      )
                  ),
                  child: Stack(
                    children: <Widget>[
                      // Positioned(
                      //   left: 30,
                      //   width: 80,
                      //   height: 200,
                      //   child:
                      //       Container(
                      //     decoration: BoxDecoration(
                      //         image: DecorationImage(
                      //             image: AssetImage('assets/images/light-1.png')
                      //         )
                      //     ),
                      //   )
                      //
                      // ),
                      // Positioned(
                      //   left: 140,
                      //   width: 80,
                      //   height: 150,
                      //   child:
                      //       Container(
                      //     decoration: BoxDecoration(
                      //         image: DecorationImage(
                      //             image: AssetImage('assets/images/light-2.png')
                      //         )
                      //     ),
                      //   )),

                      // Positioned(
                      //   right: 40,
                      //   top: 40,
                      //   width: 80,
                      //   height: 150,
                      //   child:
                      //       Container(
                      //     decoration: BoxDecoration(
                      //         image: DecorationImage(
                      //             image: AssetImage('assets/images/clock.png')
                      //         )
                      //     ),
                      //   )
                      //
                      // ),
                      Positioned(
                        child:
                            Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Center(
                            child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                          ),
                        )

                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[

                          Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10)
                              )
                            ]
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[100]!))
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Email or Phone number",
                                    hintStyle: TextStyle(color: Colors.grey[400])
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.grey[400])
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      SizedBox(height: 30,),

                          InkWell(
                            onTap: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>   SelectSection  ()));

                             // Navigator.push(context, MaterialPageRoute(builder: (context)=>  const HomeScreen  ()));
                              },
                            child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [
                                    Color.fromRGBO(143, 148, 251, 1),
                                    Color.fromRGBO(143, 148, 251, .6),
                                  ]
                              )
                        ),
                        child: Center(
                            child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        ),
                      ),
                          ),

                      SizedBox(height: 70,),
                          Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),)


                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
