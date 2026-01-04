import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:markrun/domain/models/userInfo.dart';
import 'package:markrun/routing/AppRouter.gr.dart';
import 'package:markrun/ui/core/ui/single_button.dart';
import 'package:markrun/ui/widgets/register/register_page_4.dart';

@RoutePage()
class RegisterPage3 extends StatefulWidget{
  final _userInfo = UserInfo();
  final String firstTitle = "How tall are you?";
  final String content = 'To personalize your fitness goal';
  final String btn1 = 'CM';
  final String btn2 = 'FT';

  @override
  State<StatefulWidget> createState() => RegisterPage3State();
}

class RegisterPage3State extends State<RegisterPage3>
with TickerProviderStateMixin{
  List<int> _tall = List.generate(151, (index)=> 100+index);

  int _selectTall = 160;
  bool _isCM = true;

  void _clickNext(){
    widget._userInfo.height = _selectTall;
    AutoRouter.of(context).push(RegisterRoute4());
    debugPrint('Register: set tall: ${widget._userInfo.height}');
    debugPrint('Register Page3: go to register page4...');
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
                      top: 51,
                      //bottom: 542,
                      //left: 204,
                      right: -57,
                      child: ShaderMask(
                          shaderCallback: (Rect bounds){
                            return LinearGradient(
                              begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.white.withAlpha(20),
                                  Colors.white.withAlpha(80)
                                ]
                            ).createShader(bounds);
                          },
                        blendMode: BlendMode.dstIn,
                        child: Image.asset('assets/img/tall_background.png',width: 219, height: 219,fit: BoxFit.contain,),
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
                        const SizedBox(height: 13,),
                        Text(
                          widget.content,
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF676767)
                          ),
                        ),
                        const SizedBox(height: 12,),
                        // height button
                        Container(
                          alignment: Alignment.center,
                          width: 180,
                          height: 46,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              color: Color(0xFFF4F4F4),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(-1, 1),
                                blurRadius: 0.5,
                                spreadRadius: 0.5,
                                color: Colors.black12
                              )
                            ]
                          ),
                          child: Stack(
                            children: [
                              // 底层背景
                              AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                margin: EdgeInsets.only(
                                  left:  _isCM ? 0:94
                                ),
                                width: 94,
                                height: 46,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    gradient: LinearGradient(
                                        stops: [0.05,1.0],
                                        colors: [
                                          Color(0xFFFFED29),
                                          Color(0xFFC9FF6B)
                                        ]
                                    )
                                ),
                              ),
                              // 上层文本
                              Row(
                                children: [
                                  // CM
                                  GestureDetector(
                                    onTap: (){
                                      if(!_isCM){
                                        setState(() {
                                          _isCM = true;
                                        });
                                      }
                                      debugPrint('Register: click CM');
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 94,
                                      height: 46,
                                      child: Text(
                                        'CM',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: _isCM ? Color(0xFF68890A) : Color(0xFFC0C0C0)
                                        ),
                                      ),
                                    ),
                                  ),
                                  // FT
                                  GestureDetector(
                                    onTap: (){
                                      if(_isCM){
                                        setState(() {
                                          _isCM = false;
                                        });
                                      }
                                      debugPrint('Register: click FT');
                                    },
                                    child: Container(
                                        alignment: Alignment.center,
                                        width: 86,
                                        height: 46,
                                        child: Text(
                                          'FT',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: _isCM ? Color(0xFFC0C0C0) : Color(0xFF68890A)
                                          ),
                                        )
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ),
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
                  initialItem: _tall.indexOf(_selectTall)
                ),
                  itemExtent: 40,
                  onSelectedItemChanged: (index){
                    setState(() {
                      _selectTall = _tall[index];
                    });
                  },
                  children: _tall.map((tall)=>Center(
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
                event: _clickNext,
                textStr: 'NEXT STEP'
            ),
          )
        ],
      ),
    );
  }
}