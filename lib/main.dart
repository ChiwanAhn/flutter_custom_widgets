import 'package:buttons/buttons/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Buttons Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LayoutScreen(),
    );
  }
}

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('한자 연습'),
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            color: Colors.blue.withOpacity(0.4),
            height: 100,
            child: Text('description'),
          ),
          Container(
            color: Colors.green.withOpacity(0.4),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Center(
              child: Text(
                'also',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
          ),
          _buildScrollable(),
          _buildButtons(),
        ],
      ),
    );
  }

  Widget _buildScrollable() {
    return Expanded(
      child: Container(
        color: Colors.yellow.withOpacity(0.4),
        padding: const EdgeInsets.all(24),
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 80),
            physics: AlwaysScrollableScrollPhysics(),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
              style: TextStyle(
                fontSize: 24,
                height: 1.7,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ...List.generate(
                  4,
                  (index) => RaisedButton(
                    onPressed: () {},
                    child: Text('순서없이'),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ...List.generate(
                  4,
                  (index) => RaisedButton(
                    onPressed: () {},
                    child: Text('순서없이'),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class ButtonsHome extends StatelessWidget {
//   const ButtonsHome({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         children: <Widget>[
//           BasicCustomButtonScreen(),
//           FluidAnimatedButtonScreen(),
//         ],
//       ),
//     );
//   }
// }
