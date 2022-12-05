import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{
  final Function() onPressed;
  final String label;
  const CustomButton({super.key,required this.onPressed,this.label = "Skip"});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text(label) );
  }

}