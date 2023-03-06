import 'package:fawaterkom/select_section.dart';
import 'package:fawaterkom/add_fatwora.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      home:  const LoginPage(),
    );
  }
}

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 400,
                decoration: const BoxDecoration(
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
                        margin: const EdgeInsets.only(top: 50),
                        child: const Center(
                          child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                        ),
                      )

                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[

                        Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
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
                            padding: const EdgeInsets.all(8.0),
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
                            padding: const EdgeInsets.all(8.0),
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

                    const SizedBox(height: 30,),

                        InkWell(
                          onTap: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>   SelectSection  ()));

                           // Navigator.push(context, MaterialPageRoute(builder: (context)=>  const HomeScreen  ()));
                            },
                          child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                                colors: [
                                  Color.fromRGBO(143, 148, 251, 1),
                                  Color.fromRGBO(143, 148, 251, .6),
                                ]
                            )
                      ),
                      child: const Center(
                          child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                      ),
                    ),
                        ),

                    const SizedBox(height: 70,),
                        const Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),)


                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade300,//Colors.blue[900], // Colors.red.shade300,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.only(top: 50,bottom: 20),
                child: Image.asset(
                  'assets/images/profile.png',
                 // height: 200,
                //  width: 200,

                 // width: MediaQuery.of(context).size.width*0.5,
                  height: MediaQuery.of(context).size.height*0.3,
                ),
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.8,
              padding: const EdgeInsets.symmetric(horizontal: 32),
             // constraints: BoxConstraints.expand(),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35))),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    'تسجيل الدخول ',
                    style:
                    TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: emailController,
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      // icon: Icon(Icons.mail),
                        prefixIcon: const Icon(Icons.mail),
                        suffixIcon: emailController.text.isEmpty
                            ? const Text('')
                            : GestureDetector(
                            onTap: () {
                              emailController.clear();
                            },
                            child: const Icon(Icons.close)
                        ),
                        hintText: 'example@mail.com',
                        labelText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                            const BorderSide(color: Colors.red, width: 1))),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    obscureText: isVisible,
                    controller: passwordController,
                    onChanged: (value) {
                   //   print(value);
                    },
                    //
                    decoration: InputDecoration(
                      // icon: Icon(Icons.mail),
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: GestureDetector(
                            onTap: () {
                              isVisible = !isVisible;
                              setState(() {});
                            },
                            child: Icon(isVisible ? Icons.visibility : Icons.visibility_off)),
                        hintText: 'type your password',
                        labelText: 'Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                            const BorderSide(color: Colors.red, width: 1))),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(

                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Colors.teal,
                        shadowColor: Colors.red,
                        elevation: 5,
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>   SelectSection  ()));

                        // showDialog(context: context, builder: (context){
                        //   return SimpleDialog(
                        //     title: Text('Your submitted data '),
                        //     children: [
                        //       ListTile(
                        //         leading: Icon(Icons.mail),
                        //         title: Text(emailController.text.toString()),
                        //       ),
                        //       ListTile(
                        //         leading: Icon(Icons.lock),
                        //         title: Text(passwordController.text.toString()),
                        //       ),
                        //     ],
                        //   );
                        // });

                      }, child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Text('Submit'),
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}