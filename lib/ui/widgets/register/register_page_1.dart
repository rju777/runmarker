import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:markrun/domain/models/sex.dart';
import 'package:markrun/domain/models/userInfo.dart';
import 'package:markrun/routing/AppRouter.gr.dart';
import 'package:markrun/ui/core/ui/sex_selection/female_frame.dart';
import 'package:markrun/ui/core/ui/sex_selection/male_frame.dart';
import 'package:markrun/ui/core/ui/single_button.dart';
import 'package:markrun/ui/core/ui/toggle.dart';
import 'package:markrun/utils/toggles_manager/single_toggle.dart';
import 'package:markrun/utils/toggles_manager/toggles_manager.dart';
import 'package:provider/provider.dart';

@RoutePage()
class RegisterPage1 extends StatefulWidget{
  final _userInfo = UserInfo();
  final String firstTitle = "What's your gender?";
  final String content = 'Calories & Stride Length Calculation need it';
  final String toast = 'Please select your gender';

  @override
  State<StatefulWidget> createState() => _RegisterPage1State();
}

class _RegisterPage1State extends State<RegisterPage1>
with TickerProviderStateMixin{
  bool _isSeleted = false;
  final TogglesManager _togglesManager = TogglesManager();
  late AnimationController _controller;
  late Animation<dynamic> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 150)
    );
    _animation = TweenSequence([
      TweenSequenceItem(
          tween: Tween<double>(begin: 0,end:-5),
          weight: 1
      ),
      TweenSequenceItem(
          tween: Tween<double>(begin: -5,end:-7),
          weight: 2
      ),
      TweenSequenceItem(
          tween: Tween<double>(begin: -7,end:0),
          weight: 0.4
      ),
      TweenSequenceItem(
          tween: Tween<double>(begin: 0,end:5),
          weight: 1
      ),
      TweenSequenceItem(
          tween: Tween<double>(begin: 5,end:7),
          weight: 2
      ),
      TweenSequenceItem(
          tween: Tween<double>(begin: 7,end:0),
          weight: 0.4
      ),
    ]).animate(
        CurvedAnimation(
            parent:_controller,
            curve: Curves.easeInOut
        )
    );
  }

  void _clickNext(){
    if(!_isSeleted){
      // start shaking animation
      _buttonShake();
      Fluttertoast.showToast(
          msg: widget.toast,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black12,
        fontSize: 14
      );
      debugPrint('Register Page1: not select sex!');
    }
    else{
      // refresh message
      widget._userInfo.sex = _togglesManager.selectedIndex == 0 ? Sex.woman : Sex.man;

      AutoRouter.of(context).push(RegisterRoute2());
      debugPrint('Register: select sex: ${widget._userInfo.sex}');
      debugPrint('Register Page1: go to register page2...');
    }
  }

  void _buttonShake(){
    _controller.reset();
    _controller.repeat(count: 4,reverse: false).whenComplete((){
      _controller.stop();
      _controller.reset();
    });

    debugPrint('Register Page1: button shaking');
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: _togglesManager,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  gradient:LinearGradient(
                    stops:[0.0,1.00],
                    begin: Alignment(0.37,0.34),
                    end:Alignment(0.91,1.0),
                    colors: [
                      Color(0xFFFFFFFF),
                      Color(0xFFFFFBD4),
                    ],
                  )
              ),
            ),
            // text part
            Positioned(
                top: 88,
                left: 26,
                right: 25,
                //bottom: 649,
                child: Container(
                    width: 324,
                    //height: 75,
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            widget.firstTitle,
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 13,),
                          Text(
                            widget.content,
                            style: TextStyle(
                                fontSize: 16,
                              color: Color(0xFF676767)
                            ),
                          )
                        ],
                      ),
                    )
                )
            ),
            // sex selection frame - male & female
            Positioned(
                top: 259,
                bottom: 370,
                left: 17.5,
                right: 18,
                child: Consumer<TogglesManager>(
                    builder: (context,manager,child){
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaleFrame(
                            isSelected: manager.selectedIndex == 0,
                            event: (){
                              manager.select(0);
                              setState(() {
                                _isSeleted = true;
                              });
                              debugPrint('Register Page1: select female');
                            },
                          ),
                          FemaleFrame(
                              isSelected: manager.selectedIndex == 1,
                              event: () {
                                manager.select(1);
                                setState(() {
                                  _isSeleted = true;
                                });
                                debugPrint('Register Page1: select male');
                              }
                          ),
                        ],
                      );
                    }
                )
            ),
            Positioned(
                top: 451,
                //bottom: 339,
                left: 40,
                right: 61,
                child: Consumer<TogglesManager>(
                    builder: (context,manager,child){
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SingleToggle(
                            event: (){},
                            isToggle: _togglesManager.selectedIndex == 0,
                          ),
                          const SizedBox(width: 4,),
                          Text(
                            'Female',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                         const SizedBox(width: 95,),
                          SingleToggle(
                            event: (){},
                            isToggle: _togglesManager.selectedIndex == 1,
                          ),
                          const SizedBox(width: 4,),
                          Text(
                            'Male',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      );
                    }
                )
            ),
            // indicator
            Positioned(
              //top: 657,
                bottom: 147,
                left: 150,
                right: 149,
                child: Container(
                  width: 76,
                  height: 8,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 28,
                        height: 8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black
                        ),
                      ),
                      const SizedBox(width: 8,),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFD6D6D6)
                        ),
                      ),
                      const SizedBox(width: 8,),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFD6D6D6)
                        ),
                      ),
                      const SizedBox(width: 8,),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFD6D6D6)
                        ),
                      )
                    ],
                  ),
                )
            ),
            // button
            Positioned(
              //top: 687,
                bottom: 61,
                left: 37.5,
                right: 37.5,
                child: AnimatedBuilder(
                    animation: _animation,
                    builder: (context,child){
                      final offsetX = _animation.value;
                      return Transform.translate(
                        offset: Offset(offsetX, 0),
                        child: child,
                      );
                    },
                  child: SingleButton(
                      event: _clickNext,
                      textStr: 'NEXT STEP'
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}