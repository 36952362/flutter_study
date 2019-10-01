import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ScrollControllerDemo extends StatefulWidget {
  static final String scrollControllerDemo = "滚动控制演示";
  @override
  State<StatefulWidget> createState() => _ScrollControllerState();
}

class _ScrollControllerState extends State<ScrollControllerDemo> {
  final ScrollController _scrollController = ScrollController();

  final int defaultScroller = 300;
  final int defaultShowTopButton = 1000;

  bool showToTopBtn = false;
  double toolbarOpacity = 0.0;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      setState(() {
        double t = _scrollController.offset / defaultScroller;
        if (t < 0.0) {
          t = 0.0;
        } else if (t > 1.0) {
          t = 1.0;
        }
        toolbarOpacity = t;

        if (_scrollController.offset < defaultShowTopButton && showToTopBtn) {
          showToTopBtn = false;
        }

        if (_scrollController.offset >= defaultShowTopButton && !showToTopBtn) {
          showToTopBtn = true;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: _stackWidgets(context),
      ),
      floatingActionButton: !showToTopBtn
          ? null
          : FloatingActionButton(
              child: Icon(Icons.keyboard_arrow_up),
              onPressed: () {
                _scrollController.animateTo(
                  0.0,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
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
    return ListView.builder(
      controller: _scrollController,
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
