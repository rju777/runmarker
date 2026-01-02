import 'dart:math';

import 'package:flutter/cupertino.dart';

class MaleFrame extends StatelessWidget{
  final VoidCallback event;
  final bool isSelected;

  MaleFrame({
    required this.event,
    this.isSelected = false,
    super.key
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: event,
        child: Container(
            child: isSelected ? Image.asset(
              'assets/img/selected_male.png',
              width: 184,
              height: 197,
              fit: BoxFit.contain,
            ) : Image.asset(
              'assets/img/unselected_male.png',
              width: 170,
              height: 182,
              fit: BoxFit.contain,
            )
        )
    );
  }
}
