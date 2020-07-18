import 'package:buttons/buttons/basic_custom_buttons/custom_button.dart';
import 'package:flutter/material.dart';

class BasicCustomButtonScreen extends StatelessWidget {
  BasicCustomButtonScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomButton(
                child: Text('버튼'),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
