import 'package:flutter/material.dart';

class MainVm extends ChangeNotifier {
  bool type = true;
  final scrollController = ScrollController();
  var i = 1;
  bool goNext = false;
  int userCount = 0;
  String name = '';
  void nextPage() {
    if (scrollController.position.maxScrollExtent == scrollController.offset) {
      goNext = true;
      notifyListeners();
    }
  }

  int filterAZ = 1;

  String statusText = '';
  String genderText = '';
  int statusSelected = -1;
  int genderSelected = -1;

  bool initFilter = false;

  int themeSelect = 1;
  String themeTitle = 'Выключена';

  void filterSelect() {
    if (statusSelected != -1 || genderSelected != -1) {
      initFilter = true;
    } else {
      initFilter = false;
    }
  }

  void updateVm() {
    filterSelect();
    notifyListeners();
  }

  void updateStat() {
    notifyListeners();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
