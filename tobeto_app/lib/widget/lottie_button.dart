import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieButton extends StatefulWidget {
  const LottieButton({Key? key, required this.url}) : super(key: key);
  final String url;
  @override
  _LottieButtonState createState() => _LottieButtonState();
}

class _LottieButtonState extends State<LottieButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  bool save = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white70,
      ),
      child: GestureDetector(
        onTap: () {
          if (save == false) {
            save = true;
            _controller.forward();
          } else {
            save = false;
            _controller.reverse();
          }
        },
        child: Lottie.network(widget.url,
            controller: _controller, height: 50, width: 50),
      ),
    );
  }
}
 //"https://assets5.lottiefiles.com/packages/lf20_xdfeea13.json" 
 //
 //"https://lottie.host/86013093-cf7d-46a5-93cb-4afc144f4fd7/EuXDQ9wAkK.json"