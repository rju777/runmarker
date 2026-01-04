import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:markrun/domain/models/userInfo.dart';
import 'package:markrun/routing/AppRouter.gr.dart';
import 'package:markrun/ui/core/ui/single_button.dart';
import 'package:markrun/ui/widgets/register/register_page_3.dart';

@RoutePage()
class RegisterPage2 extends StatefulWidget{
  final _userInfo = UserInfo();
  final String firstTitle = "What's your birth?";
  final String content = 'Calories & Stride Length Calculation need it';
  final String cancel = 'cancel';
  final String confirm = 'confirm';

  @override
  State<StatefulWidget> createState() => RegisterPage2State();
}

class RegisterPage2State extends State<RegisterPage2>{
  final List<int> _years = List.generate(86, (index) => 1941 + index);
  final List<int> _months = List.generate(12, (index) => index + 1);
  final List<int> _days = List.generate(31, (index) => index + 1);

  int _selectedYear = 1999;
  int _selectedMonth = 1;
  int _selectedDay = 1;

  void _clickNext(){
    // refresh message
    widget._userInfo.birth = '$_selectedYear-$_selectedMonth-$_selectedDay';

    AutoRouter.of(context).push(RegisterRoute3());
    debugPrint('Register: set birth: ${widget._userInfo.birth}');
    debugPrint('Register Page2: go to register page3...');
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
                    top: 56,
                      //bottom: 542,
                      //left: 204,
                      right: -43,
                      child: Image.asset('assets/img/birth_background.png',width: 214, height: 214,fit: BoxFit.contain,)
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
          // selection frame
          // Positioned(
          //   top: 361,
          //     //bottom: 405,
          //     left: 20,
          //     right: 20,
          //     child: Container(
          //       width: 335,
          //       height: 46,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(10),
          //         color: Color(0xFFF5F5F5),
          //         boxShadow: [
          //           BoxShadow(
          //             color: Colors.black12,
          //             offset: Offset(-1, 1),
          //             blurRadius: 0.1,
          //             spreadRadius: 0.1
          //           )
          //         ]
          //       ),
          //     )
          // ),
          // set birth
          Positioned(
            top: 283,
              bottom: 327,
              left: 21,
              right: 20,
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        // 年列
                        Expanded(
                          child: CupertinoPicker(
                            scrollController: FixedExtentScrollController(
                              initialItem: _years.indexOf(_selectedYear),
                            ),
                            itemExtent: 40,
                            onSelectedItemChanged: (index) {
                              setState(() => _selectedYear = _years[index]);
                            },
                            children: _years
                                .map((year) => Center(
                              child: Text(
                                '$year',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ))
                                .toList(),
                          ),
                        ),
                        // 月列
                        Expanded(
                          child: CupertinoPicker(
                            scrollController: FixedExtentScrollController(
                              initialItem: _months.indexOf(_selectedMonth),
                            ),
                            itemExtent: 40,
                            onSelectedItemChanged: (index) {
                              setState(() => _selectedMonth = _months[index]);
                            },
                            children: _months
                                .map((month) => Center(
                              child: Text(
                                '$month',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ))
                                .toList(),
                          ),
                        ),
                        // 日列
                        Expanded(
                          child: CupertinoPicker(
                            scrollController: FixedExtentScrollController(
                              initialItem: _days.indexOf(_selectedDay),
                            ),
                            itemExtent: 40,
                            onSelectedItemChanged: (index) {
                              setState(() => _selectedDay = _days[index]);
                            },
                            children: _days
                                .map((day) => Center(
                              child: Text(
                                '$day',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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