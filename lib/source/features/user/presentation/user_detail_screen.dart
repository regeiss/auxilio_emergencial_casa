import 'package:auxilio_emergencial/source/features/common/extension/column_extension.dart';
import 'package:auxilio_emergencial/source/features/user/domain/user.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserDetalheScreen extends ConsumerWidget {
  const UserDetalheScreen(
      {super.key, required this.userId, required this.user});

  final int userId;
  final User? user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // if (user != null) {}
    // final userData = ref.watch(userDataProvider.future);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuário'),
        actions: <Widget>[
          PopupMenuButton<int>(
            onSelected: (item) => handleClick(item, ref),
            itemBuilder: (context) => [
              PopupMenuItem<int>(value: 0, child: Text('Logout')),
              PopupMenuItem<int>(value: 1, child: Text('Ajustes')),
            ],
          ),
        ],
      ),
      // drawer: MainDrawer(),
      body: Column(
        
        children: [
          Text(user!.id.toString()),
          Text(user!.name),
          Text(user!.phone),
          Text(user!.address!.street),
          Text(user!.address!.suite),
          Text(user!.address!.geo!.lat),
          Text(user!.address!.geo!.lng),
        ],
      ).wrap(margin: 2.0),
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