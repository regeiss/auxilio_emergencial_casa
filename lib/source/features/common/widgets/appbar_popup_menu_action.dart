// import 'package:flutter/material.dart';
// import 'package:auxilio_emergencial/source/features/common/appbar_menu_action.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class AppbarPopUpMenu extends StatelessWidget 
// {
//   const AppbarPopUpMenu({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final actions = AppBarPopUpMenuActions();
//     return 
//         PopupMenuButton<int>(
//             onSelected: (item) => actions.handleClick(item, context, ref),
//             itemBuilder: (context) => [
//                 PopupMenuItem<int>(value: 0, child: Text('Logout')),
//                 PopupMenuItem<int>(value: 1, child: Text('Ajustes')),
//               ],
//             ),
// }
// }