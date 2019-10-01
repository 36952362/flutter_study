import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class NotificationListenerDemo extends StatefulWidget{
  static final String notificationListenerDemo = "冒泡通知演示";
  @override
  State<StatefulWidget> createState() => _NotificationListenerState();

}

class _NotificationListenerState extends State<NotificationListenerDemo>{

  final int defaultScroller = 300;

  double toolbarOpacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: _stackWidgets(context),
      ),
    );
  }

  List<Widget> _stackWidgets(BuildContext context) {
    return <Widget>[
      _mediaQueryWidget(context),
      _opacityWidget(),
    ].toList();
  }

  Widget _mediaQueryWidget(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: _listBuilderWidget(context),
    );
  }

  Widget _listBuilderWidget(BuildContext context) {
    return NotificationListener(
      onNotification: (notification){
        if(notification is ScrollUpdateNotification && notification.depth == 0){
          double t = notification.metrics.pixels /defaultScroller;
          if(t < 0.0){
            t = 0.0;
          } else if(t > 1.0){
            t = 1.0;
          }
          setState(() {
            toolbarOpacity = t;
          });
        }
        return true;
      },
      child: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          if (0 == index) {
            return Container(
              height: 200,
              child: Swiper(
                itemCount: 3,
                autoplay: true,
                pagination: SwiperPagination(),
                itemBuilder: (context, index) {
                  return Image.asset(
                    index == 0 ? "images/lake.jpg" : "images/mixed-berries.jpg",
                    fit: BoxFit.fill,
                  );
                },
              ),
            );
          }
          return ListTile(
            title: Text("ListTile:$index"),
          );
        },
      ),
    );
  }

  Widget _opacityWidget() {
    return Opacity(
      opacity: toolbarOpacity,
      child: Container(
        height: 98,
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Center(
            child: Text(
              "ScrollerDemo",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

}