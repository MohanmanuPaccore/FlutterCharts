import 'dart:math';

import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<Bar> bars;
  final double maxValue;

  BarChart({super.key, required this.bars})
      : maxValue = bars.map((bar) => bar.value).reduce((a, b) => a > b ? a : b);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (p0, constraints) {
      final chartWidth = max(60.0 * (bars.length),
          constraints.maxWidth); // Ensure a minimum bar width of 50
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Container(
          // color: Colors.yellow,
          padding: const EdgeInsets.only(right: 20),
          child: CustomPaint(
            size: Size(chartWidth, 400), // Adjust the size as needed
            painter: BarChartPainterThree(bars, maxValue),
          ),
        ),
      );
    });
  }
}

class Bar {
  final String label;
  final double value;

  Bar({required this.label, required this.value});
}

class BarChartPainterThree extends CustomPainter {
  final List<Bar> bars;
  final double maxValue;
  final double xLabelPadding = 100;
  final double yLabelPadding = 40;
  final double axisWidth = 2;

  BarChartPainterThree(this.bars, this.maxValue);

  @override
  void paint(Canvas canvas, Size size) {
    final barWidth = (size.width - xLabelPadding) / bars.length;
    const barSpacing = 10;
    const topMargin = 20;
    const bottomMargin = 30;

    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    // Draw X and Y axes
    canvas.drawLine(
        Offset(yLabelPadding, size.height - bottomMargin),
        Offset(size.width + 20, size.height - bottomMargin),
        Paint()
          ..color = Colors.black
          ..strokeWidth = axisWidth);

    canvas.drawLine(
        Offset(yLabelPadding, size.height - bottomMargin),
        Offset(yLabelPadding, topMargin.toDouble()),
        Paint()
          ..color = Colors.black
          ..strokeWidth = axisWidth);

    // Draw X-axis labels
    for (int i = 0; i < bars.length; i++) {
      final bar = bars[i];
      final left = yLabelPadding + i * (barWidth + barSpacing) + barWidth / 2;
      TextPainter(
        text: TextSpan(
          text: bar.label,
          style: const TextStyle(fontSize: 12, color: Colors.black),
        ),
        textDirection: TextDirection.ltr,
      )
        ..layout()
        ..paint(canvas, Offset(left, size.height - 20));
    }

    // Draw Y-axis labels
    for (int i = 0; i <= 5; i++) {
      final value = (maxValue / 5) * i;
      final y = size.height -
          bottomMargin -
          (value / maxValue) * (size.height - topMargin - bottomMargin);
      TextPainter(
        textAlign: TextAlign.end,
        text: TextSpan(
          text: value.toStringAsFixed(1),
          style: const TextStyle(fontSize: 12, color: Colors.black),
        ),
        textDirection: TextDirection.rtl,
      )
        ..layout()
        ..paint(canvas, Offset(0, y - 10));
    }

    // Draw bars
    for (int i = 0; i < bars.length; i++) {
      final bar = bars[i];
      final barHeight =
          (bar.value / maxValue) * (size.height - topMargin - bottomMargin);
      final left = yLabelPadding + i * (barWidth + barSpacing);
      final top = size.height - barHeight - bottomMargin;

      canvas.drawRect(
        Rect.fromPoints(
          Offset(left + barSpacing, top),
          Offset(left + barWidth, size.height - bottomMargin),
        ),
        paint,
      );
    }

    // Calculate the average of X-axis values
    double averageX =
        bars.map((bar) => bar.value).reduce((a, b) => a + b) / bars.length;

    // Draw a horizontal dotted line at the average X position
    double averageXPosition =
        yLabelPadding + ((averageX) / maxValue) * (size.width - xLabelPadding);
    final dashedLinePaint = Paint()
      ..color = Colors.black // Adjust line color as needed
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2 // Adjust line width as needed
      ..strokeCap = StrokeCap.round;

    const dashWidth = 5; // Adjust the width of the dashes
    const dashSpace = 5; // Adjust the spacing between dashes
    dashedLinePaint.shader =
    null; // Reset any existing shader to draw a solid line

    final path = Path();
    path.moveTo(yLabelPadding, size.height - bottomMargin - averageXPosition);

    for (double x = yLabelPadding + dashWidth;
    x < size.width;
    x += dashWidth + dashSpace) {
      path.lineTo(x, size.height - bottomMargin - averageXPosition);
      path.moveTo(x + dashSpace, size.height - bottomMargin - averageXPosition);
    }

    canvas.drawPath(path, dashedLinePaint);

    final avgLabel = 'rage: ${averageX.toStringAsFixed(1)}';
    final avgLabelPainter = TextPainter(
      text: TextSpan(
        text: avgLabel,
        style: const TextStyle(fontSize: 12, color: Colors.black), // Adjust styling
      ),
      textDirection: TextDirection.ltr,
    );
    avgLabelPainter.layout();
    final labelX = yLabelPadding; // Adjust the label's X position
    final labelY = size.height -
        bottomMargin -
        averageXPosition -
        20; // Adjust the label's Y position
    avgLabelPainter.paint(canvas, Offset(labelX + 10, labelY));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
