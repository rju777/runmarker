import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:markrun/domain/models/userInfo.dart';
import 'package:markrun/ui/core/ui/single_button.dart';
import 'package:markrun/utils/save_files/save_files.dart';

@RoutePage()
class RegisterPage4 extends StatefulWidget{
  final _userInfo = UserInfo();
  final String firstTitle = "How much do you weight?";
  final String content = 'To personalize your fitness goal';
  final String btn1 = 'KG';
  final String btn2 = 'LBS';

  @override
  State<StatefulWidget> createState() => RegisterPage4State();
}

class RegisterPage4State extends State<RegisterPage4>{
  List<int> _weight = List.generate(271, (index)=> 20+index);

  int _selectWeight = 55;

  void _clickNext(){
    widget._userInfo.weight = _selectWeight;
    widget._userInfo.register();
    //AutoRouter.of(context).push();
    debugPrint('Register: set weight: ${widget._userInfo.weight}');
    debugPrint('Register Page4: over register...');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Stack(
                children: [
                  // background color
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
                  Positioned(
                      top: 32,
                      //bottom: 542,
                      //left: 204,
                      right: -60,
                      child: ShaderMask(
                        shaderCallback: (Rect bounds){
                          return LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.white.withAlpha(5),
                                Colors.white.withAlpha(60)
                              ]
                          ).createShader(bounds);
                        },
                        blendMode: BlendMode.dstIn,
                        child: Image.asset('assets/img/weight_background.png',width: 258, height: 247,fit: BoxFit.contain,),
                      )
                  )
                ],
              )
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
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 13,),
                        Text(
                          widget.content,
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 16
                          ),
                        )
                      ],
                    ),
                  )
              )
          ),
          // height selection
          Positioned(
              top: 261,
              bottom: 338,
              left: 39,
              right: 39,
              child: CupertinoPicker(
                  scrollController: FixedExtentScrollController(
                      initialItem: _weight.indexOf(_selectWeight)
                  ),
                  itemExtent: 40,
                  onSelectedItemChanged: (index){
                    setState(() {
                      _selectWeight = _weight[index];
                    });
                  },
                  children: _weight.map((tall)=>Center(
                    child: Text(
                      '$tall',
                      style: const TextStyle(fontSize: 16),
                    ),
                  )).toList()
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
                    ),
                    const SizedBox(width: 8,),
                    Container(
                      width: 28,
                      height: 8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black
                      ),
                    ),
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
                event: _clickNext,
                textStr: 'NEXT STEP'
            ),
          )
        ],
      ),
    );
  }
}