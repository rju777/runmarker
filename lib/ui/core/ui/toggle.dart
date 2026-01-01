import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Toggle extends StatefulWidget{
  final VoidCallback event;
  bool isToggle;

  Toggle({
    required this.event,
    this.isToggle = false,
    super.key
});

  @override
  State<StatefulWidget> createState() => ToggleState();
}

class ToggleState extends State<Toggle>{
  late bool _isToggle ;

  @override
  void initState() {
    super.initState();
    _isToggle = widget.isToggle;
  }

  void _onTap(){
    setState(() {
      _isToggle = !_isToggle;
      widget.event();
      debugPrint('Toggle: change selected to ${_isToggle}');
    });
  }

  @override
  Widget build(BuildContext context) {
    if(_isToggle){
      return Container(
        width: 16,
        height: 16,
        child: GestureDetector(
            onTap: (){
              _onTap();
            },
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
          onTap: (){
            _onTap();
          },
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