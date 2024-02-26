import 'package:flutter/material.dart';

class Answers extends StatelessWidget{
  const Answers(this.text, this.onTap, {super.key});

  final String text;
  final void Function() onTap;

  @override
  Widget build(context){
    return
        ElevatedButton(
            onPressed: onTap, 
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              backgroundColor: const Color.fromARGB(255, 66, 26, 144),
              foregroundColor: Colors.white,
            ),
            child: Text(text,textAlign: TextAlign.center,)
        );
  }
}