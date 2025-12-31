import 'package:flutter/cupertino.dart';

class Toogle extends StatefulWidget{
  final bool isToogle;

  const Toogle({
    required this.isToogle = false,
    super.key
});

}

class ToogleState extends State<Toogle>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: Image(image: '',fit: BoxFit.cover,),
      ),
    );
  }
}