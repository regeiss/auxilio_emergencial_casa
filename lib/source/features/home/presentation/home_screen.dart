import 'package:flutter/material.dart';
import 'package:auxilio_emergencial/source/features/common/widgets/drawer.dart';
import 'package:auxilio_emergencial/source/constants/strings.dart';
import 'package:auxilio_emergencial/source/features/common/appbar_menu_action.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actions = AppBarPopUpMenuActions();

    return Scaffold(
        appBar: AppBar(
          title: const Text(Strings.homePage),
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
        body: RefreshIndicator( child: 
        CustomScrollView(
          primary: false,
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverGrid.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.green[100],
                    child: const Text("Area 1"),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.green[200],
                    child: const Text('Area 2'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.blue[300],
                    child: const Text('Area 3'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.blue[400],
                    child: const Text('Area 4'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.orange[500],
                    child: const Text('Area 5'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.orange[600],
                    child: const Text('Area 6'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.red[700],
                    child: const Text('Area 7'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.red[800],
                    child: const Text('Area 8'),
                  ),
                ],
              ),
            ),
          ],
        ),
        onRefresh: () {
          return Future.delayed(
              Duration(seconds: 1),
              () {
                /// adding elements in list after [1 seconds] delay
                /// to mimic network call
                ///
                /// Remember: [setState] is necessary so that
                /// build method will run again otherwise
                /// list will not show all elemen
 
                // showing snackbar
                // _scaffoldKey.currentState.showSnackBar(
                //   SnackBar(
                //     content: const Text('Page Refreshed'),
                //   ),
                // );
              },
            );
        },
    )
    );
  }
}
