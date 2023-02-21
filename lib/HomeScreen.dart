import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool addName=false;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:ui.TextDirection.rtl,

      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        // ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              SizedBox(height: MediaQuery.of(context).size.height*0.11,),
              Center(
                  child: Text("فاتورة مبيعات ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w600
                ),


              )),

              SizedBox(height: MediaQuery.of(context).size.height*0.05,),
              Divider(
                height: 2,
                thickness: 2,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5),
                child: Row(
                  children: [
                    Text(
                        "اسم العميل"+' : ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    SizedBox(width: 2,),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(3.0),
                        child: TextField(
                          autofocus:addName? true:false,
                          readOnly: addName? false:true,
                          decoration: InputDecoration(
                              border: InputBorder.none,

                              // enabledBorder: UnderlineInputBorder( //<-- SEE HERE
                              //   borderSide: BorderSide(
                              //       width: 1, color: Colors.grey),
                              // ),
                            //  hintText: "Password",
                              hintStyle: TextStyle(color: Colors.grey[400])
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    ElevatedButton(onPressed: (){
                      setState(() {
                        addName=!addName;
                      });
                      print(addName);
                    }, child: Text("Add"))

                    // RichText(
                    //     text: TextSpan(
                    //         text: "اسم العميل"+' : ',
                    //         style: TextStyle(
                    //             color: Colors.black,
                    //             fontSize: 15,
                    //             fontWeight: FontWeight.w600
                    //         ),
                    //         children: <TextSpan>[
                    //           TextSpan(
                    //             text: "",
                    //             style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
                    //           )
                    //         ]
                    //     )
                    //
                    // ),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5),
                child: Row(
                  children: [
                    Text(
                      "تاريخ الطباعة"+' : ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    Spacer(),
                    Text(
                      "12/12/2023",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                      ),
                    ),




                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5),
                child: Row(
                  children: [
                    Text(
                      "رقم الفاتورة "+' : ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    Spacer(),
                    Text(
                      "12122023",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                      ),
                    ),




                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5),
                child: Row(
                  children: [
                    Text(
                      "البائع "+' : ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    Spacer(),
                    Text(
                      "حسني ابو تمام",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                      ),
                    ),




                  ],
                ),
              ),
              Divider(
                height: 2,
                thickness: 2,
              )

            ],
          ),
        ),
      ),
    );
  }
}
