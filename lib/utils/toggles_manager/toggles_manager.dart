import 'package:flutter/cupertino.dart';

class TogglesManager extends ChangeNotifier{
  int _selectedIndex = -1;

  int get selectedIndex => _selectedIndex;

  void select(int index){
    if(_selectedIndex == index || index < 0){
      return;
    }else{
      _selectedIndex = index;
    }
    notifyListeners();
  }

  void reset(){
    _selectedIndex = -1;
    notifyListeners();
  }
}

