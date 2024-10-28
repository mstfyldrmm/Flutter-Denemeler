import 'dart:convert';
import 'package:firebase/news_turkish/model/doviz.dart';
import 'package:firebase/news_turkish/model/newsModel.dart';
import 'package:firebase/news_turkish/model/result.dart';
import 'package:http/http.dart' as http;

class NewsServices {
  Future<List<Results>> getDatas(String category) async {
    final String url =
        'https://newsdata.io/api/1/latest?country=tr&category=$category&apikey=pub_5615643768d3fd940b2b9159932ff29d46731';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final result = json.decode(utf8.decode(response.bodyBytes));
      NewsModel model = NewsModel.fromJson(result);

      return model.results ?? [];
    }

    throw Exception('Bad request');
  }
}

class DovizServices {
  Future<List<Doviz>> getMoneys() async {
    final String url = 'https://api.collectapi.com/economy/allCurrency';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'authorization': 'apikey 1KUEJwRveqrc0uJ454Q6tc:3u05GxH7IMDAEuiMUMYKnQ',
        'content-type': 'application/json',
      },
    );

    if(response.statusCode == 200) {
      List<dynamic> responseData = jsonDecode(response.body)["result"];
      List<Doviz> datas = responseData.map((e) => Doviz.fromJson(e)).toList();

      return datas;
    }else {
      throw Exception(
          "Failed to load todos. Status code: ${response.statusCode}");
    }
  }
}
