import 'dart:math';

import 'package:flutter/material.dart';



import 'package:flutter/material.dart';

class GroupedBarChartPainter extends CustomPainter {
  final List<List<double>> groupData;
  final List<String> groupLabels;
  final double minimumBarWidth = 20;
  final double groupSpacing = 10;
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
    final totalBarSpacing = groupSpacing * (numGroups - 1);
    final totalBarWidth = size.width - leftPadding - rightPadding - totalBarSpacing;
    final barWidth = (totalBarWidth / (numGroups * maxBarsInGroup))
        .clamp(minimumBarWidth, double.infinity);
    final maxData = groupData.expand((group) => group).reduce((a, b) => a > b ? a : b);
    final xLabelY = size.height + 10.0;
    final xAxisStart = Offset(leftPadding, size.height - bottomMargin);
    final xAxisEnd = Offset(size.width - rightPadding, size.height - bottomMargin);
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
      // Calculate the X-coordinate for the group label
      final groupLabel = groupLabels[groupIndex];
      final xLabelPainter = TextPainter(
        text: TextSpan(text: groupLabel, style: xLabelStyle),
        textDirection: TextDirection.ltr,
      );
      xLabelPainter.layout();
      final labelX = currentX + (barWidth * maxBarsInGroup - xLabelPainter.width) / 2;
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
