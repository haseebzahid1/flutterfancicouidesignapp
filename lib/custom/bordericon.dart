import 'package:fancicouidesign/utils/constants.dart';
import 'package:flutter/material.dart';


class BorderIcon extends StatelessWidget {
  final Widget child;
  final double? padding;
  final double width, height;

  const BorderIcon({ required this.child, required this.width, required this.height,  this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: COLOR_WHITE,
            borderRadius:  const BorderRadius.all(Radius.circular(15.0)),
            border: Border.all(color: COLOR_GREY.withAlpha(40), width: 2)),
        // padding: const EdgeInsets.all(8.0),
        padding: EdgeInsets.all(padding ?? 8.0) ,
        child: Center(child: child));
  }

}
