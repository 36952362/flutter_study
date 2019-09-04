import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'shared_preference_demo/shared_preference_demo.dart';
import 'startup_name_demo/statup_name_demo.dart';
import 'animatedlist_demo/animatedlist_demo.dart';
import 'images_demo/images_sample.dart';
import 'gesture_demo/gesture_demo.dart';
import 'network_demo/network_sample.dart';
import 'websocket_sample/websocket_sample.dart';
import 'layout_demo/layout_demo1.dart';
import 'layout_demo/layout_demo2.dart';
import 'animationcontroller_demo/animationcontroller_sample.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final String appTitle = "Fluter Study";
  final _listViewItems = <String>[];
  final _routes = <String, WidgetBuilder>{};

  MyApp() : super() {
    _initListViewItems();
    _initRoutes();
  }

  ///初始化ListView中每一项的内容显示
  _initListViewItems() {
    _listViewItems.add(SharedPreferenceSampleRoute.sharedPreferenceSample);
    _listViewItems.add(AnimationControllerSampleRoute.animationControllerDemo);
    _listViewItems.add(LayoutSample1Route.layoutDemoRoute);
    _listViewItems.add(LayoutSample2Route.layoutDemoRoute);
    _listViewItems.add(WebSocketSampleRoute.webSocketSampleRoute);
    _listViewItems.add(NetworkSampleRoute.networkSampleRoute);
    _listViewItems.add(GestureSampleRoute.gestureSampleRouteDemo);
    _listViewItems.add(ImagesSampleRoute.imagesSampleRoute);
    _listViewItems.add(AnimatedListRoute.animatedListDemo);
    _listViewItems.add(StartupNameRoute.startupName);
  }

  ///建立路由列表
  ///
  ///为ListView中的每一项设置相应的路由，然后通过[Navigator.pushNamed]的跳转的相应路由
  _initRoutes() {
    _routes[SharedPreferenceSampleRoute.sharedPreferenceSample] = (context) => SharedPreferenceSampleRoute();
    _routes[AnimationControllerSampleRoute.animationControllerDemo] = (context) => AnimationControllerSampleRoute();
    _routes[LayoutSample1Route.layoutDemoRoute] = (context) => LayoutSample1Route();
    _routes[LayoutSample2Route.layoutDemoRoute] = (context) => LayoutSample2Route();
    _routes[WebSocketSampleRoute.webSocketSampleRoute] = (context) => WebSocketSampleRoute();
    _routes[NetworkSampleRoute.networkSampleRoute] = (context) => NetworkSampleRoute();
    _routes[GestureSampleRoute.gestureSampleRouteDemo] = (context) => GestureSampleRoute();
    _routes[ImagesSampleRoute.imagesSampleRoute] = (context) => ImagesSampleRoute();
    _routes[AnimatedListRoute.animatedListDemo] = (context) => AnimatedListRoute();
    _routes[StartupNameRoute.startupName] = (context) => StartupNameRoute();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      routes: _routes,
      home: MyHomePage(title: appTitle, items: _listViewItems),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  final List<String> items;
  MyHomePage({Key key, this.title, this.items}) : super(key: key);

  ///通过列表项中的名字查找在_routes中映射并跳转到相应的路由
  void _jumpDetailRoute(BuildContext context, String itemName) async {
    await Navigator.pushNamed(context, itemName);

    ///设置屏幕方向
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
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

  ///根据List构建一个ListView Widget,并设置点击回调方法
  Widget _bodyContent(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.apps),
          title: Text(items[index]),
          onTap: () => _jumpDetailRoute(context, items[index]),
        );
      },
    );
  }
}
