import 'package:flutter/material.dart';

class AnimatedLine extends StatefulWidget {
  final double enteredValue;

  AnimatedLine({@required this.enteredValue});

  @override
  State<StatefulWidget> createState() => _AnimatedLineState();
}

class _AnimatedLineState extends State<AnimatedLine>
    with SingleTickerProviderStateMixin {
  double _progress = 0.0;
  Animation<double> animation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: Duration(milliseconds: 3000), vsync: this);
    animation = Tween(begin: 0.0, end: widget.enteredValue * 0.005)
        .animate(_animationController)
          ..addListener(
            () {
              setState(
                () {
                  _progress = animation.value;
                },
              );
            },
          );

    _animationController.forward();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: LinePainter(_progress));
  }
}

class LinePainter extends CustomPainter {
  Paint _paint;
  double _progress;

  LinePainter(this._progress) {
    _paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 5.0;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Offset startingPoint = Offset(-10, size.height / 10);
    Offset endingPoint = Offset(size.width * _progress, size.height / 10);
    canvas.drawLine(startingPoint, endingPoint, _paint);
  }

  @override
  bool shouldRepaint(LinePainter oldDelegate) {
    return oldDelegate._progress != _progress;
  }
}
