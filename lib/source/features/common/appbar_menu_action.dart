import 'package:auxilio_emergencial/source/features/auth/data/firebase_auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppBarPopUpMenuActions {
  void handleClick(int item, BuildContext context, WidgetRef ref) {
    switch (item) {
      case 0:
        _showAlertDialog(context, ref);
        
        break;
      case 1:
        break;
    }
  }

  void _showAlertDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert Dialog Title'),
          content: Text('This is a simple alert dialog.'),
          actions: [
            TextButton(
              onPressed: () {
                ref.read(firebaseAuthProvider).signOut();
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
