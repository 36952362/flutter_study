import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LayoutSample2Route extends StatelessWidget {
  static final String layoutDemoRoute = '构建布局2';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);

    return Scaffold(
      appBar: AppBar(
        title: Text(layoutDemoRoute),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return _buildContent(context);
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 30.0),
      height: 400.0,
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 400.0,
              child: _introducing(context),
            ),
            _mainImage(context),
          ],
        ),
      ),
    );
  }



  Widget _mainImage(BuildContext context) {
    return Image.asset("images/mixed-berries.jpg");
  }

  Widget _introducing(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
      child: Column(
        children: <Widget>[
          _buildRating(context),
          _iconList(context),
        ],
      ),
    );
  }

  Widget _buildRating(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.star, color: Colors.black),
              Icon(Icons.star, color: Colors.black),
              Icon(Icons.star, color: Colors.black),
              Icon(Icons.star, color: Colors.black),
              Icon(Icons.star, color: Colors.black),
            ],
          ),
          Text(
            '170 Reviews',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
  }


  Widget _iconList(BuildContext context) {
    var descTextStype = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 18.0,
      height: 2.0,
    );

    return DefaultTextStyle.merge(
        style: descTextStype,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Icon(Icons.kitchen, color: Colors.green[500]),
                  Text('PREP:'),
                  Text('25 min'),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(Icons.timer, color:Colors.green[500]),
                  Text('COOK:'),
                  Text('1 hr'),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(Icons.restaurant, color: Colors.green[500]),
                  Text('FEEDS:'),
                  Text('4-6'),
                ],
              ),
            ],
          ),
        ),
    );
  }
}
