import 'package:flutter/material.dart';
import '../widgets/cat.dart';

class Home extends StatefulWidget {
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  Animation<double> catAnimation;
  AnimationController catController;

  // Only works when you extend State
  initState() {
    super.initState();

    catController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    catAnimation = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: catController,
        curve: Curves.easeIn,
      ),
    );

    catController.forward();
  }

  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation!'),
      ),
      body: buildAnimation(),
    );
  }

  Widget buildAnimation() {
    return AnimatedBuilder(
      animation: catAnimation,
      builder: (context, child) {
        // child is the child: Cat() instantiated below
        return Container(
          child: child,
          margin: EdgeInsets.only(top: catAnimation.value),
        );
      },
      // No need to create the widget over and over again (unlike StreamBuilder and text inputs), Cat is created once, and reused over and over
      child: Cat(),
    );
  }
}
