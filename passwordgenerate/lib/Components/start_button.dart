import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  const StartButton({super.key, required this.onPressed});
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        height: 60,
        margin: const EdgeInsets.only(
          left: 25,
          bottom: 5,
          top: 10,
          right: 25,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 3, 3, 3),
          ),
          onPressed: onPressed,
          child: const Text('Generate Password'),
        ),
      ),
    );
  }
}
