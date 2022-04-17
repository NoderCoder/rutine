import 'package:flutter/material.dart';
import './linepainters.dart';

//--------------------
//making the box for holding the tappabele circle or some other widget
class BoxHolder extends StatelessWidget {
  final Widget boxHolderChildWidget;
  const BoxHolder({Key? key, required this.boxHolderChildWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomPaint(
          painter: DrawVerticalStraightLine(),
        ),
        SizedBox(
          height: 52,
          width: 52,
          child: Center(
            key: UniqueKey(),
            //replace with button
            child: boxHolderChildWidget,
          ),
        ),
        CustomPaint(
          painter: DrawVerticalStraightLine(),
        ),
      ],
    );
  }
}
