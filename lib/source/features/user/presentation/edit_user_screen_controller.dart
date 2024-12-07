import 'package:auxilio_emergencial/source/features/common/appbar_menu_action.dart';
import 'package:auxilio_emergencial/source/features/common/widgets/drawer.dart';
import 'package:auxilio_emergencial/source/features/user/data/user_repository.dart';
import 'package:auxilio_emergencial/source/features/user/domain/user.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'edit_user_screen_controller.g.dart';

@riverpod
class EditUserScreenController extends ConsumerWidget {
  const EditUserScreenController({super.key});
  
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
                    subtitle: Text(user[index].email));
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


