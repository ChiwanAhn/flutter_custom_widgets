import 'package:buttons/screens/basic_custom_button_screen/basic_custom_button_screen.dart';
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
      home: ButtonsHome(),
    );
  }
}

class ButtonsHome extends StatelessWidget {
  const ButtonsHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          BasicCustomButtonScreen(),
        ],
      ),
    );
  }
}
