import 'package:flutter/material.dart';

class AnimationDemoRoute extends StatefulWidget {
  static final String animationDemo = '动画演示';

  @override
  State<StatefulWidget> createState() => _AnimationControllerState();
}

class _AnimationControllerState extends State<AnimationDemoRoute> with SingleTickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation curve;
  Animation<int> _tween;
  Animation<Color> _colorTween;

  @override
  void initState() {
    controller = AnimationController(duration: Duration(milliseconds: 2000), vsync: this);
    curve = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    _tween = IntTween(begin: 0, end: 50).animate(curve);
    _tween.addListener(() => this.setState(() {}));
    _colorTween = ColorTween(begin: Colors.green, end: Colors.red).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AnimationDemoRoute.animationDemo),
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return GestureDetector(
      onTap: () => _onTap(controller),
      child: ListView(children: [
        RotationTransition(
          turns: curve,
          child: FlutterLogo(size: 100.0),
        ),
        Container(
          height: _tween.value * 1.0,
          color: Colors.green,
        ),
        MyAnimatedWidget(
          animation: _colorTween,
        ),
        AnimatedBuilder(
          animation: _tween,
          child: Container(
            decoration: BoxDecoration(color: Colors.redAccent),
          ),
          builder: (context, child) {
            return Container(
              width: _tween.value * 1.0,
              height: _tween.value * 1.0,
              child: child,
            );
          },
        ),
      ]),
//      child:
    );
  }

  void _onTap(AnimationController controller) {
    if (controller.isCompleted) {
      controller.reverse();
    } else {
      controller.forward();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class MyAnimatedWidget extends AnimatedWidget {
  MyAnimatedWidget({Key key, Animation<Color> animation}) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<Color> animation = listenable;
    return AspectRatio(
      aspectRatio: 2.5,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 80),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: animation.value,
        ),
      ),
    );
  }
}
