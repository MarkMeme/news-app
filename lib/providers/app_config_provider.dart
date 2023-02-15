import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier{
  String appLanguage = 'en';
  void changeLanguage(String newLanguage){
    if(newLanguage == appLanguage){
      return;
    }
    else{
      appLanguage = newLanguage ;
    }
    notifyListeners();
  }
}