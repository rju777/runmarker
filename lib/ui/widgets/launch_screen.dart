import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_text/flutter_gradient_text.dart';
import 'package:markrun/domain/models/userInfo.dart';
import 'package:markrun/routing/AppRouter.gr.dart';
import 'package:markrun/ui/core/ui/logo.dart';
import 'package:markrun/ui/core/ui/logo_area.dart';
import 'package:markrun/ui/core/ui/protocol/launch_protocol.dart';
import 'package:markrun/ui/core/ui/single_button.dart';

@RoutePage()
class LaunchScreen extends StatefulWidget{
  final String title = 'Welcome to MarkRun';
  UserInfo _userInfo = UserInfo();

  @override
  State<StatefulWidget> createState() =>LaunchScreenState();
}

class LaunchScreenState extends State<LaunchScreen>
with TickerProviderStateMixin{
  bool isAccepted = false;

  late AnimationController _controller;
  late Animation<dynamic> _animation;

  @override
  void initState() {
    super.initState();
    // animation
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
    // jump route
    _delayJump();
  }

  void _clickStart(){
    if(!isAccepted){
      // start shaking animation
      _buttonShake();
      debugPrint('Launch Page: not accept protocol!');
    }
    else{
      AutoRouter.of(context).push(RegisterHomeRoute());
      debugPrint('Launch Page: go to register page...');
    }
  }

  void _buttonShake(){
    _controller.reset();
    _controller.repeat(count: 4,reverse: false).whenComplete((){
      _controller.stop();
      _controller.reset();
    });

    debugPrint('Launch Page: button shaking');
  }

  Future<void> _delayJump()async{
    debugPrint('Launch Page: loading...');
    await Future.delayed(const Duration(seconds: 4),(){
      debugPrint('Launch Page: loading finished');
    });
    await Future.delayed(const Duration(seconds: 2),(){
      if(mounted){
        AutoRouter.of(context).push(HomeRoute());
        debugPrint('Launch Page: jump to home page...');
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(widget._userInfo.firstLaunch){
      return Scaffold(
        //appBar: AppBar(title: Text('launch page'),),
          body: Stack(
            children: [
              Container(
                decoration:const BoxDecoration(
                    gradient:LinearGradient(
                      stops:[0.0,0.52, 1.00],
                      begin: Alignment(0.17,0.14),
                      end:Alignment(0.91,1.0),
                      colors: [
                        Color(0xFFFFFFFF),
                        Color(0xFFE9FCA3),
                        Color(0xFFFCF28C),
                      ],
                    )
                ),
              ),
              // logo text
              Positioned(
                  top: 82,
                  bottom: 410,
                  left: 26,
                  right: 29,
                  child: LogoArea()
              ),
              // logo
              Positioned(
                top: 282,
                bottom: 428,
                left: 135,
                right: 135,
                child: Center(
                  child: Logo(),
                ),
              ),
              // title
              Positioned(
                  top: 411,
                  left: 27,
                  right: 27,
                  child: Container(
                    width: 320,
                    height: 18,
                    child: Center(
                      child: GradientText(
                          Text(
                            widget.title,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          type: Type.linear,
                          stops: [0.3,0.95,1.0],
                          colors: [
                            Color(0xFF000000),
                            Color(0xFFA2F653),
                            Color(0xFFFCFC73)
                          ]
                      ),
                    ),
                  )
              ),
              // button
              Positioned(
                //top: 568,
                  bottom: 180,
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
                      event: _clickStart,
                      textStr: 'START',
                      height: 64,
                      width: 300,
                    ),
                  )
              ),
              // protocol
              Positioned(
                //top: 657,
                bottom: 89,
                left: 37,
                right: 38,
                child: LaunchProtocol(
                  event: (){
                    setState(() {
                      isAccepted = !isAccepted;
                      debugPrint('Launch Page: user agreement and privacy policy is $isAccepted');
                    });
                  },
                ),
              ),
            ],
          )
      );
    } else{
      return Scaffold(
        //appBar: AppBar(title: Text('launch page'),),
          body: Stack(
            children: [
              Container(
                decoration:const BoxDecoration(
                    gradient:LinearGradient(
                      stops:[0.0,0.52, 1.00],
                      begin: Alignment(0.17,0.14),
                      end:Alignment(0.91,1.0),
                      colors: [
                        Color(0xFFFFFFFF),
                        Color(0xFFE9FCA3),
                        Color(0xFFFCF28C),
                      ],
                    )
                ),
              ),
              // logo text
              Positioned(
                  top: 82,
                  bottom: 410,
                  left: 26,
                  right: 29,
                  child: LogoArea()
              ),
              // logo
              Positioned(
                top: 282,
                bottom: 428,
                left: 135,
                right: 135,
                child: Center(
                  child: Logo(),
                ),
              ),
              // title
              Positioned(
                  top: 411,
                  left: 27,
                  right: 27,
                  child: Container(
                    width: 320,
                    height: 18,
                    child: Center(
                      child: GradientText(
                          Text(
                            widget.title,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          type: Type.linear,
                          stops: [0.3,0.95,1.0],
                          colors: [
                            Color(0xFF000000),
                            Color(0xFFA2F653),
                            Color(0xFFFCFC73)
                          ]
                      ),
                    ),
                  )
              ),
            ],
          )
      );
    }
  }
}