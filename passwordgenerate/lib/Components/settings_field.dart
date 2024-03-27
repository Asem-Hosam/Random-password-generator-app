import 'package:flutter/material.dart';
import 'package:passwordgenerate/Components/setting_continer.dart';

class SettingsFeild extends StatefulWidget {
  const SettingsFeild({super.key, required this.onChanged});

  final void Function(List<bool>) onChanged;

  @override
  State<SettingsFeild> createState() => _SettingsFeildState();
}

class _SettingsFeildState extends State<SettingsFeild> {
  bool upperCase = false;

  List<Map<String, bool>> listOfMaps = [
    {
      'Value': upperCase,
      'Name': 'Uppercase - ABCD',
    },
    {
      'Value': false,
      'Name': 'Lowercase - abcd',
    },
    {
      'Value': true,
      'Name': 'Numbers - 123',
    },
    {
      'Value': true,
      'Name': 'Special - &@#!',
    },
  ];

  void HandleMiner(bool val) {}

  // void onChangedHandler(bool val, List<Map<String, dynamic>> listOfMaps ) {
  //   setState(() {

  //    if()

  //     widget.onChanged([upperCase, lowerCase, numberChars, specialChars]);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 25, bottom: 5, top: 20),
            child: Text(
              "Settings",
              style: TextStyle(
                color: Color.fromARGB(255, 245, 245, 245),
                fontSize: 18,
              ),
            ),
          ),
          // ...listOfMaps.map((element) {
          //   String name = element['Name'];

          //   return SettingContiner(
          //       caseName: element['Name'],
          //       caseValue: element['Value'],
          //       onChanged: HandleMiner);
          // })
        ],
      ),
    );
  }
}


  // Container(
  //             padding: const EdgeInsets.symmetric(
  //               vertical: 10,
  //             ),
  //             margin: const EdgeInsets.only(
  //               left: 20,
  //               right: 20,
  //               bottom: 10,
  //             ),
  //             decoration: BoxDecoration(
  //               color: const Color.fromARGB(255, 0, 0, 0),
  //               borderRadius: BorderRadius.only(
  //                 topLeft: Radius.circular(radiusNum),
  //                 topRight: Radius.circular(radiusNum),
  //                 bottomLeft: Radius.circular(radiusNum),
  //                 bottomRight: Radius.circular(radiusNum),
  //               ), // Adjust the value to set the radius
  //             ),
  //             child: Padding(
  //               padding: const EdgeInsets.only(
  //                 left: 20,
  //                 right: 15,
  //               ),
  //               child: Row(
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   const Column(
  //                     children: [
  //                       Text(
  //                         "Lowercase - abc",
  //                         style: TextStyle(
  //                           color: Color.fromARGB(255, 186, 190, 192),
  //                           fontSize: 15,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   Switch(
  //                       activeColor: const Color.fromARGB(255, 255, 255, 255),
  //                       activeTrackColor: const Color.fromARGB(255, 79, 79, 79),
  //                       inactiveTrackColor:
  //                           const Color.fromARGB(221, 26, 24, 24),
  //                       inactiveThumbColor:
  //                           const Color.fromARGB(221, 26, 24, 24),
  //                       value: lowerCase,
  //                       onChanged: (val) => {
  //                             setState(
  //                               () {
  //                                 lowerCase = val;
  //                                 widget.onChanged([
  //                                   upperCase,
  //                                   lowerCase,
  //                                   numberChars,
  //                                   specialChars
  //                                 ]);
  //                               },
  //                             )
  //                           })
  //                 ],
  //               ),
  //             )),
  //         // ------------------------------------------------------

  //         Container(
  //             padding: const EdgeInsets.symmetric(
  //               vertical: 10,
  //             ),
  //             margin: const EdgeInsets.only(
  //               left: 20,
  //               right: 20,
  //               bottom: 10,
  //             ),
  //             decoration: BoxDecoration(
  //               color: const Color.fromARGB(255, 0, 0, 0),
  //               borderRadius: BorderRadius.only(
  //                 topLeft: Radius.circular(radiusNum),
  //                 topRight: Radius.circular(radiusNum),
  //                 bottomLeft: Radius.circular(radiusNum),
  //                 bottomRight: Radius.circular(radiusNum),
  //               ), // Adjust the value to set the radius
  //             ),
  //             child: Padding(
  //               padding: const EdgeInsets.only(
  //                 left: 20,
  //                 right: 15,
  //               ),
  //               child: Row(
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   const Column(
  //                     children: [
  //                       Text(
  //                         "Numbers - 123",
  //                         style: TextStyle(
  //                           color: Color.fromARGB(255, 186, 190, 192),
  //                           fontSize: 15,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   Switch(
  //                       activeColor: const Color.fromARGB(255, 255, 255, 255),
  //                       activeTrackColor: const Color.fromARGB(255, 79, 79, 79),
  //                       inactiveTrackColor:
  //                           const Color.fromARGB(221, 26, 24, 24),
  //                       inactiveThumbColor:
  //                           const Color.fromARGB(221, 26, 24, 24),
  //                       value: numberChars,
  //                       onChanged: (val) => {
  //                             setState(
  //                               () {
  //                                 numberChars = val;
  //                                 widget.onChanged([
  //                                   upperCase,
  //                                   lowerCase,
  //                                   numberChars,
  //                                   specialChars
  //                                 ]);
  //                               },
  //                             )
  //                           })
  //                 ],
  //               ),
  //             )),
  //         // ------------------------------------------------------

  //         Container(
  //             padding: const EdgeInsets.symmetric(
  //               vertical: 10,
  //             ),
  //             margin: const EdgeInsets.only(
  //               left: 20,
  //               right: 20,
  //               bottom: 10,
  //             ),
  //             decoration: BoxDecoration(
  //               color: const Color.fromARGB(255, 0, 0, 0),
  //               borderRadius: BorderRadius.only(
  //                 topLeft: Radius.circular(radiusNum),
  //                 topRight: Radius.circular(radiusNum),
  //                 bottomLeft: Radius.circular(radiusNum),
  //                 bottomRight: Radius.circular(radiusNum),
  //               ), // Adjust the value to set the radius
  //             ),
  //             child: Padding(
  //               padding: const EdgeInsets.only(
  //                 left: 20,
  //                 right: 15,
  //               ),
  //               child: Row(
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   const Column(
  //                     children: [
  //                       Text(
  //                         "Special - &@#!",
  //                         style: TextStyle(
  //                           color: Color.fromARGB(255, 186, 190, 192),
  //                           fontSize: 15,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   Switch(
  //                       activeColor: const Color.fromARGB(255, 255, 255, 255),
  //                       activeTrackColor: const Color.fromARGB(255, 79, 79, 79),
  //                       inactiveTrackColor:
  //                           const Color.fromARGB(221, 26, 24, 24),
  //                       inactiveThumbColor:
  //                           const Color.fromARGB(221, 26, 24, 24),
  //                       value: specialChars,
  //                       onChanged: (val) => {
  //                             setState(
  //                               () {
  //                                 specialChars = val;
  //                                 widget.onChanged([
  //                                   upperCase,
  //                                   lowerCase,
  //                                   numberChars,
  //                                   specialChars
  //                                 ]);
  //                               },
  //                             )
  //                           })
  //                 ],
  //               ),
  //             )),