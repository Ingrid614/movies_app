import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<AdaptiveThemeMode> {
  ThemeCubit(AdaptiveThemeMode? themeMode) : super(themeMode ?? AdaptiveThemeMode.light);

  Future<void> toggleTheme(context) async {
    AdaptiveTheme.of(context).toggleThemeMode();
    final AdaptiveThemeMode? themeMode = await AdaptiveTheme.getThemeMode();
    emit(themeMode ?? AdaptiveThemeMode.light);
  }

  @override
  void onChange(Change<AdaptiveThemeMode> change) {
    super.onChange(change);
  }
}
