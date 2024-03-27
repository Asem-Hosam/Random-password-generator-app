import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:passwordgenerate/Screens/history_screen.dart';
import 'package:passwordgenerate/Screens/start_screen.dart';

class Lobby extends StatefulWidget {
  const Lobby({super.key});

  @override
  State<Lobby> createState() => _LobbyState();
}

class _LobbyState extends State<Lobby> {
  int selectedIndex = 0;

  List<Widget> listWidgets = [
    const StartScreen(),
    const HistoryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: GNav(
              activeColor: Colors.white,
              backgroundColor: Colors.black,
              color: Colors.white,
              tabBackgroundColor: const Color.fromARGB(28, 255, 255, 255),
              onTabChange: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
              padding: const EdgeInsetsDirectional.symmetric(
                vertical: 10,
                horizontal: 50,
              ),
              gap: 1,
              tabs: const [
                GButton(
                  icon: Icons.add_circle,
                  text: 'Generate',
                ),
                GButton(
                  icon: Icons.history,
                  text: 'History',
                ),
              ]),
        ),
      ),
      body: listWidgets.elementAt(selectedIndex),
    );
  }
}
