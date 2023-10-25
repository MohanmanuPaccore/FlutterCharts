import 'dart:math';

import 'package:flutter/material.dart';



import 'package:flutter/material.dart';

class GroupedBarChartPainter extends CustomPainter {
  final List<List<double>> groupData;
  final List<String> groupLabels;
  final double minimumBarWidth = 20;
  final double groupSpacing = 50;
  final double bottomMargin = 30;
  final double xAxisPadding = 0;
  final double yAxisPadding = 20;
  final double leftPadding = 5.0;
  final double rightPadding = 5.0;
  final double topPadding = 10.0;
  final double bottomPadding = 3.0;
  final double xLineStrokeWidth = 2.0;
  final double yLineStrokeWidth = 2.0;

  GroupedBarChartPainter(this.groupData, this.groupLabels);

  @override
  void paint(Canvas canvas, Size size) {
    final xLabelStyle = TextStyle(color: Colors.black, fontSize: 19);
    final numGroups = groupData.length;
    final maxBarsInGroup = groupData.map((group) => group.length).reduce((a, b) => a > b ? a : b);
    debugPrint('maxBarsInGroup -------------------------- : $maxBarsInGroup');
    final totalBarSpacing = groupSpacing * (numGroups - 1);
    debugPrint('totalBarSpacing -------------------------- : $maxBarsInGroup');
    final totalBarWidth = size.width - leftPadding - rightPadding - totalBarSpacing;
    debugPrint('totalBarWidth -------------------------- : $maxBarsInGroup');
    final barWidth = (totalBarWidth / (numGroups * maxBarsInGroup))
        .clamp(minimumBarWidth, double.infinity);
    debugPrint('barWidth -------------------------- : $maxBarsInGroup');
    final maxData = groupData.expand((group) => group).reduce((a, b) => a > b ? a : b);
    debugPrint('maxData -------------------------- : $maxBarsInGroup');
    final xLabelY = size.height + 10.0;
    debugPrint('xLabelY -------------------------- : $maxBarsInGroup');
    final xAxisStart = Offset(leftPadding, size.height - bottomMargin);
    debugPrint('xAxisStart -------------------------- : $maxBarsInGroup');
    final xAxisEnd = Offset(size.width - rightPadding, size.height - bottomMargin);
    debugPrint('xAxisEnd -------------------------- : $maxBarsInGroup');
    final xLinePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    xLinePaint.strokeWidth = xLineStrokeWidth;
    final yLinePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    yLinePaint.strokeWidth = yLineStrokeWidth;
    canvas.drawLine(xAxisStart, xAxisEnd, xLinePaint);
    double currentX = leftPadding;
    for (int groupIndex = 0; groupIndex < numGroups; groupIndex++) {
      final getBarListLength = groupData[groupIndex].length;
      // Calculate the X-coordinate for the group label
      final groupLabel = groupLabels[groupIndex];
      final xLabelPainter = TextPainter(
        text: TextSpan(text: groupLabel, style: xLabelStyle),
        textDirection: TextDirection.ltr,
      );
      xLabelPainter.layout();
      // final labelX = currentX + (barWidth * maxBarsInGroup - xLabelPainter.width) / 2;
      final labelX = currentX + (barWidth * getBarListLength - xLabelPainter.width)/2;
      debugPrint('lableX -------------------------- : $labelX');
      xLabelPainter.paint(canvas, Offset(labelX, xLabelY - 30));

      double maxBarHeight = 0;
      for (int barIndex = 0; barIndex < groupData[groupIndex].length; barIndex++) {
        final barHeight = (groupData[groupIndex][barIndex] / maxData) * (size.height - xAxisPadding - bottomMargin);
        if (barHeight > maxBarHeight) {
          maxBarHeight = barHeight;
        }
        final leftWithPadding = currentX + leftPadding;
        final topWithPadding = size.height - barHeight - topPadding - bottomMargin;
        final rightWithPadding = currentX + barWidth - rightPadding;
        final bottomWithPadding = size.height - bottomPadding - bottomMargin;
        final rect = Rect.fromPoints(
          Offset(leftWithPadding, topWithPadding),
          Offset(rightWithPadding, bottomWithPadding),
        );
        final paint = Paint()..color = Colors.blue;
        canvas.drawRect(rect, paint);
        currentX += barWidth;
      }
      // Adjust currentX to accommodate the widest bar in the group
      currentX += groupSpacing + (barWidth * maxBarsInGroup - barWidth);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
