import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class FluidAnimatedButtonScreen extends StatelessWidget {
  const FluidAnimatedButtonScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: FluidAnimatedButton(
              child: Text('HECHO'),
              onPressed: () {},
              onDismissed: () {},
            ),
          )
        ],
      ),
    );
  }
}

class FluidAnimatedButton extends StatefulWidget {
  FluidAnimatedButton({
    Key key,
    @required this.child,
    @required this.onPressed,
    @required this.onDismissed,
    this.color,
  }) : super(key: key);

  final Widget child;
  final Function onPressed;
  final Function onDismissed;
  final Color color;

  @override
  _FluidAnimatedButtonState createState() => _FluidAnimatedButtonState();
}

class _FluidAnimatedButtonState extends State<FluidAnimatedButton>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _animation = Tween<double>(begin: 0, end: 4).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Stack(
          children: <Widget>[
            Container(
              constraints: BoxConstraints(minHeight: 60),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              decoration: BoxDecoration(
                color: widget.color ?? Colors.black,
                borderRadius: BorderRadius.circular(80),
              ),
            ),
            Positioned.fill(
              child: Container(
                child: Center(
                  child: DefaultTextStyle(
                    style: Get.textTheme.button.copyWith(
                      color: Colors.white,
                    ),
                    child: widget.child,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
