import 'package:flutter_test/flutter_test.dart';
import 'package:weatherapp/data/entities/weather.dart';
import 'package:weatherapp/services/weather_service.dart';

void main() {
  group("getResponse", () {
    test("return data when http response is successfull", () async {
      String position = "48.8567,2.350";
      // //create Sample response of HTTP Call

      //check successfull result achieve
      expect(await WeatherService().getReponse(position), isA<Weather>());
    });
  });
}
