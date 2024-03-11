import 'package:flutter/cupertino.dart';

class ButtonProvider extends ChangeNotifier{
  String _buttonText = 'Start';

  String get buttonText => _buttonText;

  void toggleButtonText (){
    _buttonText = (_buttonText == "Start") ? 'Stop' : "Start";
    notifyListeners();
  }
}