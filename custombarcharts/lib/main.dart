import 'dart:math';

import 'package:custombarcharts/chart_painter.dart';
import 'package:custombarcharts/test_barchart/screen/group_bar_painter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: JavaScriptExecutionPage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//               resizeToAvoidBottomInset: true,

//       appBar: AppBar(
//         title: Text('Bottom Sheet with TextField and Minimum Height'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             showModalBottomSheet(
//               constraints: BoxConstraints(minHeight: 300,maxHeight: MediaQuery.of(context).size.height),

//               context: context,
//               isScrollControlled: true,

//               builder: (BuildContext context) {
//                 return Container(
//                   child: SingleChildScrollView(
//                     child: Column(
//                       children: <Widget>[
//                         ListTile(
//                           title: Text('Item 1'),
//                         ),
//                         ListTile(
//                           title: Text('Item 2'),
//                         ),
//                         ListTile(
//                           title: Text('Item 3'),
//                         ),
//                         SizedBox(
//                           height: 50,
//                           child: Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: TextField(
//                               decoration: InputDecoration(labelText: 'Enter Text'),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//              // keyboardDismissBehavior: DragScrollBehavior(),
//             );
//           },
//           child: Text('Show Bottom Sheet with TextField'),
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: ChartPage(),
//   ));
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Bar Chart'),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 17, vertical: 17),
          child: CustomBarChart(),
        ),
      ),
    );
  }
}

class CustomBarChart extends StatelessWidget {
  //final List<double> data = [100.0, 150.0, 200.0, 50.0, 220.0, 320.0, 500.0, 1000.0, 100, 500, 200, 300, 400, 700, 600];
  final List<double> data =
      List.generate(50, (index) => Random().nextDouble() * 1000);

  double barwidth = 100;

  //Group of bars
  List<List<double>> groupData = [
    [20.0, 30.0, 40.0, 50.0, 50.0, 70.0],
    [10.0, 25.0, 35.0, 50, 70],
    [15.0, 35.0, 45.0, 10],
    [15.0, 35.0, 45.0, 20],
    [15.0, 35.0],
    [15.0],
    [15.0, 35.0, 45.0],
    [15.0, 35.0, 45.0],
  ]; // Category B

  List<String> labels = [
    'Group A',
    'Group B',
    'Group C',
    'Group D',
    'Group E',
    'Group F',
    'Group G',
    'Group H'
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final chartWidth = max(60.0 * data.length,
            constraints.maxWidth); // Ensure a minimum bar width of 50
        final chartHeight = constraints.maxHeight;

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          //Single bar Items
          // child: CustomPaint(
          //   size: Size(chartWidth, chartHeight),
          //   painter: BarChartPainter(data),
          // ),
          child: CustomPaint(
            size: Size(barwidth * 10 + groupData.length * 100, chartHeight),
            painter: GroupedBarChartPainter(groupData, labels),
          ),
        );
      },
    );
  }
}

// class BarChartPainter extends CustomPainter {
//   final List<double> data;

//   BarChartPainter(this.data);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.blue
//       ..style = PaintingStyle.fill;
//     final barSpacing = 10.0;
//     final numBars = data.length;
//     final minimumBarWidth = 50.0; // Minimum width for each bar
//     final barWidth = max(minimumBarWidth, (size.width - barSpacing * (numBars + 1)) / numBars); // Adjusted bar width
//     final maxData = data.reduce((value, element) => value > element ? value : element);

//     final double xAxisPadding = 20;
//     final double yAxisPadding = 20;

//     // Draw X and Y axes
//     final xAxisStart = Offset(0, size.height);
//     final xAxisEnd = Offset(size.width, size.height);
//     final yAxisStart = Offset(0, 0);
//     final yAxisEnd = Offset(0, size.height);

//     canvas.drawLine(xAxisStart, xAxisEnd, paint);
//     canvas.drawLine(yAxisStart, yAxisEnd, paint);

//     // Add labels to the X and Y axes
//     final yLabelStyle = TextStyle(color: Colors.black, fontSize: 12);
//     final xLabelStyle = TextStyle(color: Colors.black, fontSize: 12);

//     for (int i = 0; i < data.length; i++) {
//       final barHeight = (data[i] / maxData) * (size.height - xAxisPadding);
//       var left = i * (barWidth + barSpacing);
//       // if(i==data.length-1){
//       //                  left = i * (barWidth + barSpacing) ;

//       // }else{
//       //  left = i * (barWidth + barSpacing) + barSpacing;

//       // }

//       final top = size.height - barHeight;

//       final rect = Rect.fromPoints(
//         Offset(left, top),
//         Offset(left + barWidth, size.height),
//       );

//       canvas.drawRect(rect, paint);

//       // Add X-axis labels
//       final xLabel = i.toString();
//       final xLabelPainter = TextPainter(
//         text: TextSpan(text: xLabel, style: xLabelStyle),
//         textDirection: TextDirection.ltr,
//       );
//       xLabelPainter.layout();
//       xLabelPainter.paint(canvas, Offset(left + (barWidth - xLabelPainter.width) / 2, size.height));

//   }
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
