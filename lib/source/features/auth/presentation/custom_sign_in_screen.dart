import 'package:auxilio_emergencial/source/constants/app_sizes.dart';
import 'package:auxilio_emergencial/source/features/auth/data/firebase_auth_repository.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auth_providers.dart';

class CustomSignInScreen extends ConsumerWidget {
  const CustomSignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProviders = ref.watch(authProvidersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrar'),
      ),
      body: SignInScreen(
        providers: authProviders,
        footerBuilder: (context, action) => const SignInAnonymouslyFooter(),
      ),
    );
  }
}

class SignInAnonymouslyFooter extends ConsumerWidget {
  const SignInAnonymouslyFooter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        gapH8,
        const Row(
          children: [
            Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.p8),
              child: Text('ou'),
            ),
            Expanded(child: Divider()),
          ],
        ),
        TextButton(
          onPressed: () => ref.read(firebaseAuthProvider).signInAnonymously(),
          child: const Text('Entrar anonimamente'),
        ),
      ],
    );
  }
}
