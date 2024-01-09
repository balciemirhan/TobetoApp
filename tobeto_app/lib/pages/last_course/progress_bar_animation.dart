import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/core/neu_box.dart';

class ProgressBarAnimation extends StatefulWidget {
  const ProgressBarAnimation({Key? key}) : super(key: key);

  @override
  _ProgressBarAnimationState createState() => _ProgressBarAnimationState();
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
      duration: const Duration(seconds: 3), // Set the duration of the animation
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);

    // Start the animation and make it repeat

    /*   _animationController.repeat();  */
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: NeuBox(
        width: 150,
        height: 70, // Increased height to accommodate the percentage text
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            int percentage = (_animation.value * 41).toInt();
            Color progressColor = _getColorForPercentage(percentage);

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$percentage%',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.deepPurple,
                  ),
                ),
                SizedBox(
                  width: 130,
                  height: 20,
                  child: LinearProgressIndicator(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    value: _animation.value,
                    valueColor: AlwaysStoppedAnimation<Color>(progressColor),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Color _getColorForPercentage(int percentage) {
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
