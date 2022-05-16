import "package:flutter/material.dart";
import "searchScreen.dart";

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.black,
            child: Stack(
              children: [
                Positioned.fill(
                    child: Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    'assets/opener.jpg',
                    fit: BoxFit.cover,
                  ),
                )),
                Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      const Text("WELCOME",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.grey,
                          )),
                      const SizedBox(height: 30),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => searchScreen()));
                        },
                        child: Container(
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Get Started",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white)),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.blue,
                          ),
                        ),
                      )
                    ]))
              ],
            )));
  }
}
