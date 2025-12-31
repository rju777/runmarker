import 'package:flutter/cupertino.dart';

class Logo extends StatelessWidget{
  final String logoPath = 'assets/img/logo.png';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 102,
      width: 102,
      child: Image.asset(logoPath,fit: BoxFit.cover,),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(29)
      ),
    );
  }
}