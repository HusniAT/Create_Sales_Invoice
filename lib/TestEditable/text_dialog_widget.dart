import 'package:flutter/material.dart';

Future<T?> showTextDialog<T>(
  BuildContext context, {
  required String title,
  required String value,
}) =>
    showDialog<T>(
      context: context,
      builder: (context) => TextDialogWidget(
        title: title,
        value: value,
      ),
    );

Future<T?> showIntDialog<T>(
    BuildContext context, {
      required String title,
      required int value,
    }) =>
    showDialog<T>(
      context: context,
      builder: (context) => IntDialogWidget(
        title: title,
        value: value,
      ),
    );

Future<T?> showDoubleDialog<T>(
    BuildContext context, {
      required String title,
      required double value,
    }) =>
    showDialog<T>(
      context: context,
      builder: (context) => DoubleDialogWidget(
        title: title,
        value: value,
      ),
    );

class TextDialogWidget extends StatefulWidget {
  final String title;
  final String value;

  const TextDialogWidget({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  _TextDialogWidgetState createState() => _TextDialogWidgetState();
}

class _TextDialogWidgetState extends State<TextDialogWidget> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(text: widget.value);
  }
  final TextEditingController productNameController=TextEditingController();

  List<String> suggestons = ["USA", "UK", "Uganda", "Uruguay", "United Arab Emirates"];

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: Text(widget.title),
        content:
        SizedBox(
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

    // TextField(
        //   controller: controller,
        //   decoration: InputDecoration(
        //     border: OutlineInputBorder(),
        //   ),
        // ),
        actions: [
          ElevatedButton(
            child: Text('Done'),
            onPressed: () => Navigator.of(context).pop(productNameController.text),
          )
        ],
      );
}


class IntDialogWidget extends StatefulWidget {
  final String title;
  final int value;

  const IntDialogWidget({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  _IntDialogWidgetState createState() => _IntDialogWidgetState();
}

class _IntDialogWidgetState extends State<IntDialogWidget> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(text: widget.value.toString());
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text(widget.title),
    content: TextField(
      keyboardType: TextInputType.phone,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
      ),
    ),
    actions: [
      ElevatedButton(
        child: Text('Done'),
        onPressed: () => Navigator.of(context).pop(int.parse(controller.text)),
      )
    ],
  );
}

class DoubleDialogWidget extends StatefulWidget {
  final String title;
  final double value;

  const DoubleDialogWidget({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  _DoubleDialogWidgetState createState() => _DoubleDialogWidgetState();
}

class _DoubleDialogWidgetState extends State<DoubleDialogWidget> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(text: widget.value.toString());
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text(widget.title),
    content: TextField(
      keyboardType: TextInputType.phone,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
      ),
    ),
    actions: [
      ElevatedButton(
        child: Text('Done'),
        onPressed: () => Navigator.of(context).pop(double.parse(controller.text)),
      )
    ],
  );
}