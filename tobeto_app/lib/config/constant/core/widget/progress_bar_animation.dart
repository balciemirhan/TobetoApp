import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/core/widget/neu_box.dart';

class ProgressBarAnimation extends StatefulWidget {
  const ProgressBarAnimation({Key? key, required this.progress})
      : super(key: key);
  final num progress;

  @override
  State<StatefulWidget> createState() => _ProgressBarAnimationState();
}

class _ProgressBarAnimationState extends State<ProgressBarAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: NeuBox(
        width: 300,
        height: 30,
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            double percentage = (_animation.value * widget.progress);
            Color progressColor = _getColorForPercentage(percentage);

            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  percentage.toStringAsFixed(1),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Colors.deepPurple,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Stack(
                  children: [
                    Container(
                      width: _animation.value * 200,
                      height: 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey.shade400),
                    ),
                    SizedBox(
                      width: percentage * 2,
                      height: 10,
                      child: LinearProgressIndicator(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        value: _animation.value * 200,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(progressColor),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Color _getColorForPercentage(double percentage) {
    if (percentage < 50) {
      return Colors.deepPurpleAccent;
    } else if (percentage < 80) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
