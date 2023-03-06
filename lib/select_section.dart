import 'package:fawaterkom/add_fatwora.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'main.dart';


class SelectSection extends StatelessWidget {
   SelectSection({Key? key}) : super(key: key);
  final TextEditingController _textFieldController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // title: Text(""),
        centerTitle: true,
        backgroundColor:Colors.red.shade300, //Colors.blue[900],
      ),
      body: ListView(
        children: [


          SizedBox(height: MediaQuery.of(context).size.height*0.2,),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width*0.6,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  elevation: 0,
                ),
                onPressed: () {
                _showTextInputDialog(context);
                },
                child: const FittedBox(child: Text("اضافة فاتورة ",style: TextStyle(fontSize: 20),)),
              ),
            ),
          ),


          const SizedBox(height: 10,),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width*0.6,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                  elevation: 0,
                ),
                onPressed: () {
                  },
                child: const FittedBox(child: Text("عرض الفواتير ",style: TextStyle(fontSize: 20),)),
              ),
            ),
          ),


          const SizedBox(height: 10,),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width*0.6,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  elevation: 0,
                ),
                onPressed: () async{
                  PanaraConfirmDialog.show(
                    context,
                    title: "انتبه !!",
                    message: "هل تريد تسجيل الخروج من الحساب  ؟ ",
                    confirmButtonText: "تأكيد",
                    textColor: Colors.black,
                    cancelButtonText: "الغاء",
                    onTapCancel: () {
                      Navigator.pop(context);
                    },
                    onTapConfirm: () {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>  const LoginPage  ()), (route) => false) ;


                    },
                    panaraDialogType: PanaraDialogType.warning,
                    barrierDismissible: false, // optional parameter (default is true)
                  );
                },
                child: const FittedBox(child: Text(" تسجيل الخروج ",style: TextStyle(fontSize: 20),)),
              ),
            ),
          ),

        ],
      ),
    );  }
  Future<String?> _showTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return Directionality(
            textDirection: TextDirection.rtl,

            child: AlertDialog(
              title: const Text('ادخل اسم العميل :',style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold,color: Colors.grey),),
              content:
              TextField(
                controller: _textFieldController,
                onChanged: (value) {
                 // setState(() {});
                },
                decoration: InputDecoration(
                  // icon: Icon(Icons.mail),
                    prefixIcon: const Icon(Icons.person),
                    // suffixIcon: _textFieldController.text.isEmpty
                    //     ? const Text('')
                    //     : GestureDetector(
                    //     onTap: () {
                    //       _textFieldController.clear();
                    //     },
                    //     child: const Icon(Icons.close)),
                    hintText: 'محمد علي حتاملة',
                    labelText: 'الاسم',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                        const BorderSide(color: Colors.red, width: 1))),
              ),

              // TextField(
              //   controller: _textFieldController,
              //   decoration: const InputDecoration(hintText: ""),
              // ),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        elevation: 0,
                      ),

                      child: const Text("الغاء"),
                      onPressed: () => Navigator.pop(context),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          elevation: 0,
                        ),

                        child: const Text('حفظ'),
                        onPressed: () {
                          if(_textFieldController.text=='')
                          {
                            showToast('Error ,No Name Enter',
                              backgroundColor: Colors.red.withOpacity(0.8),
                              textStyle: const TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w600),
                              context: context,
                              animation: StyledToastAnimation.scale,
                              reverseAnimation: StyledToastAnimation.fade,
                              position: StyledToastPosition.top,
                              animDuration: const Duration(seconds: 1),
                              duration: const Duration(seconds: 3),
                              curve: Curves.elasticOut,
                              reverseCurve: Curves.linear,
                            );
                            //  print('No Name Enter');
                          }
                          else
                          {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>   AddFawater  (customerName: _textFieldController.text.toString(),)));
                          }
                        }

                      //Navigator.pop(context, _textFieldController.text),
                    ),
                  ],
                )

              ],
            ),
          );
        });
  }
   Future<bool?>  logOut(BuildContext context)async {
     return showDialog<bool>(
       context: context,
       builder:(context)=> AlertDialog(
         title:  const Center(child: Text('هل تريد تسجيل الخروج من الحساب  ؟',textAlign: TextAlign.center,)),
         actions: [
           TextButton(
               onPressed:()=>Navigator.pop(context,false),
               child:  const Text('لا')
           ),
           TextButton(
               onPressed:()async{
                 Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>  const LoginPage  ()), (route) => false) ;
               },
               child:  const Text('نعم')
           ),
         ],
       ),
     );
   }

}

