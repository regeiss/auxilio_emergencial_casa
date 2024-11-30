import 'package:auxilio_emergencial/source/core/router/app_router.dart';
import 'package:auxilio_emergencial/source/features/common/appbar_menu_action.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auxilio_emergencial/source/features/common/widgets/drawer.dart';
import 'package:auxilio_emergencial/source/features/user/domain/user.dart';
import 'package:auxilio_emergencial/source/features/user/data/user_repository.dart';
import 'package:go_router/go_router.dart';

class ListaUserScreen extends ConsumerWidget {
  const ListaUserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: unused_local_variable
    final userData = ref.watch(userDataProvider.future);
    final actions = AppBarPopUpMenuActions();

    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
        actions: <Widget>[
          PopupMenuButton<int>(
            onSelected: (item) => actions.handleClick(item, context, ref),
            itemBuilder: (context) => [
              PopupMenuItem<int>(value: 0, child: Text('Logout')),
              PopupMenuItem<int>(value: 1, child: Text('Ajustes')),
            ],
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: FutureBuilder(
        future: userData,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            List<User> user = snapshot.data!;
            return ListView.builder(
              itemCount: user.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text(user[index].name),
                    subtitle: Text(user[index].email),
                    onTap: () => context.goNamed(
                          AppRoute.editresponsavel.name,
                          pathParameters: {'id': user[index].username},
                          extra: user,
                          // leading: Text(user[index].phone),
                        ));
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Não foi possível obter os dados'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }),
      ),
    );
  }
}