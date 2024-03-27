import 'package:flutter/material.dart';

class SettingContiner extends StatelessWidget {
  const SettingContiner({
    super.key,
    required this.onChanged,
    required this.caseName,
    required this.caseValue,
  });
  final String caseName;
  final void Function(bool) onChanged;
  final bool caseValue;

  @override
  Widget build(BuildContext context) {
    double radiusNum = 8;

    return Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 10,
        ),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 0, 0, 0),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radiusNum),
            topRight: Radius.circular(radiusNum),
            bottomLeft: Radius.circular(radiusNum),
            bottomRight: Radius.circular(radiusNum),
          ), // Adjust the value to set the radius
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 15,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    caseName,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 186, 190, 192),
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Switch(
                value: caseValue,
                activeColor: const Color.fromARGB(255, 255, 255, 255),
                activeTrackColor: const Color.fromARGB(255, 79, 79, 79),
                inactiveTrackColor: const Color.fromARGB(221, 26, 24, 24),
                inactiveThumbColor: const Color.fromARGB(221, 26, 24, 24),
                onChanged: onChanged,
              ),
            ],
          ),
        ));
  }
}
