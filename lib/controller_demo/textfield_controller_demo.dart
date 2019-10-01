import 'package:flutter/material.dart';

class TextFieldControllerDemo extends StatelessWidget {
  static final String textFieldControllerDemo = '文本编辑框Controller';
  TextEditingController textEditingController = TextEditingController(text: 'init data');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(textFieldControllerDemo),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Center(
          child: TextField(controller: textEditingController),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => textEditingController.text = 'chenged by action button',
        child: Text('c'),
      ),
    );
  }
}
