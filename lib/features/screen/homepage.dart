import 'package:flutter/material.dart';
import 'package:weatherapp/core/user_share_preference.dart';
import 'package:weatherapp/data/entities/weather.dart';
import 'package:weatherapp/features/widgets/custom_buttom.dart';
import 'package:weatherapp/services/weather_service.dart';
import 'package:weatherapp/utils/helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();

  String labelText = "Save";
  String query = "";

  @override
  void initState() {
    super.initState();
    toggleLabel();
    getLocation();
  }

  void toggleLabel() async {
    final location = await UserSharePreference.getLocation();
    _controller.text = location;
    if (_controller.text.isNotEmpty) {
      labelText = "Update";
    }
    setState(() {});
  }

  void getLocation() async {
    final position = await getCurrentLocation();
    if (_controller.text.isEmpty) {
      query = position;
    } else {
      query = _controller.text;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          Center(
            child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "helpPage");
                },
                child: const Text("Help")),
          )
        ],
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
          ),
          CustomButton(
            onPressed: () async {
              await UserSharePreference.setLocation(_controller.text);
              getLocation();
            },
            label: labelText,
          ),
          const SizedBox(
            height: 10,
          ),
          fetchWeather()
        ],
      ),
    );
  }

  Widget fetchWeather() {
    return FutureBuilder(
      future: WeatherService().getReponse(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasData) {
          Weather weather = snapshot.data;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text("Temperature:"),
                    Text("${weather.temp} C")
                  ],
                ),
                Text(
                  weather.condition.text,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.red),
                ),
                Image.network(weather.condition.icon)
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
