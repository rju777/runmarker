import 'package:flutter/cupertino.dart';
import 'package:markrun/ui/core/ui/toggle.dart';

class FemaleFrame extends StatelessWidget{
  final VoidCallback event;
  final bool isSelected;

  FemaleFrame({
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
              'assets/img/selected_female.png',
              width: 184,
              height: 197,
              fit: BoxFit.contain,
            )
                : Image.asset(
              'assets/img/unselected_female.png',
              width: 173,
              height: 188,
              fit: BoxFit.contain,
            ),
        )
    );
  }
}