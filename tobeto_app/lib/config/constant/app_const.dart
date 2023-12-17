import 'package:tobeto_app/config/constant/theme/theme_light.dart';
import 'package:tobeto_app/config/constant/theme/theme_manager.dart';

final class AppConst {
  const AppConst._();

  static final ThemeManagerNotifier themeNotifier =
      ThemeManagerNotifier(LightTheme.theme);
}
