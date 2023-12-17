import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/theme/theme_dark.dart';
import 'package:tobeto_app/config/constant/theme/theme_light.dart';

class ThemeManager extends InheritedWidget {
  final ThemeData theme;
  final VoidCallback changeTheme;

  const ThemeManager({
    super.key,
    required super.child, //Her InheritedWidget, bir widget ile doğar. Bunun için'de child alması gerekir.
    required this.theme,
    required this.changeTheme,
  });

// of 'un içerisinde belki var belki yok şeklinde.Yani (context)'e bağlanmış mı? bağlanmamış mı? ---->
// Uygulama açılıyor mu? açılmıyor mu?
  static ThemeManager? maybeOf(BuildContext context) {
    // tam tipte miras alınan widget'a bağlıdır = dependOnInheritedWidgetOfExactType
    return context.dependOnInheritedWidgetOfExactType<ThemeManager>();
  }

// Dönüş tipini yazıyorum:
  static ThemeManager of(BuildContext context) {
    final themes = maybeOf(context);
    assert(themes != null,
        "No found ThemeManager on Context"); // böyle bir durum yok ise return;
    return themes!;
  }

//Ben bir değişim yolladğım'da Temayı değiştir: UPDATE!!!
  @override
  bool updateShouldNotify(ThemeManager oldWidget) {
    return theme != oldWidget.theme;
  }
}

class ThemeManagerNotifier extends ValueNotifier<ThemeData> {
  // ThemeManagerNotifier(super.value);

  ThemeManagerNotifier(ThemeData value) : super(value);

  // Anlık (value) yani ThemeData'm LightTheme eşit ise bunu dark'a çevir.

  void changeTheme() {
    if (value == LightTheme.theme) {
      value = DarkTheme.theme;
    } else {
      value = LightTheme.theme;
    }

    notifyListeners(); // bilgi gönderiyorum.
  }
}
