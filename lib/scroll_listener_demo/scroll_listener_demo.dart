import 'package:flutter/material.dart';

class ScrollListenerDemo extends StatefulWidget {
  static final String scrollListenerDemo = '滑动监听演示';

  @override
  State<StatefulWidget> createState() => _ScrollListenerState();
}

class _ScrollListenerState extends State<ScrollListenerDemo> {
  final ScrollController _scrollController = ScrollController();

  bool isEnd = false;
  String notify = "";
  double offSet = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        offSet = _scrollController.offset;
        isEnd = _scrollController.position.maxScrollExtent == _scrollController.position.pixels;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ScrollListenerDemo.scrollListenerDemo),
      ),
      body: Container(
        child: NotificationListener(
          onNotification: _onNotification,
          child: _buildListView(context),
        ),
      ),
      persistentFooterButtons: _buildPersistentFooterButtons(),
    );
  }

  Widget _buildListView(BuildContext context) {
    return ListView.builder(
        controller: _scrollController,
        itemCount: 20,
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              height: 60,
              alignment: Alignment.centerLeft,
              child: Text("Item $index"),
            ),
          );
        });
  }

  bool _onNotification(ScrollNotification notification) {
    String notify = "";
    if (notification is ScrollEndNotification) {
      notify = "ScrollEnd";
    } else if (notification is ScrollStartNotification) {
      notify = "ScrollStart";
    } else if (notification is UserScrollNotification) {
      notify = "UserScroll";
    } else if (notification is ScrollUpdateNotification) {
      notify = "ScrollUpdate";
    }
    setState(() {
      this.notify = notify;
    });
    return false;
  }

  List<Widget> _buildPersistentFooterButtons() {
    return <Widget>[
      FlatButton(
        onPressed: () {
          _scrollController.animateTo(0, duration: Duration(seconds: 1), curve: Curves.bounceInOut);
        },
        child: Text("Position:${offSet.floor()}"),
      ),
      Container(
        width: 0.3,
        height: 30.0,
      ),
      FlatButton(
        onPressed: () {},
        child: Text(notify),
      ),
      Visibility(
        visible: isEnd,
        child: FlatButton(
          onPressed: () {},
          child: Text("Reach End"),
        ),
      ),
    ];
  }
}
