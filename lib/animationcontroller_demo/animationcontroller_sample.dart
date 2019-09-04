import 'package:flutter/material.dart';


class AnimationControllerSampleRoute extends StatefulWidget {
  static final String animationControllerDemo = '动画演示';

  @override
  State<StatefulWidget> createState() => _AnimationControllerState();
}

class _AnimationControllerState extends State<AnimationControllerSampleRoute> with SingleTickerProviderStateMixin{


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(AnimationControllerSampleRoute.animationControllerDemo),
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    AnimationController controller = AnimationController(duration: Duration(milliseconds: 2000), vsync: this);
    CurvedAnimation curve = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    return GestureDetector(
      onTap: () => _onTap(controller),
      child: RotationTransition(
        turns: curve,
        child: FlutterLogo(size:200.0),
      ),
    );
  }


  void _onTap(AnimationController controller) {
    if(controller.isCompleted){
      controller.reverse();
    }else{
      controller.forward();
    }
  }


}