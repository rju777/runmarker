import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SingleToggle extends StatelessWidget{
  final VoidCallback event;
  final bool isToggle;

  const SingleToggle({
    required this.event,
    required this.isToggle,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    if(isToggle){
      return Container(
        width: 16,
        height: 16,
        child: GestureDetector(
            onTap: event,
            child: Stack(
              children: [
                SvgPicture.asset('assets/svg/ellipse_active.svg',width:16,height:16,fit: BoxFit.cover,),
                Center(child: SvgPicture.asset('assets/svg/toggle_1.svg',width:3.04,height:6.32,fit: BoxFit.cover,),),
              ],
            )
        ),
      );
    }
    else{
      return Container(
        width: 16,
        height: 16,
        child: GestureDetector(
            onTap: event,
            child: Stack(
              children: [
                SvgPicture.asset('assets/svg/ellipse_sleep.svg',width:16,height:16,fit: BoxFit.cover,),
                Center(child: SvgPicture.asset('assets/svg/toggle_2.svg',width:3.04,height:6.32,fit: BoxFit.cover,),),
              ],
            )
        ),
      );
    }
  }
}