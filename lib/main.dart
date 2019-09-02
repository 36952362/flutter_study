import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'shared_preference_sample/shared_preference_sample.dart';
import 'startup_name/statup_name.dart';
import 'animatedlist_sample/animatedlist_sample.dart';
import 'images_sample/images_sample.dart';
import 'gesture_sample/gesture_sample.dart';
import 'network_sample/network_sample.dart';
import 'websocket_sample/websocket_sample.dart';
import 'layout_sample/layout_sample1.dart';
import 'layout_sample/layout_sample2.dart';
import 'animationcontroller_sample/animationcontroller_sample.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final String appTitle = "Fluter Study";
  final _items = Set<String>();

  MyApp() : super() {
    _items.add(SharedPreferenceSampleRoute.sharedPreferenceSample);
    _items.add(AnimationControllerSampleRoute.animationControllerSample);
    _items.add(LayoutSample1Route.layoutSampleRoute);
    _items.add(LayoutSample2Route.layoutSampleRoute);
    _items.add(WebSocketSampleRoute.webSocketSampleRoute);
    _items.add(NetworkSampleRoute.networkSampleRoute);
    _items.add(GestureSampleRoute.gestureSampleRoute);
    _items.add(ImagesSampleRoute.imagesSampleRoute);
    _items.add(AnimatedListRoute.animatedListSample);
    _items.add(StartupNameRoute.startupName);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      routes: {
        SharedPreferenceSampleRoute.sharedPreferenceSample:(context) => SharedPreferenceSampleRoute(),
        AnimationControllerSampleRoute.animationControllerSample:(context) => AnimationControllerSampleRoute(),
        LayoutSample1Route.layoutSampleRoute:(context) => LayoutSample1Route(),
        LayoutSample2Route.layoutSampleRoute:(context) => LayoutSample2Route(),
        WebSocketSampleRoute.webSocketSampleRoute:(context) => WebSocketSampleRoute(),
        NetworkSampleRoute.networkSampleRoute:(context) => NetworkSampleRoute(),
        GestureSampleRoute.gestureSampleRoute:(context) => GestureSampleRoute(),
        ImagesSampleRoute.imagesSampleRoute:(context) => ImagesSampleRoute(),
        AnimatedListRoute.animatedListSample:(context)=> AnimatedListRoute(),
        StartupNameRoute.startupName: (context)=>StartupNameRoute(),
      },
      home: MyHomePage(title: appTitle, items: _items),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  final Set<String> items;
  MyHomePage({Key key, this.title, this.items}) : super(key: key);

  void _jumpDetailRoute (BuildContext context, String itemName) async{
    await Navigator.pushNamed(context, itemName);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: _bodyContent(context),
    );
  }

  Widget _bodyContent(BuildContext context) {
    final tiles = items.map((item) {
      return ListTile(
        leading: Icon(Icons.apps),
        title: Text(item),
        onTap: ()=>_jumpDetailRoute(context, item),
      );
    });

    final divided =
        ListTile.divideTiles(context: context, tiles: tiles).toList();

    return ListView(
      children: divided,
    );
  }
}
