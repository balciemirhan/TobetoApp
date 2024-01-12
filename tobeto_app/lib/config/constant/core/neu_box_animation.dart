import 'dart:async';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:tobeto_app/widget/menu_items.dart';

class NeuBoxAnimation extends StatefulWidget {
  const NeuBoxAnimation({Key? key, this.child, this.width, this.height})
      : super(key: key);

  final Widget? child;
  final double? width;
  final double? height;

  @override
  _NeuBoxState createState() => _NeuBoxState();
}

class _NeuBoxState extends State<NeuBoxAnimation> {
  late Timer _timer;
  bool _isLightOn = false;

  @override
  void initState() {
    super.initState();

    // Start the timer to toggle the light every 10 seconds
    _timer = Timer.periodic(Duration(seconds: 10), (Timer timer) {
      setState(() {
        _isLightOn = !_isLightOn;
      });
    });
  }

  @override
  void dispose() {
    // Dispose of the timer to prevent memory leaks
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showPopover(
          direction: PopoverDirection.left,
          width: 120,
          height: 50,
          context: context,
          backgroundColor: Colors.grey[200]!,
          bodyBuilder: (context) => const MenuItems()),
      child: Container(
        width: widget.width ?? 50,
        height: widget.height ?? 50,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: _isLightOn ? Colors.deepPurple : Colors.grey.shade500,
              blurRadius: 15,
              offset: const Offset(5, 5),
            ),
            const BoxShadow(
              color: Colors.white,
              blurRadius: 15,
              offset: Offset(-5, -5),
            ),
          ],
        ),
        child: Center(
          child: widget.child,
        ),
      ),
    );
  }
}
