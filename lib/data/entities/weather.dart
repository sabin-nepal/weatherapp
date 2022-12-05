import 'package:weatherapp/utils/helper.dart';

class Weather {
  final double temp;
  final Condition condition;

  Weather({required this.temp, required this.condition});

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
      temp: json['temp_c'], condition: Condition.fromJson(json['condition']));
}

class Condition {
  final String text;
  final String icon;

  Condition({required this.icon, required this.text});

  factory Condition.fromJson(Map<String, dynamic> json) =>
      Condition(icon: stringToUrl(json['icon']), text: json['text']);
}
