import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LottieButton extends StatefulWidget {
  const LottieButton({Key? key, required this.url}) : super(key: key);
  final String url;
  @override
  State<StatefulWidget> createState() => _LottieButtonState();
}

class _LottieButtonState extends State<LottieButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final String _key = "lottieButtonState";

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _getSaveState();
  }

  Future<void> _setSaveState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, value);
  }

  Future<bool?> _getSaveState() async {
    final prefs = await SharedPreferences.getInstance();
    final bool? value = prefs.getBool(_key);
    if (value != null) {
      save = value;
      if (save) {
        _controller.forward();
      }
    }
    return value;
  }

  @override
  void dispose() {
    super.dispose();
    _setSaveState(save);
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
          save = !save;
          if (save) {
            _controller.forward();
            
          } else {
            _controller.reverse();
          }


        },
        child: Lottie.network(widget.url,
            controller: _controller, height: 50, width: 50),
      ),
    );
  }
}
