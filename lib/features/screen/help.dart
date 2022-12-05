import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/features/controller/root_controller.dart';
import 'package:weatherapp/features/widgets/custom_buttom.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 5), () {
      Navigator.pushNamed(context, "homePage");
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/frame.png",
            height: size.height,
            fit: BoxFit.fill,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "We show weather for you",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              CustomButton(
                  onPressed: () =>
                      Provider.of<RootController>(context, listen: false)
                          .handleSkip())
            ],
          )
        ],
      ),
    );
  }
}
