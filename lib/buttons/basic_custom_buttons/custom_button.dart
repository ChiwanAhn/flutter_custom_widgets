import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

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
