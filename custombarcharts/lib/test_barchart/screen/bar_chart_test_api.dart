import 'package:custombarcharts/test_barchart/screen/test_screens.dart/bar_chart_test1.dart';
import 'package:custombarcharts/test_barchart/screen/test_screens.dart/bar_chart_test2.dart';
import 'package:custombarcharts/test_barchart/screen/test_screens.dart/group_barchart_test.dart';
import 'package:flutter/material.dart';

class BarchartTestApi extends StatefulWidget {
  const BarchartTestApi({super.key});

  @override
  State<BarchartTestApi> createState() => _BarchartTestApiState();
}

class _BarchartTestApiState extends State<BarchartTestApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            button('Bar Chart 1', () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BarChartTest1()));
            }),
            SizedBox(
              height: 30,
            ),
            button('Group Bar Chart', () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GroupBarChartTest()));
            }),
            SizedBox(
              height: 30,
            ),
            button('Bar Chart 2', () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BarChartTest2()));
            }),
          ],
        ),
      )),
    );
  }

  Widget button(String buttonText, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: Colors.blue,
        padding: EdgeInsets.all(12),
        child: Text(
          buttonText,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
