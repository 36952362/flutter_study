import 'package:flutter/material.dart';


class GestureSampleRoute extends StatelessWidget{
  static final String gestureSampleRoute = '处理手势';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(gestureSampleRoute),
      ),
      body: SmoothClose(),
//      body: Column(
//        children: <Widget>[
//          GestureListen(),
//          InkWellListen(),
//          Text('滑动关闭'),
//          SmoothClose(),
        //],
      );
  }

}

class GestureListen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () =>_onTap(context),
      child: Container(
        padding: EdgeInsets.all(12.0),
        child: Text(GestureSampleRoute.gestureSampleRoute),
      ),
    );
  }


  void _onTap(BuildContext context) {
    final snackBar = SnackBar(content: Text('检测到点击事件'));
    Scaffold.of(context).showSnackBar(snackBar);
  }
}

class InkWellListen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onTap(context),
      child: Container(
        padding: EdgeInsets.all(12.0),
        child: Text('触摸水波效果'),
      ),
    );
  }

  _onTap(BuildContext context) {
    final snackBar = SnackBar(content: Text('检测到点击事件'));
    Scaffold.of(context).showSnackBar(snackBar);

  }
}

class SmoothClose extends StatefulWidget{

  final items = List<String>.generate(20, (i) => "Item ${i+1}");

  @override
  State<StatefulWidget> createState() => SmoothCloseState();

}

class SmoothCloseState extends State<SmoothClose>{

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: _buildRow);
  }

  Widget _buildRow(BuildContext context, int index){
    final item = widget.items[index];
    return Dismissible(
      key: Key(item),
      child: ListTile(title: Text('$item')),
      background: Container(color: Colors.red),
      onDismissed: (direction) => _onDismiss(context, direction, index),
    );

  }

  void _onDismiss(BuildContext context, DismissDirection direction, int index){
    setState(() {
      String item = widget.items.removeAt(index);
      final snackBar = SnackBar(content: Text('$item dismissed'));
      Scaffold.of(context).showSnackBar(snackBar);
    });
  }

}