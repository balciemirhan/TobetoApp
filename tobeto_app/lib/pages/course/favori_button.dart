import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool _isFavorited = false;

  @override
  void initState() {
    super.initState();

    _loadFavoriteStatus();
  }

  Future<void> _loadFavoriteStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isFavorited = prefs.getBool('isFavorited') ?? false;
    });
  }

  Future<void> _updateFavoriteStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isFavorited = !_isFavorited;
    });
    prefs.setBool('isFavorited', _isFavorited);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(_isFavorited ? Icons.favorite : Icons.favorite_outline),
      color: Colors.red,
      onPressed: _updateFavoriteStatus,
    );
  }
}
