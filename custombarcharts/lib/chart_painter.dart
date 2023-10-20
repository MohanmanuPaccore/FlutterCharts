import 'dart:math';

import 'package:custombarcharts/color_constants.dart';
import 'package:flutter/material.dart';

class BarChartPainter extends CustomPainter {
   List<double> data;
   int labelInterval;
   bool isAxisLineVisible=true;
   bool isYAxisLineVisible=true;
   Color xAxisLineColor=Colors.black;
   Color yAxisLineColor=Colors.black;
   double minimumBarWidth=50;
   double barSpacing=10;
   double bottomMargin=30;
  final double xAxisPadding = 0;
  final double yAxisPadding = 20;
  final double leftPadding = 5.0;
  final double rightPadding = 5.0;
  final double topPadding = 10.0;
  final double bottomPadding = 5.0;

    // Controls how often X-axis labels are drawn

  BarChartPainter(this.data, {this.labelInterval = 1});

@override
void paint(Canvas canvas, Size size) {
    final xLabelStyle = TextStyle(color: Colors.black, fontSize: 19); // Adjust font size

  final paint = Paint()
    ..color = ColorConstants.barDefaultColor
    ..style = PaintingStyle.fill;
  final numBars = data.length;
  final barWidth = max(minimumBarWidth, (size.width - barSpacing * (numBars + 1)) / numBars); // Adjusted bar width
  final maxData = data.reduce((value, element) => value > element ? value : element);

  var xLinepaint = Paint()
    ..color = xAxisLineColor ?? ColorConstants.xyaxisLineColor
    ..style = PaintingStyle.fill;

  var yLinePaint = Paint()
    ..color = yAxisLineColor ?? ColorConstants.xyaxisLineColor
    ..style = PaintingStyle.fill;

  // Calculate the Y-coordinate for X-axis labels
  final xLabelY = size.height + 10.0; // Position labels below the X-axis

  // Adjust the X-axis line
  final xAxisStart = Offset(0, size.height - bottomMargin); // Position the X-axis line 50 pixels above the bottom
  final xAxisEnd = Offset(size.width, size.height - bottomMargin); // Position the X-axis line 50 pixels above the bottom

  xLinepaint.strokeWidth = 2.0; // Set the desired width (e.g., 4.0)
  yLinePaint.strokeWidth = 4.0;

  canvas.drawLine(xAxisStart, xAxisEnd, xLinepaint);
  

  for (int i = 0; i < data.length; i++) {
    final barHeight = (data[i] / maxData) * (size.height - xAxisPadding - bottomMargin); // Adjust for the 50 pixels above the bottom
    var left = i * (barWidth + barSpacing);

    // Calculate the position with padding
    final leftWithPadding = left + leftPadding;
    final topWithPadding = size.height - barHeight - topPadding - bottomMargin; // Adjust for the 50 pixels above the bottom
    final rightWithPadding = left + barWidth - rightPadding;
    final bottomWithPadding = size.height - bottomPadding - bottomMargin; // Adjust for the 50 pixels above the bottom

    // Draw the bar with padding
    final rect = Rect.fromPoints(
      Offset(leftWithPadding, topWithPadding),
      Offset(rightWithPadding, bottomWithPadding),
    );

    canvas.drawRect(rect, paint);

    // Calculate X-coordinate for label positioning in the center
    final xLabel = i.toString();
    final xLabelPainter = TextPainter(
      text: TextSpan(text: xLabel, style: xLabelStyle),
      textDirection: TextDirection.ltr,
    );
    xLabelPainter.layout();
    final labelX = left + (barWidth - xLabelPainter.width) / 2;
    xLabelPainter.paint(canvas, Offset(labelX, xLabelY-30));
  }
}

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}