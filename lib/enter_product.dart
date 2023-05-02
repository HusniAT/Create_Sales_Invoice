// import 'package:fawaterkom/add_fatwora.dart';
// import 'package:flutter/material.dart';
// import 'dart:ui' as ui;
//
// class EnterProduct extends StatefulWidget {
//   const EnterProduct({Key? key}) : super(key: key);
//
//   @override
//   _EnterProductState createState() => _EnterProductState();
// }
//
// class _EnterProductState extends State<EnterProduct> {
//   final TextEditingController customerNamesController=TextEditingController();
//   final TextEditingController productNameController=TextEditingController();
//   final TextEditingController productQuantityController=TextEditingController();
//   double total=0.0;
//   double price=50.0;
//
//   List<String> suggestons = ["USA", "UK", "Uganda", "Uruguay", "United Arab Emirates"];
//
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection:ui.TextDirection.rtl,
//
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("إنشاء فاتورة "),
//           centerTitle: true,
//           backgroundColor: Colors.blue[900],
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//                SizedBox(height: MediaQuery.of(context).size.height*0.05,),
//               Center(
//                   child: Text("اضافة عنصر ",
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 25,
//                         fontWeight: FontWeight.w600
//                     ),
//
//
//                   )),
//               SizedBox(height: 5),
//
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5),
//                 child: Row(
//                   children: [
//                     Text(
//                       "اسم العميل"+' : ',
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 15,
//                           fontWeight: FontWeight.w600
//                       ),
//                     ),
//                     SizedBox(width: 2,),
//                     Expanded(
//                       child: Container(
//                         padding: EdgeInsets.all(3.0),
//                         child: SizedBox(
//                           height: 50,
//                           child: TextField(
//                             controller:customerNamesController ,
//                           onSubmitted: (String? newval){
//                               customerNamesController.text=newval!;
//                               print(customerNamesController.text);
//                           },
//
//                           //  autofocus:addName? true:false,
//                           //  readOnly: addName? false:true,
//                             decoration: InputDecoration(
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                     width: 1.5, color: Colors.grey), //<-- SEE HERE
//                               ),
//                                 focusedBorder:OutlineInputBorder(
//                                   borderSide: BorderSide(
//                                       width: 1.5, color: Colors.grey), //<-- SEE HERE
//                                 ),
//                             ),
//                       ),
//                         ),
//                     ),
//                     ),
//                    // Spacer(),
//                     // ElevatedButton(onPressed: (){
//                     //   setState(() {
//                     //    // addName=!addName;
//                     //   });
//                     //  // print(addName);
//                     // }, child: Text("Add"))
//
//                     // RichText(
//                     //     text: TextSpan(
//                     //         text: "اسم العميل"+' : ',
//                     //         style: TextStyle(
//                     //             color: Colors.black,
//                     //             fontSize: 15,
//                     //             fontWeight: FontWeight.w600
//                     //         ),
//                     //         children: <TextSpan>[
//                     //           TextSpan(
//                     //             text: "",
//                     //             style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
//                     //           )
//                     //         ]
//                     //     )
//                     //
//                     // ),
//
//                   ],
//                 ),
//               ),
//
//               // Padding(
//               //   padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5),
//               //   child: Row(
//               //     children: [
//               //       Text(
//               //         "المادة "+' :        ',
//               //         style: TextStyle(
//               //             color: Colors.black,
//               //             fontSize: 15,
//               //             fontWeight: FontWeight.w600
//               //         ),
//               //       ),
//               //       SizedBox(width: 2,),
//               //       Expanded(
//               //         child: Container(
//               //           padding: EdgeInsets.all(3.0),
//               //           child: TextField(
//               //             //  autofocus:addName? true:false,
//               //             //  readOnly: addName? false:true,
//               //             decoration: InputDecoration(
//               //               enabledBorder: OutlineInputBorder(
//               //                 borderSide: BorderSide(
//               //                     width: 1.5, color: Colors.grey), //<-- SEE HERE
//               //               ),
//               //               focusedBorder:OutlineInputBorder(
//               //                 borderSide: BorderSide(
//               //                     width: 1.5, color: Colors.grey), //<-- SEE HERE
//               //               ),
//               //             ),
//               //           ),
//               //         ),
//               //       ),
//               //       // Spacer(),
//               //       // ElevatedButton(onPressed: (){
//               //       //   setState(() {
//               //       //    // addName=!addName;
//               //       //   });
//               //       //  // print(addName);
//               //       // }, child: Text("Add"))
//               //
//               //       // RichText(
//               //       //     text: TextSpan(
//               //       //         text: "اسم العميل"+' : ',
//               //       //         style: TextStyle(
//               //       //             color: Colors.black,
//               //       //             fontSize: 15,
//               //       //             fontWeight: FontWeight.w600
//               //       //         ),
//               //       //         children: <TextSpan>[
//               //       //           TextSpan(
//               //       //             text: "",
//               //       //             style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
//               //       //           )
//               //       //         ]
//               //       //     )
//               //       //
//               //       // ),
//               //
//               //     ],
//               //   ),
//               // ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5),
//                 child: Row(
//                   children: [
//                     Text(
//                       "المادة "+' :        ',
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 15,
//                           fontWeight: FontWeight.w600
//                       ),
//                     ),
//                     SizedBox(width: 2,),
//                     Expanded(
//                       child: Container(
//                           height: 50,
//                           // padding: EdgeInsets.all(3.0),
//                           child: InputDecorator(
//                             decoration: InputDecoration(
//                                 contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 4),
//                                 border: OutlineInputBorder(gapPadding: 1),
//
//                                 focusedBorder: InputBorder.none, //Add this Removing the Underline/Border only when Focused
//                                 hintText: "Search..",
//                                 filled: false
//                             ),
//                             child: Autocomplete(
//                               optionsBuilder: (TextEditingValue textEditingValue) {
//                                 if (textEditingValue.text == '') {
//                                   return const Iterable<String>.empty();
//                                 }else{
//                                   List<String> matches = <String>[];
//                                   matches.addAll(suggestons);
//
//                                   matches.retainWhere((s){
//                                     return s.toLowerCase().contains(textEditingValue.text.toLowerCase());
//                                   });
//                                   return matches;
//                                 }
//                               },
//                               onSelected: (String selection) {
//                                // controller:customerNamesController ,
//                                // onSubmitted: (String? newval){
//                                 productNameController.text=selection;
//                                 print(productNameController.text);
//                               //  },
//                                 print(' -------- You just selected $selection');
//                               },
//                             ),
//                           )
//                       ),
//                     ),
//                     // Spacer(),
//                     // ElevatedButton(onPressed: (){
//                     //   setState(() {
//                     //    // addName=!addName;
//                     //   });
//                     //  // print(addName);
//                     // }, child: Text("Add"))
//
//                     // RichText(
//                     //     text: TextSpan(
//                     //         text: "اسم العميل"+' : ',
//                     //         style: TextStyle(
//                     //             color: Colors.black,
//                     //             fontSize: 15,
//                     //             fontWeight: FontWeight.w600
//                     //         ),
//                     //         children: <TextSpan>[
//                     //           TextSpan(
//                     //             text: "",
//                     //             style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
//                     //           )
//                     //         ]
//                     //     )
//                     //
//                     // ),
//
//                   ],
//                 ),
//               ),
//
//
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5),
//                 child: Row(
//                   children: [
//                     Text(
//                       "الكمية "+' :       ',
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 15,
//                           fontWeight: FontWeight.w600
//                       ),
//                     ),
//                     SizedBox(width: 2,),
//                     Container(
//                       height: 50,
//                       width: 150,
//                       padding: EdgeInsets.all(3.0),
//                       child: TextField(
//                         //  autofocus:addName? true:false,
//                         //  readOnly: addName? false:true,
//                         decoration: InputDecoration(
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 width: 1.5, color: Colors.grey), //<-- SEE HERE
//                           ),
//                           focusedBorder:OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 width: 1.5, color: Colors.grey), //<-- SEE HERE
//                           ),
//                         ),
//
//                         controller:productQuantityController ,
//
//                         onSubmitted: (String? newval){
//                           productQuantityController.text=newval!;
//                           print(productQuantityController.text);
//
//
//                           setState(() {
//                             total=double.parse(productQuantityController.text)*price;
//
//                           });
//                           print(total);
//                         },
//                         onChanged: (String? newval){
//                           productQuantityController.text=newval!;
//                           print(productQuantityController.text);
//
//
//                           setState(() {
//                             total=double.parse(productQuantityController.text)*price;
//                           });
//                           print(total);
//                         },
//                         // onSubmitted: (String newWord){
//                         //   print("all");
//                         //   print("$newWord");
//                         //
//                         // },
//                       ),
//                     ),
//                     // Spacer(),
//                     // ElevatedButton(onPressed: (){
//                     //   setState(() {
//                     //    // addName=!addName;
//                     //   });
//                     //  // print(addName);
//                     // }, child: Text("Add"))
//
//                     // RichText(
//                     //     text: TextSpan(
//                     //         text: "اسم العميل"+' : ',
//                     //         style: TextStyle(
//                     //             color: Colors.black,
//                     //             fontSize: 15,
//                     //             fontWeight: FontWeight.w600
//                     //         ),
//                     //         children: <TextSpan>[
//                     //           TextSpan(
//                     //             text: "",
//                     //             style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
//                     //           )
//                     //         ]
//                     //     )
//                     //
//                     // ),
//
//                   ],
//                 ),
//               ),
//
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5),
//                 child: Row(
//                   children: [
//                     Text(
//                       "السعر "+' :       ',
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 15,
//                           fontWeight: FontWeight.w600
//                       ),
//                     ),
//                     SizedBox(width: 2,),
//                     Container(
//                       height: 50,
//                       width: 150,
//                       padding: EdgeInsets.all(3.0),
//                       child: TextField(
//                         //  autofocus:addName? true:false,
//                           readOnly: true,
//
//                         decoration: InputDecoration(
//                           hintText: "$price",
//
//                           enabledBorder: OutlineInputBorder(
//
//                             borderSide: BorderSide(
//                                 width: 1.5, color: Colors.grey), //<-- SEE HERE
//                           ),
//                           focusedBorder:OutlineInputBorder(
//
//                             borderSide: BorderSide(
//                                 width: 1.5, color: Colors.grey), //<-- SEE HERE
//                           ),
//                         ),
//                       ),
//                     ),
//                     // Spacer(),
//                     // ElevatedButton(onPressed: (){
//                     //   setState(() {
//                     //    // addName=!addName;
//                     //   });
//                     //  // print(addName);
//                     // }, child: Text("Add"))
//
//                     // RichText(
//                     //     text: TextSpan(
//                     //         text: "اسم العميل"+' : ',
//                     //         style: TextStyle(
//                     //             color: Colors.black,
//                     //             fontSize: 15,
//                     //             fontWeight: FontWeight.w600
//                     //         ),
//                     //         children: <TextSpan>[
//                     //           TextSpan(
//                     //             text: "",
//                     //             style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
//                     //           )
//                     //         ]
//                     //     )
//                     //
//                     // ),
//
//                   ],
//                 ),
//               ),
//
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5),
//                 child: Row(
//                   children: [
//                     Text(
//                       "المجموع "+' :   ',
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 15,
//                           fontWeight: FontWeight.w600
//                       ),
//                     ),
//                     SizedBox(width: 2,),
//                     Container(
//                       height: 50,
//                       width: 150,
//                       padding: EdgeInsets.all(3.0),
//                       child: TextField(
//
//                         //  autofocus:addName? true:false,
//                         //  readOnly: addName? false:true,
//                         decoration: InputDecoration(
//                           hintText: "$total",
//
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 width: 1.5, color: Colors.grey), //<-- SEE HERE
//                           ),
//                           focusedBorder:OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 width: 1.5, color: Colors.grey), //<-- SEE HERE
//                           ),
//                         ),
//                       ),
//                     ),
//                     // Spacer(),
//                     // ElevatedButton(onPressed: (){
//                     //   setState(() {
//                     //    // addName=!addName;
//                     //   });
//                     //  // print(addName);
//                     // }, child: Text("Add"))
//
//                     // RichText(
//                     //     text: TextSpan(
//                     //         text: "اسم العميل"+' : ',
//                     //         style: TextStyle(
//                     //             color: Colors.black,
//                     //             fontSize: 15,
//                     //             fontWeight: FontWeight.w600
//                     //         ),
//                     //         children: <TextSpan>[
//                     //           TextSpan(
//                     //             text: "",
//                     //             style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
//                     //           )
//                     //         ]
//                     //     )
//                     //
//                     // ),
//
//                   ],
//                 ),
//               ),
//               SizedBox(height: MediaQuery.of(context).size.height*0.05,),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Container(
//                     width:200,
//                     decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           offset: const Offset(0, 13),
//                           blurRadius: 25,
//                           color: const Color(0xFF56B3C2).withOpacity(0.17),
//                         ),
//                       ],
//                     ),
//                     child: TextButton(
//                       style: TextButton.styleFrom(
//                         backgroundColor:  Colors.green,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(50)),
//                       ),
//                       //color: const Color(0xFFBD0925),
//                       onPressed: () async {
//                         // if(_selectedStudentNames==''){
//                         //   AnimatedSnackBar.material(
//                         //     'No Student Selected',
//                         //     type: AnimatedSnackBarType.error,
//                         //     mobileSnackBarPosition: MobileSnackBarPosition.top,
//                         //     desktopSnackBarPosition: DesktopSnackBarPosition.topRight,
//                         //   ).show(context);
//                         //   // Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rotate,alignment: Alignment.center ,duration: const Duration(milliseconds: 1000), child:   const EmployeeProfile()));
//                         //
//                         // }
//                         // else{
//                         //   //  print(studentId);
//                         //   Navigator.push(context, MaterialPageRoute(builder: (context)=>  ParentStudentMark(studentId: studentId,)));// signup
//                         //
//                         //   // Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft,alignment: Alignment.center ,duration: const Duration(milliseconds: 1000), child:  ParentStudentMark(studentId: studentId,)));
//                         //
//                         // }
//
//                         setState(() {
//
//                         });
//                         },
//                       child: Padding(
//                         padding: const EdgeInsets.all(2.0),
//                         child: FittedBox(
//                           child: Text(
//                             'اضافة عنصر جديد',
//                             // "Back".toUpperCase(),
//                             style:  TextStyle(color: Colors.white,fontSize: 15,fontFamily:'DroidNaskh',),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 15,),
//                   Container(
//                     width:200,
//                     decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           offset: const Offset(0, 13),
//                           blurRadius: 25,
//                           color: const Color(0xFF56B3C2).withOpacity(0.17),
//                         ),
//                       ],
//                     ),
//                     child: TextButton(
//                       style: TextButton.styleFrom(
//                         backgroundColor: const Color(0xFFBD0925),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(50)),
//                       ),
//                       //color: const Color(0xFFBD0925),
//                       onPressed: () async {
//                       //  Navigator.push(context, MaterialPageRoute(builder: (context)=>  const ShowFawater  ()));
//
//                         // if(_selectedStudentNames==''){
//                         //   AnimatedSnackBar.material(
//                         //     'No Student Selected',
//                         //     type: AnimatedSnackBarType.error,
//                         //     mobileSnackBarPosition: MobileSnackBarPosition.top,
//                         //     desktopSnackBarPosition: DesktopSnackBarPosition.topRight,
//                         //   ).show(context);
//                         //   // Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rotate,alignment: Alignment.center ,duration: const Duration(milliseconds: 1000), child:   const EmployeeProfile()));
//                         //
//                         // }
//                         // else{
//                         //   //  print(studentId);
//                         //   Navigator.push(context, MaterialPageRoute(builder: (context)=>  ParentStudentMark(studentId: studentId,)));// signup
//                         //
//                         //   // Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft,alignment: Alignment.center ,duration: const Duration(milliseconds: 1000), child:  ParentStudentMark(studentId: studentId,)));
//                         //
//                         // }
//
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.all(2.0),
//                         child: FittedBox(
//                           child: Text(
//                             'طباعة الفاتورة ',
//                             // "Back".toUpperCase(),
//                             style:  TextStyle(color: Colors.white,fontSize: 15,fontFamily:'DroidNaskh',),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//
//                 ],
//               ),
//
//
//
//
//               // Center(
//               //   child: Container(
//               //     width: MediaQuery.of(context).size.width*0.6,
//               //     height: 50,
//               //     child: ElevatedButton(
//               //       child: FittedBox(child: const Text("اضافة فاتورة ",style: TextStyle(fontSize: 20),)),
//               //       style: ElevatedButton.styleFrom(
//               //         backgroundColor: Colors.green,
//               //         elevation: 0,
//               //       ),
//               //       onPressed: () {
//               //         print("اضافة فاتورة ");
//               //       },
//               //     ),
//               //   ),
//               // ),
//               // SizedBox(height: 10,),
//               // Center(
//               //   child: Container(
//               //     width: MediaQuery.of(context).size.width*0.6,
//               //     height: 50,
//               //     child: ElevatedButton(
//               //       child: FittedBox(child: const Text("عرض الفواتير ",style: TextStyle(fontSize: 20),)),
//               //       style: ElevatedButton.styleFrom(
//               //         backgroundColor: Colors.lightBlueAccent,
//               //         elevation: 0,
//               //       ),
//               //       onPressed: () {
//               //         print("اضافة فاتورة ");
//               //       },
//               //     ),
//               //   ),
//               // ),
//               // SizedBox(height: 10,),
//               //
//               // Center(
//               //   child: Container(
//               //     width: MediaQuery.of(context).size.width*0.6,
//               //     height: 50,
//               //     child: ElevatedButton(
//               //       child: FittedBox(child: const Text(" تسجيل الخروج ",style: TextStyle(fontSize: 20),)),
//               //       style: ElevatedButton.styleFrom(
//               //         backgroundColor: Colors.red,
//               //         elevation: 0,
//               //       ),
//               //       onPressed: () {
//               //         print("تسجيل الخروج  ");
//               //       },
//               //     ),
//               //   ),
//               // ),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
