import 'package:fancicouidesign/utils/constants.dart';
import 'package:fancicouidesign/utils/widget_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final double width;

  const OptionButton({ required this.text, required this.icon, required this.width});



  @override
  Widget build(BuildContext context) {
    return Container(
      // width: width,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 135.0,//fill hall is container ko width dy lakin  edar minsise legaky dekh na ha
            child: ElevatedButton.icon(
              onPressed: (){},
              icon: Icon(
                icon,
                color: COLOR_WHITE,
              ),
              style: ElevatedButton.styleFrom(
                primary: COLOR_DARK_BLUE,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
              label: Text(text,style: TextStyle(color: COLOR_WHITE),),),
          ),
        ],
      ),
    );
  }
}
