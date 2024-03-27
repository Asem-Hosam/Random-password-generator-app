import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:passwordgenerate/Components/settings_field.dart';
import 'package:passwordgenerate/Components/slider_field.dart';
import 'package:passwordgenerate/Components/start_button.dart';
import 'package:passwordgenerate/Model/data.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  double lengthVal = 8;

  bool hasNumbersOut = false;
  bool hasSpecialOut = false;
  bool hasUpperCaseOut = true;
  bool hasLowerCaseOut = true;

  void handleSliderChanges(List<bool> sliderValues) {
    hasUpperCaseOut = sliderValues[0];
    hasLowerCaseOut = sliderValues[1];
    hasNumbersOut = sliderValues[2];
    hasSpecialOut = sliderValues[3];

    // // Print or perform actions based on the slider values
    // print(
    //     'Uppercase: $hasUpperCaseOut, Lowercase: $hasLowerCaseOut, Numbers: $hasNumbersOut, Special: $hasSpecialOut');
  }

  void lenghtInt(val) {
    lengthVal = val;
  }

  String generateRandomPassword() {
    bool hasNumbers = hasNumbersOut;
    bool hasSpecial = hasSpecialOut;
    bool hasUpperCase = hasUpperCaseOut;
    bool hasLowerCase = hasLowerCaseOut;

    final length = lengthVal.toInt();
    const upperChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const lowerChars = 'abcdefghijklmnopqrstuvwxyz';
    const numberChars = '0123456789';
    const specialChars = '!@#%^&*()-_=+\$[]{}|;:,.<>?';

    String chars = '';

    if (hasUpperCase) {
      chars += upperChars; // Include uppercase letters
    }

    if (hasLowerCase) {
      chars += lowerChars; // Include lowercase letters
    }

    if (hasNumbers) {
      chars += numberChars; // Include numbers
    }

    if (hasSpecial) {
      chars += specialChars; // Include special characters
    }

    if (chars.isEmpty) {
      return 'YOU MUST MAKE SETTINGS FIRST';
    }
    return List.generate(length, (index) {
      final indexRandom = Random().nextInt(chars.length);
      return chars[indexRandom];
    }).join('');
  }

  String passValue = '';

  DBHandler sqlsession = DBHandler();

  void updateUi() async {
    setState(() {
      passValue = generateRandomPassword();
    });

    if (passValue.contains('YOU MUST MAKE SETTINGS FIRST')) {
      return;
    } else {
      await sqlsession
          .insertData("INSERT INTO Passwords (password) VALUES ('$passValue')");
    }
  }

  @override
  Widget build(BuildContext context) {
    double radiusNum = 8;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate Password'),
        centerTitle: true,
        elevation: 0,
        bottomOpacity: 0.0,
        backgroundColor: const Color.fromARGB(255, 24, 23, 23),
      ),
      backgroundColor: const Color.fromARGB(255, 25, 24, 24),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 25, bottom: 5, top: 20),
                      child: Text(
                        "Generated Password",
                        style: TextStyle(
                          color: Color.fromARGB(255, 245, 245, 245),
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        margin: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: 20,
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 3, 3, 3),
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
                              Text(
                                passValue,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 186, 190, 192),
                                  fontSize: 13,
                                ),
                              ),
                              IconButton(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors
                                      .transparent, // Remove highlight color
                                  onPressed: () {
                                    final data = ClipboardData(text: passValue);
                                    Clipboard.setData(data);
                                    ScaffoldMessenger.of(context)
                                      ..removeCurrentSnackBar()
                                      ..showSnackBar(
                                        const SnackBar(
                                          content: Text('Password Copied'),
                                        ),
                                      );
                                  },
                                  icon: const Icon(
                                    Icons.copy,
                                    color: Color.fromARGB(255, 186, 190, 192),
                                  ))
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              SliderField(
                onChanged: lenghtInt,
              ),
              SettingsFeild(
                onChanged: handleSliderChanges,
              ),
              StartButton(onPressed: updateUi),
            ],
          )
        ],
      ),
    );
  }
}
