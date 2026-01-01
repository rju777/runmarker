import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:markrun/domain/models/userInfo.dart';
import 'package:markrun/routing/AppRouter.dart';
import 'package:markrun/routing/AppRouter.gr.dart';
import 'package:markrun/ui/core/ui/single_button.dart';

@RoutePage()
class RegisterHomePage extends StatefulWidget{
  final _userInfo = UserInfo();
  final String firstTitle = 'Hello';
  final String secondTitle = 'Welcome to Vitalo.';
  final String content = "In order to better carry out the next step of training,\nI need to know some information about you.\nLet's get started!";
  
  @override
  State<StatefulWidget> createState() => RegisterHomePageState();
}

class RegisterHomePageState extends State<RegisterHomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                Image.asset('assets/img/register_1.png',fit: BoxFit.cover,)
              ],
            ),
          ),
          Positioned(
            top: 475,
              left: 27,
              right: 28,
              bottom: 173,
              child: Container(
                // width: 320,
                // height: 164,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // first title
                    Text(
                      widget.firstTitle,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    // second title
                    Text(
                      widget.secondTitle,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 4,),
                    // content
                    Text(
                      widget.content,
                      softWrap: true,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontStyle: FontStyle.normal
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
              child: SingleButton(
                  event: (){
                    debugPrint('Register Page: next to set sex');
                    AutoRouter.of(context).push(RegisterRoute1());
                  },
                  textStr: 'START'
              )
          )
        ],
      ),
    );
  }
}