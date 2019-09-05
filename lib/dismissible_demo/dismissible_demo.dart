import 'package:flutter/material.dart';

class DismissibleDemo extends StatelessWidget {
  static final String dismissibleDemo = '滑动删除演示';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dismissibleDemo),
      ),
      body: DismissItem(),
    );
  }
}

class DismissItem extends StatefulWidget {
  ///产生20个列表项
  final items = List<String>.generate(20, (i) => "Item ${i + 1}");

  @override
  State<StatefulWidget> createState() => DismissItemState();
}

class DismissItemState extends State<DismissItem> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.items.length,
      itemBuilder: _buildRow,
    );
  }

  Widget _buildRow(BuildContext context, int index) {
    final item = widget.items[index];
    return Dismissible(
      key: Key(item),
      child: ListTile(title: Text('$item')),
      background: Container(color: Colors.red),
      secondaryBackground: Container(color: Colors.lightBlue,),
      onDismissed: (direction) => _onDismiss(context, direction, index),
    );
  }

  void _onDismiss(BuildContext context, DismissDirection direction, int index) {
    setState(() {
      widget.items.removeAt(index);
    });
  }
}
