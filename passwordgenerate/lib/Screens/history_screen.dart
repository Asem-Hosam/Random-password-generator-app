import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:passwordgenerate/Model/data.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  DBHandler sqlsession = DBHandler();

  Future<List> getData() async {
    List<Map> resposne =
        await sqlsession.readData("SELECT * FROM 'Passwords' ");

    return resposne;
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  double calculateFontSize(String password) {
    return password.length == 32 ? 11 : 13.0;
  }

  double radiusNum = 8;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History Passwords'),
        centerTitle: true,
        elevation: 0,
        bottomOpacity: 0.0,
        backgroundColor: const Color.fromARGB(255, 24, 23, 23),
      ),
      backgroundColor: const Color.fromARGB(255, 25, 24, 24),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, AsyncSnapshot<List> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 5,
                      top: 50,
                    ),
                    child: Image.asset(
                      'assets/emptystate.png',
                      height: 150,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Nothing Here!".toUpperCase(),
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 236, 236, 236),
                          height: 1),
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: Text(
                      "You have to create a password first, and to make it secure, use additional settings!"
                          .toUpperCase(),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 121, 121, 121),
                        height: 1.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(top: 25),
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 3, 3, 3),
                            borderRadius: BorderRadius.circular(radiusNum),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  snapshot.data![index]['password'],
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 186, 190, 192),
                                    fontSize: calculateFontSize(
                                        snapshot.data![index]['password']),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onPressed: () {
                                        setState(() {
                                          sqlsession.deleteData(
                                            'DELETE FROM Passwords WHERE id = ${snapshot.data![index]['id']}',
                                          );
                                          ScaffoldMessenger.of(context)
                                            ..removeCurrentSnackBar()
                                            ..showSnackBar(
                                              const SnackBar(
                                                content:
                                                    Text('Password Deleted'),
                                              ),
                                            );
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.highlight_remove_sharp,
                                        color: Color.fromARGB(255, 70, 94, 106),
                                      ),
                                    ),
                                    IconButton(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onPressed: () {
                                        final data = ClipboardData(
                                          text: snapshot.data![index]
                                              ['password'],
                                        );
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
                                        color:
                                            Color.fromARGB(255, 186, 190, 192),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
