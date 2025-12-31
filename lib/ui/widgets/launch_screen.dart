import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:markrun/domain/models/userInfo.dart';
import 'package:markrun/ui/core/ui/logo.dart';
import 'package:markrun/ui/core/ui/single_button.dart';

@RoutePage()
class LaunchScreen extends StatefulWidget{
  UserInfo userInfo = UserInfo();

  @override
  State<StatefulWidget> createState() =>LaunchScreenState();
}

class LaunchScreenState extends State<LaunchScreen>{
  @override
  Widget build(BuildContext context) {
    debugPrint('Screen: showing LaunchScreen');
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
          Positioned(
            top: 282,
            bottom: 428,
            left: 135,
            right: 135,
            child: Center(
              child: Logo(),
            ),
          ),
          Positioned(
              //top: 568,
              bottom: 180,
              left: 37.5,
              right: 37.5,
              child: SingleButton(event: (){}, textStr: 'START',height: 64,width: 300,),
          ),
        ],
      )
    );
  }
}