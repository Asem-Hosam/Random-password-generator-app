import 'package:flutter/material.dart';

class SliderField extends StatefulWidget {
  const SliderField({super.key, required this.onChanged});

  final void Function(double) onChanged;

  @override
  State<SliderField> createState() => _SliderFieldState();
}

class _SliderFieldState extends State<SliderField> {
  var _val = 8.0;
  int intVal = 8;
  double radiusNum = 8;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 25, bottom: 5, top: 5),
            child: Text(
              "Password Length",
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
                        const Text(
                          "Current Length",
                          style: TextStyle(
                            color: Color.fromARGB(255, 186, 190, 192),
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          _val.toInt().toString(),
                          style: const TextStyle(
                            color: Color.fromARGB(255, 186, 190, 192),
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 220,
                      child: Slider(
                        min: 8.0,
                        max: 32.0,
                        value: _val,
                        divisions: 10,
                        activeColor: const Color.fromARGB(255, 255, 255, 255),
                        inactiveColor: const Color.fromARGB(255, 62, 62, 62),
                        onChanged: (value) {
                          setState(() {
                            _val = value;
                            widget.onChanged(value);
                          });
                        },
                      ),
                    ),
                    const Text(
                      "32",
                      style: TextStyle(
                        color: Color.fromARGB(255, 186, 190, 192),
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
