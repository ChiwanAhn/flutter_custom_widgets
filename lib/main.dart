import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomButton(
                child: Text('매매'),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key key,
    @required this.child,
    @required this.onPressed,
  })  : leading = null,
        super(key: key);

  const CustomButton.icon({
    Key key,
    @required this.child,
    @required this.onPressed,
    this.leading,
  }) : super(key: key);

  const CustomButton.menuIcon({
    Key key,
    @required this.child,
    @required this.onPressed,
  })  : leading = const Icon(
          Icons.add_circle_outline,
          color: Colors.red,
          size: 20,
        ),
        super(key: key);

  final Widget leading;
  final Widget child;
  final Function onPressed;

  bool get _disabled => onPressed == null;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
        side: BorderSide(
          color: _disabled ? Colors.transparent : Get.theme.primaryColor,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(2),
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 6,
          ),
          child: DefaultTextStyle(
            style: TextStyle(
              fontSize: 16,
              color:
                  _disabled ? Get.theme.disabledColor : Get.theme.primaryColor,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (leading != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: leading,
                  ),
                child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
