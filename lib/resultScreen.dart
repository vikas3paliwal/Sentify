import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class resultScreen extends StatefulWidget {
  const resultScreen({Key? key}) : super(key: key);

  @override
  State<resultScreen> createState() => _resultScreenState();
}

class _resultScreenState extends State<resultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey.shade900,
        title: Center(
            child:
                Text("Sentify", style: TextStyle(color: Colors.grey.shade200))),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          chartTile("Zomato", "300", 53,
              [Colors.blueAccent, Colors.orangeAccent], LegendPosition.right),
          chartTile("Swiggy", "300", 47,
              [Colors.blueAccent, Colors.orangeAccent], LegendPosition.left),
          chartTile("Uber Eats", "300", 63,
              [Colors.blueAccent, Colors.orangeAccent], LegendPosition.right),
          chartTile("Food Panda", "300", 36,
              [Colors.blueAccent, Colors.orangeAccent], LegendPosition.left),
        ],
      )),
    );
  }

  Widget chartTile(String name, String sampleSize, double positiveNumber,
      List<Color> colorList, LegendPosition lgp) {
    Map<String, double> dataMap = {
      "Positive Tweets": positiveNumber,
      "Negative Tweets": 100 - positiveNumber
    };
    var position = CrossAxisAlignment.end;
    if (lgp == LegendPosition.left) {
      position = CrossAxisAlignment.start;
    }
    ;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.black87,
              boxShadow: [
                const BoxShadow(
                    color: Color.fromARGB(184, 125, 6, 6),
                    offset: const Offset(0, 3.0),
                    blurRadius: 5,
                    spreadRadius: 3)
              ]),
          child: Column(
            crossAxisAlignment: position,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10, top: 10, left: 10),
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 15),
              PieChart(
                dataMap: dataMap,
                animationDuration: Duration(milliseconds: 800),
                chartLegendSpacing: 32,
                chartRadius: MediaQuery.of(context).size.width / 3.2,
                colorList: colorList,
                initialAngleInDegree: 0,
                chartType: ChartType.ring,
                ringStrokeWidth: 25,
                centerText: sampleSize,
                legendOptions: LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: lgp,
                  showLegends: true,
                  // legendShape: _BoxShape.circle,
                  legendTextStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                chartValuesOptions: ChartValuesOptions(
                  showChartValueBackground: true,
                  showChartValues: true,
                  showChartValuesInPercentage: false,
                  showChartValuesOutside: false,
                  decimalPlaces: 1,
                ),
                // gradientList: ---To add gradient colors---
                // emptyColorGradient: ---Empty Color gradient---
              )
            ],
          )),
    );
  }
}
