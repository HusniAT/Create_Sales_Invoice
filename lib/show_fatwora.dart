import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'dart:ui' as ui;
import 'dart:math';


import 'package:provider/provider.dart';

import 'TestEditable/text_dialog_widget.dart';
import 'TestEditable/users.dart';
import 'TestEditable/utils.dart';
import 'api/pdf_api.dart';
import 'api/pdf_invoice_ap2i.dart';
import 'model/Footer.dart';
import 'model/Header.dart';
import 'model/invoice.dart';

class ShowFawater extends StatefulWidget {

  const ShowFawater({Key? key,required this.customerName}) : super(key: key);

  final String? customerName;
  @override
  State<ShowFawater> createState() => _ShowFawaterState();
}

class _ShowFawaterState extends State<ShowFawater> {

  final _formKey=GlobalKey<FormState>();


  final TextEditingController customerNamesController=TextEditingController();
  final TextEditingController productNameController=TextEditingController();
  final TextEditingController productQuantityController=TextEditingController();
  final TextEditingController productPriceController=TextEditingController();

  final TextEditingController productDiscountController=TextEditingController();


  double total=0.0;
  double total2=0.0;

  double price=50.0;
  List<String> suggestons = ["USA", "UK", "Uganda", "Uruguay", "United Arab Emirates"];


  bool showTotal=false;
  bool allowEdit=true;


  String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  final Map<String,String>_productData={







  };


