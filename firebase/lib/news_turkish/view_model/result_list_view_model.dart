import 'package:firebase/news_turkish/service/services.dart';
import 'package:firebase/news_turkish/view_model/result_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ResultListViewModel with ChangeNotifier{
  ResultViewModel viewModel = ResultViewModel('top', []);
  Status status = Status.initial;

  ResultListViewModel() {
    getNews('top');
  }

  Future<void> getNews(String category) async {
    status = Status.loading;
    notifyListeners();
    viewModel.results = await NewsServices().getDatas(category);
    status = Status.loaded;
    notifyListeners();
  }
}

enum Status {
  initial,
  loading,
  loaded
}

class  UserProvider with ChangeNotifier {
  User? _user;

  User? get user => _user;

  // Kullanıcıyı ayarla
  void setUser(User? user) {
    _user = user;
    notifyListeners();
  }
}