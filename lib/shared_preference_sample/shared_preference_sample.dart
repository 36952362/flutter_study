import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceSampleRoute extends StatefulWidget {
  static final String sharedPreferenceSample = 'Shared Preferences演示';

  @override
  State<StatefulWidget> createState() => _SharedPreferenceSampleState();
}

class _SharedPreferenceSampleState extends State<SharedPreferenceSampleRoute>{
  int nCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text(SharedPreferenceSampleRoute.sharedPreferenceSample),
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Center(
      child: RaisedButton(
        child: Text('Increame $nCount'),
        onPressed: _incrementCount,
      ),
    );
  }


  void _incrementCount() async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    nCount = (prefs.getInt('counter') ?? 0) + 1;
    prefs.setInt('counter', nCount);

    setState(()  {});
  }
}