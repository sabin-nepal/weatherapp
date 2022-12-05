import 'package:flutter/material.dart';
import 'package:weatherapp/core/user_share_preference.dart';

class RootController extends ChangeNotifier {
  bool _isSkip = false;
  bool get isSkip => _isSkip;
  RootController() {
    checkIfSkip();
  }

  checkIfSkip() async {
    _isSkip = await UserSharePreference.isSkip();
    notifyListeners();
  }

  handleSkip() async {
    _isSkip = true;
    await UserSharePreference.setSkip();
    notifyListeners();
  }
}
