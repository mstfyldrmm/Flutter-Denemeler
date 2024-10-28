class Doviz {
  String? name;
  String? code;
  double? buying;
  String? buyingstr;
  double? selling;
  String? sellingstr;
  String? time;
  String? date;
  String? datetime;
  int? calculated;

  Doviz(
      {this.name,
      this.code,
      this.buying,
      this.buyingstr,
      this.selling,
      this.sellingstr,
      this.time,
      this.date,
      this.datetime,
      this.calculated});

  Doviz.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
    buying = json['buying'];
    buyingstr = json['buyingstr'];
    selling = json['selling'];
    sellingstr = json['sellingstr'];
    time = json['time'];
    date = json['date'];
    datetime = json['datetime'];
    calculated = json['calculated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['code'] = this.code;
    data['buying'] = this.buying;
    data['buyingstr'] = this.buyingstr;
    data['selling'] = this.selling;
    data['sellingstr'] = this.sellingstr;
    data['time'] = this.time;
    data['date'] = this.date;
    data['datetime'] = this.datetime;
    data['calculated'] = calculated;
    return data;
  }
}