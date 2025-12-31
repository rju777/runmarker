import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoArea extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 320,
      child: Stack(
        alignment: Alignment(0.0,-0.3),
        children: [
          Positioned(
            width: 180,
            height: 30.02,
            child: Center(
              child: SvgPicture.asset(
                'assets/svg/logo_text.svg',
                height: 180,
                width: 30.02,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      )
    );
  }
}