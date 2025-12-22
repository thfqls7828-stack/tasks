import 'package:flutter/material.dart';

class BottomSheetProvider extends ChangeNotifier {
  bool _isFavorite = false;
  get isFavorite => _isFavorite;
  bool _isDetail = false;
  get isDetail => _isDetail;
  String _title = "";
  get title => _title;
  String _des = "";
  get des => _des;

  void getTitle(String newTitle) {
    _title = newTitle;
    notifyListeners();
  }

  void getDes(String newDes) {
    _des = newDes;
  }

  void onToggleFavorite() {
    _isFavorite = !_isFavorite;
    notifyListeners();
  }

  void onToggleDetail() {
    _isDetail = !_isDetail;
    notifyListeners();
  }

  void resetData() {
    _isDetail = false;
    _isFavorite = false;
    _title = "";
    _des = "";
    notifyListeners();
  }
}
