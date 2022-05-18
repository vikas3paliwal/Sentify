import 'package:flutter/material.dart';
import 'package:market_sentiment/airline_resultScreen.dart';
import 'package:market_sentiment/bankresultScreen.dart';
import 'package:market_sentiment/smartphoone_resultScreen.dart';
import 'resultScreen.dart';

class searchScreen extends StatefulWidget {
  const searchScreen({Key? key}) : super(key: key);

  @override
  State<searchScreen> createState() => _searchScreenState();
}

class _searchScreenState extends State<searchScreen> {
  List<choice> choices = const <choice>[
    const choice("Online food Services", Icons.local_restaurant),
    const choice("Airlines", Icons.airplane_ticket_outlined),
    const choice("Smart Phones", Icons.mobile_screen_share),
    const choice("Banking Services", Icons.money),
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return WillPopScope(
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.grey.shade900,
              title: Center(
                  child: Text("Sentify",
                      style: TextStyle(color: Colors.grey.shade200))),
            ),
            body: SingleChildScrollView(
              child: Column(children: [
                Container(
                    height: MediaQuery.of(context).size.height / 2,
                    child: LayoutBuilder(
                      builder: (context, constraints) =>
                          const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Image(
                            image: AssetImage('assets/flyer.jpg'),
                            fit: BoxFit.cover),
                      ),
                    )),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      const BoxShadow(
                          color: Colors.black12,
                          offset: const Offset(0, 5.0),
                          blurRadius: 5,
                          spreadRadius: 0)
                    ],
                  ),
                  child: Column(children: [
                    const SizedBox(height: 5),
                    Padding(
                      padding: EdgeInsets.only(top: 0, left: 8, bottom: 20),
                      child: Text('Compare famous market genres',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 30,
                          )),
                    )
                  ]),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 3,
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 10,
                      //childAspectRatio: width / (height / 4)),
                      children: List.generate(choices.length, (index) {
                        return Card(choices[index]);
                      }),
                      childAspectRatio: width / (height / 8),
                    ),
                  ),
                )
              ]),
            )),
        onWillPop: () async => false);
  }

  Widget Card(choice Choice) {
    return InkWell(
      onTap: () {
        print(Choice.title);
        if (Choice.title == "Online food Services") {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => resultScreen()));
        } else if (Choice.title == "Airlines") {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AirlineresultScreen()));
        } else if (Choice.title == "Smart Phones") {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SmartPhoneresultScreen()));
        } else if (Choice.title == "Banking Services") {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => BankresultScreen()));
        }
      },
      child: Container(
          height: 20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.blue),
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Icon(Choice.icon, color: Colors.white),
            ),
            SizedBox(width: 10),
            Text(Choice.title,
                style: TextStyle(fontSize: 15, color: Colors.white)),
          ])),
    );
  }
}

class choice {
  const choice(this.title, this.icon);
  final String title;
  final IconData icon;
}
