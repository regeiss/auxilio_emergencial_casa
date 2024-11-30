import 'package:firebase_auth/firebase_auth.dart'
    hide
        EmailAuthProvider,
        AuthProvider,
        PhoneAuthProvider,
        GoogleAuthProvider,
        AppleAuthProvider,
        FacebookAuthProvider,
        GithubAuthProvider,
        YahooAuthProvider;

import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_providers.g.dart';

@Riverpod(keepAlive: true)
List<AuthProvider<AuthListener, AuthCredential>> authProviders(AuthProvidersRef ref) {
  return [
    // corrigir as informações do link aqui
    EmailLinkAuthProvider(
      actionCodeSettings: ActionCodeSettings(
        url: 'https://<your-project-id>.page.link',
        handleCodeInApp: true,
        androidMinimumVersion: '1',
        androidPackageName: 'io.flutter.plugins.firebase_ui.firebase_ui_example',
        iOSBundleId: 'io.flutter.plugins.flutterfireui.flutterfireUIExample',
      ),
    ),
    EmailAuthProvider(),
    PhoneAuthProvider(),
   
    // GithubAuthProvider(),
    // YahooAuthProvider(),
  ];
}
