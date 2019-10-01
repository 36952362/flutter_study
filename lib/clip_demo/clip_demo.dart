import 'package:flutter/material.dart';

class ClipDemo extends StatelessWidget {
  static final String clipDemo = '圆角演示';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(clipDemo),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('BoxDecoration 圆角'),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.red,
                image: DecorationImage(
                  image: AssetImage("images/mixed-berries.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text('BoxDecoration 圆角对 child'),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: Image.asset(
                "images/mixed-berries.jpg",
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text('ClipRRect 圆角对 child'),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Image.asset(
                "images/mixed-berries.jpg",
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
            )
          ],
        ),
      ),
    );
  }
}
