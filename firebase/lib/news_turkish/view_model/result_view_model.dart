import 'package:firebase/news_turkish/model/result.dart';


class ResultViewModel {
  List<Results> results;
  String category;

  ResultViewModel(this.category, this.results);
}