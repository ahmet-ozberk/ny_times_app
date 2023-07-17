import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ny_times_app/app/ny_times_api/ny_times_api.dart';

final mostPopularProvider = FutureProvider((ref) async {
  final api = NyTimesApi();
  final result = await api.mostPopular(30);
  if (result != null) return result;
  throw Exception('Error');
});

final homeViewProvider = ChangeNotifierProvider((ref) => HomeViewProvider());

class HomeViewProvider extends ChangeNotifier {
  final FocusNode focusNode = FocusNode();
  bool isSearching = false;
  String searchValue = '';

  void changeSearchState() {
    isSearching = !isSearching;
    if (isSearching) {
      focusNode.requestFocus();
    } else {
      focusNode.unfocus();
    }
    notifyListeners();
  }

  void setSearchValue(String value) {
    if (value.length > 2) {
      searchValue = value;
      notifyListeners();
    }else{
      searchValue = '';
      notifyListeners();
    }
  }
}
