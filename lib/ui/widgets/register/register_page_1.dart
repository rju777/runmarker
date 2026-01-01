import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:markrun/domain/models/userInfo.dart';
import 'package:markrun/ui/core/ui/single_button.dart';

@RoutePage()
class RegisterPage1 extends StatefulWidget{
  final _userInfo = UserInfo();
  final String firstTitle = "What's your gender?";
  final String content = 'Calories & Stride Length Calculation need it';

  @override
  State<StatefulWidget> createState() => RegisterPage1State();
}

class RegisterPage1State extends State<RegisterPage1>{
  bool _isSeleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              bottom: 649,
              child: Container(
                width: 324,
                height: 75,
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
                          fontSize: 16
                        ),
                      )
                    ],
                  ),
                )
              )
          ),
          // sex selection frame - female
          Positioned(
            top: 259,
              bottom: 370,
              left: 17.5,
              right: 187,
              child: Container(
                width: 170,
                height: 182,
                child:Center(
                  child: Stack(
                    children: [
                      Positioned(
                        top: 43.6,
                          left: 15.9,
                          right: 15.9,
                          child: Container(
                            width: 138.753,
                            height: 138.753,
                            child: SvgPicture.asset('assets/svg/subtract_sexframe.svg',width: 138.753,height: 138.753,fit: BoxFit.cover,),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color:Colors.black12,
                                  offset: Offset(-5, 5),
                                  blurRadius: 1,
                                  spreadRadius: -5
                                )
                              ]
                            ),
                          )
                      ),
                      // head
                      Positioned(
                        //bottom: 11.9,
                        child: Image.asset('assets/img/female.png',width:170.467,height:170.467,fit: BoxFit.cover,),
                      )
                    ],
                  )
                )
              )
          ),
          // sex selection frame - male
          Positioned(
              child: Container(

              )
          ),
          // indicator
          Positioned(
              child: Container(

              )
          ),
          // button
          Positioned(
            top: 687,
              bottom: 61,
              left: 37.5,
              right: 37.5,
              child: SingleButton(
                  event: (){
                    if(_isSeleted){
                      // record message
                      debugPrint('Register Page: next to set birth');
                    }else{
                      debugPrint('Register Page: not select sex information!');
                    }
                  },
                  textStr: 'NEXT STEP'
              )
          )
        ],
      ),
    );
  }
}