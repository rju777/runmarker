import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage>{
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 78,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight:Radius.circular(30), ),
          color: Colors.black
        ),
        // child: SvgPicture.asset('assets/svg/tab_background.svg',fit: BoxFit.contain,)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        shape: CircleBorder(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        // clipBehavior: Clip.hardEdge,
        child: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            gradient: LinearGradient(
                stops: [0.1,1.0],
                colors: [
                  Color(0xFFFFED29),
                  Color(0xFFC9FF6B)
                ]
            ),
          ),
          child: SvgPicture.asset(
            'assets/svg/home_runner_icon.svg',
            width: 42,
            height: 41.40854,
            fit: BoxFit.fill,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Stack(
        children: [
          Positioned(
            top: 0,
              left: 0,
              right: 0,
              child: _isLoading ? Image.asset('assets/img/home_loading.png',fit: BoxFit.cover,):
              Image.asset('assets/img/home_ready.png',fit: BoxFit.cover,)
          ),
          // today's training
          Positioned(
            top: 111,
              //bottom: 390,
              left: 20,
              right: 17.8,
              child: Container(
                width: 337,
                height: 311,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white60,
                  border: Border.all(width: 1,color: Colors.greenAccent)
                ),
              )
          ),
          Column(
            children: [
              SizedBox(height: 441,),
              Expanded(
                  child: Container(
                    width: 800,
                    height: 600,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Colors.greenAccent),
                      color: Colors.white60
                    ),
                  )
              )
            ],
          )
        ],
      )
    );
  }
}