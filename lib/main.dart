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

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key key}) : super(key: key);

  @override
  _LayoutScreenState createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  PageController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    _controller = PageController();
    _controller.addListener(() {
      // FIXME: 다음으로 이동할때 page가 x.5 보다 클때만 _currentIndex를 업데이트
      // 이전으로 이동할때 page가 x.5 보다 작을때만 _currentIndex를 업데이트
      setState(() {
        _currentIndex = _controller.page.toInt();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int _length = 5;
    return Scaffold(
      appBar: AppBar(
        title: Text('화면전환'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.red.withOpacity(0.3),
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  PageView.builder(
                    controller: _controller,
                    itemCount: _length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Center(
                          child: Text(
                            '${index + 1} 번째 화면',
                            style: Get.textTheme.headline3,
                          ),
                        ),
                      );
                    },
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SafeArea(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        child: Text(
                          '${_currentIndex + 1} / $_length',
                          style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  OutlineButton(
                    onPressed: _currentIndex > 0
                        ? () {
                            _controller.animateToPage(
                              _currentIndex - 1,
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeInOut,
                            );
                          }
                        : null,
                    child: Text('이전으로'),
                  ),
                  OutlineButton(
                    onPressed: _currentIndex < _length - 1
                        ? () {
                            _controller.animateToPage(
                              _currentIndex + 1,
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeInOut,
                            );
                          }
                        : null,
                    child: Text('다음으로'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
