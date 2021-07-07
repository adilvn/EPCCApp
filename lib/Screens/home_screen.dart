import 'dart:math';

import 'package:epcc/Models/constants.dart';
import 'package:epcc/Screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentIndex = 0;

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {

    late List<ChartData> _chartData;

    final List<ChartData> chartData = [
      ChartData('David', 25, Color.fromRGBO(9,0,136,1)),
      ChartData('Steve', 38, Color.fromRGBO(147,0,119,1)),
      ChartData('Jack', 34, Color.fromRGBO(228,0,124,1)),
      ChartData('Others', 52, Color.fromRGBO(255,189,57,1))
  ];

    void initState() {
      _chartData = getChartData();
      super.initState();
    }
    
    return Scaffold(
      appBar: AppBar(
        
        automaticallyImplyLeading: false,
        leading: Image.asset('assets/images/appbar_logo.png',
          height: 30.0,
          fit: BoxFit.fitWidth,
        ),
        leadingWidth: 200,
        title: Image.asset(
                    'assets/images/ifl_logo_small.png',
                    fit: BoxFit.cover,
                    height: 45.0,
                  ),
              centerTitle: true,
        actions: <Widget> [
          Transform.rotate(
            angle: 180 * pi/180,
            child: IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(), 
              icon: Icon(Icons.sort)
            ),
          )
        ]
      ),
      body: Center(
        child: Container(
          child: SfCircularChart(
            legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
            series: <CircularSeries>[
              DoughnutSeries <ChartData, String>(
                dataSource: chartData,
                pointColorMapper: (ChartData data, _) => data.color,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                dataLabelSettings: DataLabelSettings(isVisible: true, )
              )
            ],
          ),
          ),
      ),
    );
  }
}

List<ChartData> getChartData() {
  final List<ChartData> chartData = [
      ChartData('David', 25, Color.fromRGBO(9,0,136,1)),
      ChartData('Steve', 38, Color.fromRGBO(147,0,119,1)),
      ChartData('Jack', 34, Color.fromRGBO(228,0,124,1)),
      ChartData('Others', 52, Color.fromRGBO(255,189,57,1))
  ];
  return chartData;
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
    final String x;
    final double y;
    final Color? color;
}
