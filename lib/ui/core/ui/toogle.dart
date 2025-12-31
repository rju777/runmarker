import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Toggle extends StatefulWidget{
  final bool isToggle;

  const Toggle({
    this.isToggle = false,
    super.key
});

  @override
  State<StatefulWidget> createState() => ToggleState();
}

class ToggleState extends State<Toggle>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: Stack(
          children: [
            SvgPicture.asset('assets/svg/ellipse_active.svg',fit: BoxFit.cover,),
            SvgPicture.asset('assets/svg/toggle_1.svg',fit: BoxFit.cover,)
          ],
        )
      ),
    );
  }
}