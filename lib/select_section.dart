
import 'package:fawaterkom/show_fatwora.dart';
import 'package:flutter/material.dart';

import 'enter_product.dart';
class SelectSection extends StatelessWidget {
   SelectSection({Key? key}) : super(key: key);
  final TextEditingController _textFieldController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: ListView(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.2,),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width*0.6,
              height: 50,
              child: ElevatedButton(
                child: FittedBox(child: const Text("اضافة فاتورة ",style: TextStyle(fontSize: 20),)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  elevation: 0,
                ),
                onPressed: () {

                _showTextInputDialog(context);
                if(_textFieldController.text=='')
                  {
                    print('No Name Enter');
                  }
                else
                  {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>   ShowFawater  (customerName: _textFieldController.text.toString(),)));

                  }
                //  Navigator.push(context, MaterialPageRoute(builder: (context)=>  const ShowFawater  ()));

                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>  const EnterProduct  ()));

                  print("اضافة فاتورة ");
                },
              ),
            ),
          ),
          SizedBox(height: 10,),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width*0.6,
              height: 50,
              child: ElevatedButton(
                child: FittedBox(child: const Text("عرض الفواتير ",style: TextStyle(fontSize: 20),)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                  elevation: 0,
                ),
                onPressed: () {
                 //  Navigator.push(context, MaterialPageRoute(builder: (context)=>  const ShowFawater  ()));

                  print("عرض الفواتير ");
                },
              ),
            ),
          ),
          SizedBox(height: 10,),

          Center(
            child: Container(
              width: MediaQuery.of(context).size.width*0.6,
              height: 50,
              child: ElevatedButton(
                child: FittedBox(child: const Text(" تسجيل الخروج ",style: TextStyle(fontSize: 20),)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  elevation: 0,
                ),
                onPressed: () {
                  print("تسجيل الخروج  ");
                },
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
              content: TextField(
                controller: _textFieldController,
                decoration: const InputDecoration(hintText: ""),
              ),
              actions: <Widget>[
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
                      print('No Name Enter');
                    }
                    else
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>   ShowFawater  (customerName: _textFieldController.text.toString(),)));

                    }
                  }

                  //Navigator.pop(context, _textFieldController.text),
                ),
              ],
            ),
          );
        });
  }
}
