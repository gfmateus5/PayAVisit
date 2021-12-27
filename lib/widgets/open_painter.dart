import 'package:flutter/cupertino.dart';

class OpenPainter extends CustomPainter {
  double width, height;
  Color color;

  OpenPainter(this.width, this.height, this.color);
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    canvas.drawRect(Rect.fromLTRB(0, 0, width, height), paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}