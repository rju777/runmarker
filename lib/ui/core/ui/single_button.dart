import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SingleButton extends StatefulWidget{
  /// 事件
  final FutureOr<void> event;
  final String textStr;
  final Color backgroundColor;
  final Color textColor;
  final double? height;
  final double? width;

  const SingleButton({
    required this.event,
    required this.textStr,
    this.backgroundColor = Colors.black,
    this.textColor = Colors.white,
    this.height = 56,
    this.width = 200,
    super.key
});

  @override
  State<StatefulWidget> createState() => SingleButtonState();
}

class SingleButtonState extends State<SingleButton>{
  Future<void> _click()async{
    try{
      await widget.event;
      debugPrint('Single Button: click');
    }catch(e){
      debugPrint('Single Button: error $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 200,
      child: GestureDetector(
        onTap: _click,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Text(
                widget.textStr,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: widget.textColor,
                fontStyle: FontStyle.italic
              ),
            ),
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: widget.backgroundColor
      ),
    );
  }
}