    // late List<User> users;
     @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // this.users = List.of(allUsers);
  }


  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> listOfColumns = [
      // {"Name": "AAAAAA", "Number": "1", "State": "Yes"},
      // {"Name": "BBBBBB", "Number": "2", "State": "no"},
      // {"Name": "CCCCCC", "Number": "3", "State": "Yes"}
    ];
    listOfColumns.add({"Name": "AAAAAA", "Number": "1", "State": "Yes"});
    return Directionality(
      textDirection: ui.TextDirection.rtl,

      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        // ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              SizedBox(height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.11,),
              Center(child: Text("فاتورة مبيعات ",
                    style: TextStyle(
                      fontSize: 40,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 3
                        ..color = Colors.blue.withOpacity(0.8)!,
                    ),
                  )),

              SizedBox(height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.02,),

              const Divider(
                height: 2,
                color: Colors.black,
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 18.0, vertical: 1),
                child: Row(
                  children: [
                    const Text(
                      "اسم العميل" + '  :  ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                    const SizedBox(width: 2,),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: TextField(
                          //   autofocus:addName? true:false,
                            readOnly: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                                hintText: widget.customerName,
                              hintStyle: const TextStyle(
                                  color: Colors.black45,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600
                              ),
                          ),
                        ),
                      ),
                    ),


                    // Spacer(),
                    // ElevatedButton(onPressed: (){
                    //   setState(() {
                    //     addName=!addName;
                    //   });
                    //   print(addName);
                    // }, child: Text("Add"))

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
                padding: const EdgeInsets.symmetric(
                    horizontal: 18.0, vertical: 1),
                child: Row(
                  children: [
                    const Text(
                      "تاريخ الطباعة" + '  :  ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Text(
                        currentDate,

                       // "12/12/2023",
                        style: const TextStyle(
                            color: Colors.black45,
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 18.0, vertical: 5),
                child: Row(
                  children: const [
                    Text(
                      "رقم الفاتورة " + '  :  ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(left: 18.0),
                      child: Text(
                        "12122023",
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),


                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 18.0, vertical: 5),
                child: Row(
                  children: const [
                    Text(
                      "البائع " + '  :  ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(left: 18.0),
                      child: Text(
                        "حسني ابو تمام",
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),


                  ],
                ),
              ),
              const SizedBox(height:5,),
              const Divider(
                height: 2,
                color: Colors.black,
                thickness: 2,
              ),

              // Table(
              //     border: TableBorder.all(), // Allows to add a border decoration around your table
              //     children: [
              //       TableRow(children :[
              //         Text('Year'),
              //         Text('Lang'),
              //         Text('Author'),
              //       ]),
              //       TableRow(children :[
              //         Text('2011',),
              //         Text('Dart'),
              //         Text('Lars Bak'),
              //       ]),
              //       TableRow(children :[
              //         Text('1996'),
              //         Text('Java'),
              //         Text('James Gosling'),
              //       ]),
              //     ]
              // ),

              // FittedBox(
              //   child: DataTable(
              //       headingRowColor:
              //       MaterialStateColor.resolveWith((states) => Colors.grey.withOpacity(0.5)),
              //       dataRowHeight: 70,
              //      // headingRowHeight: 60,
              //       columns: [
              //         DataColumn(
              //           label: Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: Text('  المادة'),
              //           ),
              //         ),
              //         DataColumn(
              //           label: Text('الكمية '),
              //         ),
              //         DataColumn(
              //           label: Text('السعر '),
              //         ),
              //         DataColumn(
              //           label: Text('المجموع '),
              //         ),
              //       ],
              //       rows: [
              //
              //         DataRow(cells: [
              //           DataCell(Text('1')),
              //           DataCell(Text('Arshik')),
              //           DataCell(Text('5644645')),
              //           DataCell(Text('3')),
              //         ])
              //       ]),
              // ),

              // FittedBox(
              //   child: Consumer<TableItem>(
              //     builder: (context, tableItem, _) => DataTable(
              //       headingRowColor:
              //       MaterialStateColor.resolveWith((states) => Colors.grey.withOpacity(0.5)),
              //       dataRowHeight: 70,
              //       columns: [
              //         DataColumn(
              //           label: Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: Text('  المادة'),
              //           ),
              //         ),
              //         DataColumn(
              //           label: Text('الكمية '),
              //         ),
              //         DataColumn(
              //           label: Text('السعر '),
              //         ),
              //         DataColumn(
              //           label: Text('المجموع '),
              //         ),
              //       ],
              //       rows:
              //       tableItem.listOfColumns // Loops through dataColumnText, each iteration assigning the value to element
              //           .map(
              //         ((element) => DataRow(
              //           cells: <DataCell>[
              //             DataCell(Text(element["المادة"]!)), //Extracting from Map element the value
              //             DataCell(Text(element["الكمية"]!)),
              //             DataCell(Text(element["السعر"]!)),
              //             DataCell(Text(element["المجموع"]!)),
              //
              //           ],
              //         )),
              //       )
              //           .toList(),
              //     ),
              //
              //   ),
              // ),

              FittedBox(
                child: Consumer<TableItemsContent>(
                  builder: (context, tableItem2, _) => DataTable(

                    headingRowColor:
                    MaterialStateColor.resolveWith((states) => Colors.grey.withOpacity(0.5)),
                    dataRowHeight: 70,
                    columns: [
                      DataColumn(
                        label: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('  المادة'),
                        ),
                      ),
                      DataColumn(
                        label: Text('الكمية '),
                      ),
                      DataColumn(
                        label: Text('السعر '),
                      ),
                      DataColumn(
                        label: Text('المجموع '),
                      ),
                    ],
                    rows:
                    getRows(tableItem2.users),
                  ),

                ),
              ),

              const SizedBox(height: 25,),
              Visibility(
                visible: allowEdit?true:false,
                child: Center(
                  child:  GFButton(
                    color: Colors.lightBlueAccent,
                    onPressed: (){

                      openAlert();
                    },
                    text: "Add",
                    icon: const Icon(Icons.add,color: Colors.white,size: 18,),
                    shape: GFButtonShape.pills,
                  ),
                ),
              ),
              // Center(
              //   child: IconButton(
              //     onPressed:(){
              //       setState(() {
              //         openAlert();
              //         // Provider.of<TableItem>(context,listen: false).addItem({"المادة": "ي", "الكمية": "4", "السعر": "15","المجموع":"500"});
              //        // listOfColumns.add({"Name": "hhhhhhh", "Number": "1", "State": "Yes"});
              //
              //         print(listOfColumns);
              //       });
              //     } ,
              //     icon: Icon(Icons.add),
              //   ),
              // ),
        //       DataTable(
        //   columns: [
        //     DataColumn(label: Text('Patch')),
        //     DataColumn(label: Text('Version')),
        //     DataColumn(label: Text('Ready')),
        //   ],
        //   rows:
        //   listOfColumns // Loops through dataColumnText, each iteration assigning the value to element
        //       .map(
        //     ((element) => DataRow(
        //       cells: <DataCell>[
        //         DataCell(Text(element["Name"]!)), //Extracting from Map element the value
        //         DataCell(Text(element["Number"]!)),
        //         DataCell(Text(element["State"]!)),
        //       ],
        //     )),
        //   )
        //       .toList(),
        // ),
              const Divider(
                height: 2,
                color: Colors.black,
                thickness: 2,
              ),
              const SizedBox(height: 15,),

              Visibility(
                visible: allowEdit?false:true,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                        color: Colors.black.withOpacity(0.6),
                            height: 35,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text("المجموع الكلي",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                            ),
                      )),
                      SizedBox(width: 10,),
                      Expanded(
                          flex:2,
                          child:

                          Container(

                            color: Colors.black.withOpacity(0.6),
                            height: 35,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
                                child:
                                Text("$total2",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                              ),
                            ),
                          ),
                      ),

                      // Expanded(
                      //    flex:2,
                      //     child:
                      //
                      //     Consumer<TableItem2>(
                      //
                      //       builder: (context, tableItem2, _) => Container(
                      //
                      //         color: Colors.black.withOpacity(0.6),
                      //         height: 35,
                      //         child: Padding(
                      //           padding: const EdgeInsets.all(5.0),
                      //           child: Padding(
                      //             padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      //             child:
                      //             Text("${tableItem2.getToTallPrice()}",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                      //           ),
                      //         ),
                      //       ),
                      //
                      //     )
                      //
                      //
                      //
                      //
                      // ),


                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5),
                child: Row(
                  children: [
                    const Text(
                      "الخصم  "+' :                ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                    const SizedBox(width: 2,),
                    Container(
                      height: allowEdit?50:35,
                      width: allowEdit?60:35,
                      padding: const EdgeInsets.all(3.0),
                      child: Center(
                        child:
                        TextFormField(
                          style: const TextStyle(color: Colors.red ,fontSize: 20), //<-- SEE HERE
                          keyboardType:TextInputType.number ,
                          decoration:allowEdit? const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.5, color: Colors.grey), //<-- SEE HERE
                            ),
                            focusedBorder:OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.5, color: Colors.grey), //<-- SEE HERE
                            ),

                          ):
                         const InputDecoration(
                         // labelText: 'Enter Name',
                          border: InputBorder.none,
                           focusedBorder: InputBorder.none,
                         ),

                          controller:productDiscountController ,
                          cursorWidth: 1.5,
                          cursorColor: Colors.grey,
                          autofocus: false,
                          readOnly: allowEdit?false:true,
                          onSaved: (String? newVal){
                          //  _productData['الكمية']=newVal!;
                          //  productQuantityController.text=newVal!;
                            print(productDiscountController.text);
                          },
                          validator: (String? value){
                            if(value!.isEmpty )
                            {
                              return 'قم بإدخال الخصم';
                            }
                            else
                            {
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                    const Text(
                      " % ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15,),

              Visibility(
                visible: allowEdit?true:false,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        child: MaterialButton(
                          onPressed: (){
                            Provider.of<TableItemsContent>(context, listen: false).users.isEmpty?
                            showToast('Error , No Any Product Added',
                              backgroundColor: Colors.red.withOpacity(0.8),
                              textStyle: const TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w600),
                              context: context,
                              animation: StyledToastAnimation.scale,
                              reverseAnimation: StyledToastAnimation.fade,
                              position: StyledToastPosition.right,
                              animDuration: const Duration(seconds: 1),
                              duration: const Duration(seconds: 3),
                              curve: Curves.elasticOut,
                              reverseCurve: Curves.linear,
                            )
                                :productDiscountController.text.isEmpty?
                            showToast('Error , No Discount Product Added',
                              backgroundColor: Colors.red.withOpacity(0.8),
                              textStyle: const TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w600),
                              context: context,
                              animation: StyledToastAnimation.scale,
                              reverseAnimation: StyledToastAnimation.fade,
                              position: StyledToastPosition.right,
                              animDuration: const Duration(seconds: 1),
                              duration: const Duration(seconds: 3),
                              curve: Curves.elasticOut,
                              reverseCurve: Curves.linear,
                            )

                                :
                            PanaraConfirmDialog.show(
                              context,
                              title: "انتبه !!",
                              message: "عند تأكيد الفاتورة لن تتمكن من اجراء اي تعديل اضافي ",
                              confirmButtonText: "تأكيد",
                              textColor: Colors.black,

                              cancelButtonText: "الغاء",
                              onTapCancel: () {
                                Navigator.pop(context);
                              },
                              onTapConfirm: () {

                                // to calculate Total Product Price
                                for(int x=0;x< Provider.of<TableItemsContent>(context, listen: false).users.length;x++)
                                  {
                                    total2+= Provider.of<TableItemsContent>(context, listen: false).users[x].totalPrice;
                                  }
                                print("total price without discount = $total2");

                                setState(() {
                                  allowEdit=false;
                                });
                                Navigator.pop(context);
                              },
                              panaraDialogType: PanaraDialogType.normal,
                              barrierDismissible: false, // optional parameter (default is true)
                            );





                            // for(int i=0;i<Provider.of<TableItem2>(context,listen: false).users.length;i++)
                            // {
                            //   total2+=Provider.of<TableItem2>(context,listen: false).users[i].totalPrice;
                            //   print(Provider.of<TableItem2>(context,listen: false).users[i].orderName);
                            //   print(Provider.of<TableItem2>(context,listen: false).users[i].orderQuantity);
                            //   print(Provider.of<TableItem2>(context,listen: false).users[i].orderPrice);
                            //   print(Provider.of<TableItem2>(context,listen: false).users[i].totalPrice);
                            //   print("-------total2  : $total2--------");
                            //
                            //   print("---------------");
                            // }
                            //
                            // setState(() {
                            //   showTotal=!showTotal;
                            // });

                            //  print(users[0].orderName);
                            // print(users[0].orderQuantity);
                            // print(users[0].orderPrice);

                            // print("CANCEL");
                            // setState(() {
                            //   productNameController.text='';
                            //   productQuantityController.text='';
                            // });



                            //  Navigator.pop(context);
                          },
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          child: const Text(
                            "تأكيد",
                            style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Visibility(
                visible: allowEdit?false:true,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        child: MaterialButton(
                          onPressed: ()async{

                            final invoice2 = Invoice(
                                header:Header(
                                  clientName:widget.customerName ?? "",
                                  date:currentDate,
                                  orderNum:"123445",
                                  sellerName: "حسني ابو تمام ",
                                ) ,
                                footer: Footer(
                                  discount:"  %  ${productDiscountController.text}",  //"50 %",
                                  netCost:"$total2"  //"1000",
                                ),
                                items: [
                                  TableItemData(
                                    productName:"عصير " ,
                                    productPrice: 0.5,
                                    productQuantity: 2,
                                    //  Total:1 ,
                                  ),
                                  TableItemData(
                                    productName:"دخان " ,
                                    productPrice: 2.5,
                                    productQuantity: 3,
                                    //  Total:0 ,
                                  ),
                                  TableItemData(
                                    productName:"شبس " ,
                                    productPrice: 0.5,
                                    productQuantity: 5,
                                    //  Total:0 ,
                                  ),
                                  TableItemData(
                                    productName:"UK" ,
                                    productPrice: 0.5,
                                    productQuantity: 5,
                                    //  Total:0 ,
                                  ),

                                 // Provider.of<TableItemsContent>(context,listen: false).users

                                  for(int x=0;x < Provider.of<TableItemsContent>(context,listen: false).users.length ; x++)
                                    TableItemData(
                                      productName:Provider.of<TableItemsContent>(context,listen: false).users[x].orderName ,
                                      productPrice: Provider.of<TableItemsContent>(context,listen: false).users[x].orderPrice,
                                      productQuantity: Provider.of<TableItemsContent>(context,listen: false).users[x].orderQuantity,
                                      //  Total:0 ,
                                    )
                                  // for(int i=0;i<3;i++)TableItemData(
                                  //   productName:"${i}" ,
                                  //   productPrice: 0.5,
                                  //   productQuantity: 5,
                                  //   //  Total:0 ,
                                  // ),

                                ]


                            );

                            final pdfFile2 = await PdfInvoiceApi.generate(invoice2);
                            PdfApi.openFile(pdfFile2);



                          },
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          child: const Text(
                            "طباعة ",
                            style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5),
              //   child: Row(
              //     children: [
              //       Text(
              //         "صافي التكلفة "+' :       ',
              //         style: TextStyle(
              //             color: Colors.black,
              //             fontSize: 15,
              //             fontWeight: FontWeight.w600
              //         ),
              //       ),
              //       SizedBox(width: 2,),
              //       Container(
              //         height: 50,
              //         width: 90,
              //         padding: EdgeInsets.all(3.0),
              //         child: TextField(
              //           //  autofocus:addName? true:false,
              //           //  readOnly: addName? false:true,
              //           decoration: InputDecoration(
              //             enabledBorder: OutlineInputBorder(
              //               borderSide: BorderSide(
              //                   width: 1.5, color: Colors.grey), //<-- SEE HERE
              //             ),
              //             focusedBorder:OutlineInputBorder(
              //               borderSide: BorderSide(
              //                   width: 1.5, color: Colors.grey), //<-- SEE HERE
              //             ),
              //           ),
              //
              //      //     controller:productQuantityController ,
              //
              //           onSubmitted: (String? newval){
              //         //    productQuantityController.text=newval!;
              //          //   print(productQuantityController.text);
              //
              //
              //             setState(() {
              //               total=double.parse(productQuantityController.text)*price;
              //
              //             });
              //             print(total);
              //           },
              //           onChanged: (String? newval){
              //             productQuantityController.text=newval!;
              //             print(productQuantityController.text);
              //
              //
              //             setState(() {
              //               total=double.parse(productQuantityController.text)*price;
              //             });
              //             print(total);
              //           },
              //           // onSubmitted: (String newWord){
              //           //   print("all");
              //           //   print("$newWord");
              //           //
              //           // },
              //         ),
              //       ),
              //       // Spacer(),
              //       // ElevatedButton(onPressed: (){
              //       //   setState(() {
              //       //    // addName=!addName;
              //       //   });
              //       //  // print(addName);
              //       // }, child: Text("Add"))
              //
              //       // RichText(
              //       //     text: TextSpan(
              //       //         text: "اسم العميل"+' : ',
              //       //         style: TextStyle(
              //       //             color: Colors.black,
              //       //             fontSize: 15,
              //       //             fontWeight: FontWeight.w600
              //       //         ),
              //       //         children: <TextSpan>[
              //       //           TextSpan(
              //       //             text: "",
              //       //             style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
              //       //           )
              //       //         ]
              //       //     )
              //       //
              //       // ),
              //
              //     ],
              //   ),
              // ),


              // Row(
              //   children: [
              //     Expanded(
              //       child: Padding(
              //         padding: EdgeInsets.only(left: 12, right: 6),
              //         child: MaterialButton(
              //           onPressed: (){
              //
              //             for(int i=0;i<Provider.of<TableItem2>(context,listen: false).users.length;i++)
              //               {
              //                 print(Provider.of<TableItem2>(context,listen: false).users[i].orderName);
              //                 print(Provider.of<TableItem2>(context,listen: false).users[i].orderQuantity);
              //                 print(Provider.of<TableItem2>(context,listen: false).users[i].orderPrice);
              //                 print(Provider.of<TableItem2>(context,listen: false).users[i].totalPrice);
              //
              //                 print("---------------");
              //               }
              //
              //
              //             //  print(users[0].orderName);
              //            // print(users[0].orderQuantity);
              //            // print(users[0].orderPrice);
              //
              //             // print("CANCEL");
              //             // setState(() {
              //             //   productNameController.text='';
              //             //   productQuantityController.text='';
              //             // });
              //
              //
              //
              //           //  Navigator.pop(context);
              //           },
              //           color: Colors.red,
              //           child: Text(
              //             "طباعة",
              //             style: TextStyle(fontSize: 12,color: Colors.white,
              //             ),
              //           ),
              //           shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(4)),
              //         ),
              //       ),
              //     ),
              //     // Expanded(
              //     //   child: Padding(
              //     //     padding: EdgeInsets.only(left: 6, right: 12),
              //     //     child: MaterialButton(
              //     //       onPressed: (){
              //     //         _submit();
              //     //
              //     //         // Provider.of<TableItem>(context,listen: false).addItem({"المادة": productNameController.text, "الكمية": productQuantityController.text, "السعر": productPriceController.text,"المجموع":"$total"});
              //     //         // setState(() {
              //     //         //   productNameController.text='';
              //     //         //   productQuantityController.text='';
              //     //         //   productPriceController.text='';
              //     //         // });
              //     //         // Navigator.pop(context);
              //     //
              //     //       },
              //     //       color: Colors.green,
              //     //       child: Text(
              //     //         "اضافة",
              //     //         style: TextStyle(fontSize: 12, color: Colors.white,
              //     //         ),
              //     //       ),
              //     //       shape: RoundedRectangleBorder(
              //     //           borderRadius: BorderRadius.circular(4)),
              //     //     ),
              //     //   ),
              //     // )
              //   ],
              // ),
              // Row(
              //   children: [
              //     Expanded(
              //       child: Padding(
              //         padding: EdgeInsets.only(left: 12, right: 6),
              //         child: MaterialButton(
              //           onPressed: (){
              //
              //             for(int i=0;i<Provider.of<TableItem2>(context,listen: false).users.length;i++)
              //             {
              //               total2+=Provider.of<TableItem2>(context,listen: false).users[i].totalPrice;
              //               print(Provider.of<TableItem2>(context,listen: false).users[i].orderName);
              //               print(Provider.of<TableItem2>(context,listen: false).users[i].orderQuantity);
              //               print(Provider.of<TableItem2>(context,listen: false).users[i].orderPrice);
              //               print(Provider.of<TableItem2>(context,listen: false).users[i].totalPrice);
              //               print("-------total2  : $total2--------");
              //
              //               print("---------------");
              //             }
              //
              //             setState(() {
              //               showTotal=!showTotal;
              //             });
              //
              //             //  print(users[0].orderName);
              //             // print(users[0].orderQuantity);
              //             // print(users[0].orderPrice);
              //
              //             // print("CANCEL");
              //             // setState(() {
              //             //   productNameController.text='';
              //             //   productQuantityController.text='';
              //             // });
              //
              //
              //
              //             //  Navigator.pop(context);
              //           },
              //           color: Colors.red,
              //           child: Text(
              //             "تأكيد",
              //             style: TextStyle(fontSize: 12,color: Colors.white,
              //             ),
              //           ),
              //           shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(4)),
              //         ),
              //       ),
              //     ),
              //     // Expanded(
              //     //   child: Padding(
              //     //     padding: EdgeInsets.only(left: 6, right: 12),
              //     //     child: MaterialButton(
              //     //       onPressed: (){
              //     //         _submit();
              //     //
              //     //         // Provider.of<TableItem>(context,listen: false).addItem({"المادة": productNameController.text, "الكمية": productQuantityController.text, "السعر": productPriceController.text,"المجموع":"$total"});
              //     //         // setState(() {
              //     //         //   productNameController.text='';
              //     //         //   productQuantityController.text='';
              //     //         //   productPriceController.text='';
              //     //         // });
              //     //         // Navigator.pop(context);
              //     //
              //     //       },
              //     //       color: Colors.green,
              //     //       child: Text(
              //     //         "اضافة",
              //     //         style: TextStyle(fontSize: 12, color: Colors.white,
              //     //         ),
              //     //       ),
              //     //       shape: RoundedRectangleBorder(
              //     //           borderRadius: BorderRadius.circular(4)),
              //     //     ),
              //     //   ),
              //     // )
              //   ],
              // ),


            ],
          ),
        ),
      ),
    );


    //   List<DataColumn> getColumns(List<String> columns) {
//     return columns.map((String column) {
//       final isAge = column == columns[2];
//
//       return DataColumn(
//         label: Text(column),
//         numeric: isAge,
//       );
//     }).toList();
//   }
//
//   List<DataRow> getRows(List<User> users) => users.map((User user) {
//         final cells = [user.firstName, user.lastName, user.age];
//
//         return DataRow(
//           cells: Utils.modelBuilder(cells, (index, cell) {
//             final showEditIcon = index == 0 || index == 1;
//
//             return DataCell(
//               Text('$cell'),
//               showEditIcon: showEditIcon,
//               onTap: () {
//                 switch (index) {
//                   case 0:
//                     editFirstName(user);
//                     break;
//                   case 1:
//                     editLastName(user);
//                     break;
//                 }
//               },
//             );
//           }),
//         );
//       }).toList();
//
//   Future editFirstName(User editUser) async {
//     final firstName = await showTextDialog(
//       context,
//       title: 'Change First Name',
//       value: editUser.firstName,
//     );
//
//     setState(() => users = users.map((user) {
//           final isEditedUser = user == editUser;
//
//           return isEditedUser ? user.copy(firstName: firstName) : user;
//         }).toList());
//   }
//
//   Future editLastName(User editUser) async {
//     final lastName = await showTextDialog(
//       context,
//       title: 'Change Last Name',
//       value: editUser.lastName,
//     );
//
//     setState(() => users = users.map((user) {
//           final isEditedUser = user == editUser;
//
//           return isEditedUser ? user.copy(lastName: lastName) : user;
//         }).toList());
//   }
  }

    List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      final isAge = column == columns[2];

      return DataColumn(
        label: Text(column),
        numeric: isAge,
      );
    }).toList();
  }
  double roundDouble(double value, int places){
    num mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }
  List<DataRow> getRows(List<OrderDetails> users) => users.map((OrderDetails user) {
    final totalOneProduct=user.orderQuantity * user.orderPrice;
    double num2 = roundDouble(totalOneProduct, 2);

   //  final totalOneProduct=double.parse((user.orderQuantity * user.orderPrice).toStringAsFixed(2));


    user.totalPrice=num2;

   // user.totalPrice=totalOneProduct;
    print("total :$total");
    total=totalOneProduct;

    print("total :$total");

        final cells = [user.orderName, user.orderQuantity, user.orderPrice,num2];

        return DataRow(
          cells: Utils.modelBuilder(cells, (index, cell) {
            final showEditIcon;
            if(allowEdit){
              showEditIcon = index == 0 || index == 1 || index == 2;

            }
            else {
              showEditIcon=false;

            }



            return DataCell(
              Text(' $cell  '),
              showEditIcon: showEditIcon,
              onTap: () {
                switch (index) {
                  case 0:
                    editOrderName(user);
                    break;
                  case 1:
                    editOrderQuantity(user);
                    break;

                  case 2:
                    editOrderPrice(user);
                    break;
                }
              },
            );
          }),
        );
      }).toList();

  Future editOrderName(OrderDetails editOrder) async {
    final newOrderName = await showTextDialog(
      context,
      title: 'Change First Name',
      value: editOrder.orderName,
    );

    setState(() => Provider.of<TableItemsContent>(context,listen: false).users = Provider.of<TableItemsContent>(context,listen: false).users.map((user) {
          final isEditedUser = user == editOrder;

          return isEditedUser ? user.copy(orderName: newOrderName) : user;
        }).toList());
  }

  Future editOrderQuantity(OrderDetails editOrder) async {
    final newOrderQuantity = await showIntDialog(
      context,
      title: 'Change Order Quantity',
      value: editOrder.orderQuantity,
    );

    setState(() => Provider.of<TableItemsContent>(context,listen: false).users = Provider.of<TableItemsContent>(context,listen: false).users.map((user) {
          final isEditedUser = user == editOrder;

          return isEditedUser ? user.copy(orderQuantity: newOrderQuantity) : user;
        }).toList());
  }

  Future editOrderPrice(OrderDetails editOrder) async {
    final newPrice = await showDoubleDialog(
      context,
      title: 'Change Order Price',
      value: editOrder.orderPrice,
    );

    setState(() => Provider.of<TableItemsContent>(context,listen: false).users = Provider.of<TableItemsContent>(context,listen: false).users.map((user) {
      final isEditedUser = user == editOrder;

      return isEditedUser ? user.copy(orderPrice: newPrice) : user;
    }).toList());
  }

  void openAlert() {
  var dialog = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      //this right here
      child: Directionality(
        textDirection:ui.TextDirection.rtl,

        child: SizedBox(
          height: MediaQuery.of(context).size.height*0.4,
          width: double.infinity,
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                // Visibility(
                //   visible: customerNamesController.text==''?true:false,
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5),
                //     child: Row(
                //       children: [
                //         Text(
                //           "اسم العميل"+' : ',
                //           style: TextStyle(
                //               color: Colors.black,
                //               fontSize: 15,
                //               fontWeight: FontWeight.w600
                //           ),
                //         ),
                //         SizedBox(width: 2,),
                //         Expanded(
                //           child: Container(
                //             padding: EdgeInsets.all(3.0),
                //             child: SizedBox(
                //               height: 40,
                //               child: TextField(
                //                 controller:customerNamesController ,
                //                 onSubmitted: (String? newval){
                //                   customerNamesController.text=newval!;
                //                   print(customerNamesController.text);
                //                 },
                //
                //                 //  autofocus:addName? true:false,
                //                 //  readOnly: addName? false:true,
                //                 decoration: InputDecoration(
                //                   enabledBorder: OutlineInputBorder(
                //                     borderSide: BorderSide(
                //                         width: 1.5, color: Colors.grey), //<-- SEE HERE
                //                   ),
                //                   focusedBorder:OutlineInputBorder(
                //                     borderSide: BorderSide(
                //                         width: 1.5, color: Colors.grey), //<-- SEE HERE
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ),
                //         // Spacer(),
                //         // ElevatedButton(onPressed: (){
                //         //   setState(() {
                //         //    // addName=!addName;
                //         //   });
                //         //  // print(addName);
                //         // }, child: Text("Add"))
                //
                //         // RichText(
                //         //     text: TextSpan(
                //         //         text: "اسم العميل"+' : ',
                //         //         style: TextStyle(
                //         //             color: Colors.black,
                //         //             fontSize: 15,
                //         //             fontWeight: FontWeight.w600
                //         //         ),
                //         //         children: <TextSpan>[
                //         //           TextSpan(
                //         //             text: "",
                //         //             style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
                //         //           )
                //         //         ]
                //         //     )
                //         //
                //         // ),
                //
                //       ],
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5),
                  child: Row(
                    children: [
                      const Text(
                        "المادة "+' :        ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      const SizedBox(width: 2,),
                      Expanded(
                        child: SizedBox(
                            height: 50,
                            // padding: EdgeInsets.all(3.0),
                            child: InputDecorator(
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 4),
                                  border: OutlineInputBorder(gapPadding: 1),
                                  focusedBorder: InputBorder.none, //Add this Removing the Underline/Border only when Focused
                                  hintText: "Search..",
                                  filled: false
                              ),
                              child: Autocomplete(
                                optionsBuilder: (TextEditingValue textEditingValue) {
                                  if (textEditingValue.text == '') {
                                    return const Iterable<String>.empty();
                                  }else{
                                    List<String> matches = <String>[];
                                    matches.addAll(suggestons);
                                    matches.retainWhere((s){
                                      return s.toLowerCase().contains(textEditingValue.text.toLowerCase());
                                    });
                                    return matches;
                                  }
                                },
                                onSelected: (String selection) {
                                  // controller:customerNamesController ,
                                  // onSubmitted: (String? newval){
                                  productNameController.text=selection;
                                  print(productNameController.text);
                                  //  },
                                  print(' -------- You just selected $selection');
                                },
                              ),
                            )
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5),
                  child: Row(
                    children: [
                      const Text(
                        "الكمية "+' :       ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      const SizedBox(width: 2,),
                      Container(
                        height: 50,
                        width: 90,
                        padding: const EdgeInsets.all(3.0),
                        child: TextFormField(
                          keyboardType:TextInputType.phone ,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.5, color: Colors.grey), //<-- SEE HERE
                            ),
                            focusedBorder:OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.5, color: Colors.grey), //<-- SEE HERE
                            ),
                          ),
                          controller:productQuantityController ,
                          cursorWidth: 1.5,
                          cursorColor: Colors.grey,
                          autofocus: false,
                          onSaved: (String? newVal){
                            _productData['الكمية']=newVal!;
                            productQuantityController.text=newVal!;
                            print(productQuantityController.text);
                          },
                          validator: (String? value){
                            if(value!.isEmpty )
                            {
                              return 'قم بإدخال الكمية';
                            }
                            else
                            {
                              return null;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5),
                  child: Row(
                    children: [
                      const Text(
                        "السعر "+' :       ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      const SizedBox(width: 2,),
                      Container(
                        height: 50,
                        width: 90,
                        padding: const EdgeInsets.all(3.0),
                        child: TextFormField(
                          keyboardType:TextInputType.phone ,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.5, color: Colors.grey), //<-- SEE HERE
                            ),
                            focusedBorder:OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.5, color: Colors.grey), //<-- SEE HERE
                            ),
                          ),
                          controller:productPriceController ,
                          cursorWidth: 1.5,
                          cursorColor: Colors.grey,
                          autofocus: false,
                          onSaved: (String? newVal){
                            _productData['السعر']=newVal!;
                            productPriceController.text=newVal!;
                            print(productPriceController.text);
                          },
                          validator: (String? value){
                            if(value!.isEmpty )
                            {
                              return 'قم بإدخال السعر';
                            }
                            else
                            {
                              return null;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(
                    height: 2,
                    color: Colors.black,
                    thickness: 2,
                  ),
                ),

                // ClipRRect(
                //   child: Image.asset(
                //     "assets/images/water1.jpg",
                //     width: double.infinity,
                //     height: 180,
                //     fit: BoxFit.cover,
                //   ),
                //   borderRadius: BorderRadius.only(
                //       topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                // ),
                // Container(
                //   margin: EdgeInsets.only(top: 16),
                //  // decoration: boxDecorationStylealert,
                //   width: 200,
                //   padding: EdgeInsets.symmetric(horizontal: 8),
                //   height: 50,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       GestureDetector(
                //           onTap: () {
                //           //  showToastMessage("-");
                //           },
                //           child:Image.asset("assets/images/subtraction.png",width: 30,height: 30,)),
                //       Text(
                //         "1",
                //         style: TextStyle(
                //             fontSize: 26,
                //             fontWeight: FontWeight.bold,
                //           color: Colors.blue,
                //         ),
                //       ),
                //       GestureDetector(
                //           onTap: () {
                //            // showToastMessage("+");
                //           },
                //           child:Image.asset("assets/images/add.png",width: 30,height: 30,)),
                //     ],
                //   ),
                // ),
                // Expanded(child: Container()),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12, right: 6),
                        child: MaterialButton(
                          onPressed: (){
                          //  print("CANCEL");
                            setState(() {
                              productNameController.text='';
                              productQuantityController.text='';
                              productPriceController.text='';
                            });
                            Navigator.pop(context);
                          },
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          child: const Text(
                            "الغاء",
                            style: TextStyle(fontSize: 15, color: Colors.white,fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 6, right: 12),
                        child: MaterialButton(
                          onPressed: (){
                            _submit2();
                          },
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          child: const Text(
                            "اضافة",
                            style: TextStyle(fontSize: 15, color: Colors.white,fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
    showDialog(
        barrierDismissible: false,

        context: context, builder: (BuildContext context) => dialog);
  }

  // void _submit() {
  //
  //   if(!_formKey.currentState!.validate())
  //   {
  //     print(" Not validate Form");
  //     return ;
  //   }
  //   else if(productNameController.text==''){
  //     print("Error , No Name Product Available");
  //
  //   }
  //   {
  //     FocusScope.of(context).unfocus();
  //     _formKey.currentState!.save();
  //     print("------");
  //     print(_productData['الكمية']);
  //     print(productQuantityController.text);
  //     print('--------------------------------');
  //     double totalSalary=double.parse(productQuantityController.text) * double.parse(productPriceController.text);
  //
  //     Provider.of<TableItem>(context, listen: false).addItem({
  //       "المادة": productNameController.text,
  //       "الكمية": productQuantityController.text,
  //       "السعر": productPriceController.text,
  //       "المجموع": "$totalSalary"
  //     });
  //     setState(() {
  //       productNameController.text = '';
  //       productQuantityController.text = '';
  //       productPriceController.text = '';
  //     });
  //     Navigator.pop(context);
  //   }
  // }

  void _submit2() {

    if(!_formKey.currentState!.validate())
    {
      print(" Not validate Form");
      return ;
    }
    else if(productNameController.text==''){
      showToast('Error , No Name Product Available',
        backgroundColor: Colors.red.withOpacity(0.8),
        textStyle: const TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w600),
        context: context,
        animation: StyledToastAnimation.scale,
        reverseAnimation: StyledToastAnimation.fade,
        position: StyledToastPosition.right,
        animDuration: const Duration(seconds: 1),
        duration: const Duration(seconds: 3),
        curve: Curves.elasticOut,
        reverseCurve: Curves.linear,
      );
     // print("Error , No Name Product Available");

    }
   else {
      FocusScope.of(context).unfocus();
      _formKey.currentState!.save();
      print("------");
      print(_productData['الكمية']);
      print(productQuantityController.text);
      print('--------------------------------');
      double totalSalary=double.parse(productQuantityController.text) * double.parse(productPriceController.text);

      Provider.of<TableItemsContent>(context, listen: false).addItem(
          OrderDetails(
              orderName:productNameController.text ,
              orderQuantity:int.parse(productQuantityController.text) ,
              orderPrice: double.parse(productPriceController.text),
              totalPrice: roundDouble(
                  int.parse(productQuantityController.text)
                      *
                      double.parse(productPriceController.text), 3)


        )
      );
    //  print("total : $total");
      setState(() {
      //  total+=int.parse(productQuantityController.text)*double.parse(productPriceController.text);
        productNameController.text = '';
        productQuantityController.text = '';
        productPriceController.text = '';
       // total+=
      });
    //  print("total : $total");

      Navigator.pop(context);
    }
  }

// Future getTimes() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   final url = Uri.http(URL, "api/hours-range");
  //   try {
  //     final response = await http.post(
  //       url,
  //       body: {
  //         "lang": preferences.getString("lang"),
  //         "date": Provider.of<TimeAndDateAndAdressModel>(context, listen: false)
  //             .date
  //       },
  //     ).timeout(Duration(seconds: 10),
  //         onTimeout: () => throw 'no internet please connect to internet');
  //     final responseData = json.decode(response.body);
  //     if (response.statusCode == 200) {
  //       if (responseData["key"] == "success") {
  //         timesModel = TimesModel.fromJson(responseData);
  //       } else {
  //         Fluttertoast.showToast(msg: responseData["msg"]);
  //       }
  //     }
  //   } catch (e, t) {
  //     print("error $e" + " ==>> track $t");
  //   }
  // }

}
// class ProductItem with ChangeNotifier {
//   String date;
//   String time;
//
//   set Date(String value) {
//     date = value;
//     time = "";
//     notifyListeners();
//   }
//
//   set Time(String value) {
//     time = value;
//   }
// }
class TableItem with ChangeNotifier {
  final List<Map<String, String>> listOfColumns = [
   // {"المادة": "A", "الكمية": "1", "السعر": "12","المجموع":"200"},
   // {"المادة": "B", "الكمية": "2", "السعر": "13","المجموع":"300"},
   // {"المادة": "C", "الكمية": "3", "السعر": "14","المجموع":"400"},
  ];

  addItem(Map<String,String> map){

    listOfColumns.add(map);
    notifyListeners();

  }

  // set Date(String value) {
  //   date = value;
  //   time = "";
  //   notifyListeners();
  // }
  //
  // set Time(String value) {
  //   time = value;
  // }
}

class TableItemsContent with ChangeNotifier {
  List<OrderDetails> users=[];
  double total=0.0;
  // final List<Map<String, String>> listOfColumns = [
  //   // {"المادة": "A", "الكمية": "1", "السعر": "12","المجموع":"200"},
  //   // {"المادة": "B", "الكمية": "2", "السعر": "13","المجموع":"300"},
  //   // {"المادة": "C", "الكمية": "3", "السعر": "14","المجموع":"400"},
  // ];

  addItem(OrderDetails newOrder){

    users.add(newOrder);
    notifyListeners();

  }
  // getToTallPrice(){
  //   print(" getToTallPrice : $total");
  //   print("user length : ${users.length}");
  //   for(int i=0;i<users.length;i++)
  //   {
  //    // total2+=Provider.of<TableItem2>(context,listen: false).users[i].totalPrice;
  //     total+=users[i].totalPrice;
  //
  //
  //   }
  //   print(" getToTallPrice : $total");
  //
  //   return total;
  //  // notifyListeners();
  //
  //
  //
  //
  // }

// set Date(String value) {
//   date = value;
//   time = "";
//   notifyListeners();
// }
//
// set Time(String value) {
//   time = value;
// }
}

class OrderDetails {
  final String orderName;
  final int orderQuantity;
  final double orderPrice;
  double totalPrice;



  OrderDetails({
    required this.orderName,
    required this.orderQuantity,
    required this.orderPrice,
    required this.totalPrice
  });

  OrderDetails copy({
    String? orderName,
    int? orderQuantity,
    double? orderPrice,
  }) =>
      OrderDetails(
        orderName: orderName ?? this.orderName,
        orderQuantity: orderQuantity ?? this.orderQuantity,
        orderPrice: orderPrice ?? this.orderPrice,
        totalPrice: totalPrice,

       // age: age ?? this.age,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderDetails &&
          runtimeType == other.runtimeType &&
          orderName == other.orderName &&
          orderQuantity == other.orderQuantity &&
          orderPrice == other.orderPrice;

  @override
  int get hashCode => orderName.hashCode ^ orderQuantity.hashCode ^ orderPrice.hashCode;
}