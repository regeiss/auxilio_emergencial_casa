import 'package:auxilio_emergencial/source/core/router/app_router.dart';
import 'package:auxilio_emergencial/source/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:auxilio_emergencial/source/features/common/widgets/drawer.dart';
import 'package:auxilio_emergencial/source/constants/strings.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AjustesScreen extends HookConsumerWidget {
  const AjustesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appThemeState = ref.watch(appThemeStateNotifier);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.ajustes),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              context.goNamed(AppRoute.home.name);
            },
            child: Text('OK'),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Switch(
      value: appThemeState.isDarkModeEnabled,
      onChanged: (enabled) {
         if (enabled) {
          appThemeState.setDarkTheme();
        } else {
          appThemeState.setLightTheme();
        }
      },
      ),
    );
  }
}
