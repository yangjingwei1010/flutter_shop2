import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int value = 0;
  increment(){
    value++;
    notifyListeners();
  }

  int currentIndex = 0;
  changeIndex(int newIndex){
    currentIndex=newIndex;
    notifyListeners();
  }

  String memberTitle;
  tranferTitle(String title){
    memberTitle = title;
    notifyListeners();
  }

}