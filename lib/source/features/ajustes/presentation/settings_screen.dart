import 'package:auxilio_emergencial/source/core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:auxilio_emergencial/source/features/common/widgets/drawer.dart';
import 'package:auxilio_emergencial/source/constants/strings.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

class AjustesScreen extends ConsumerWidget {
  const AjustesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: unused_local_variable
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.ajustes),
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
      body: SettingsList(
        sections: [
          SettingsSection(
            title: Text('Comuns'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.language),
                title: Text('Linguagem'),
                value: Text('Português'),
              ),
              SettingsTile.switchTile(
                onToggle: (value) {},
                initialValue: true,
                leading: Icon(Icons.format_paint),
                title: Text('Habilitar tema customizado'),
              ),
              SettingsTile.switchTile(
                onToggle: (value) {},
                initialValue: true,
                leading: Icon(Icons.light),
                title: Text('Tema escuro'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void handleClick(int item, WidgetRef ref) {
    switch (item) {
      case 0:
        break;
      case 1:
        break;
    }
  }
}
