import 'package:auxilio_emergencial/source/features/common/widgets/primary_button.dart';
import 'package:auxilio_emergencial/source/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


/// Placeholder widget showing a message and CTA to go back to the home screen.
class EmptyPlaceholderWidget extends ConsumerWidget {
  const EmptyPlaceholderWidget({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.p16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              message,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            gapH32,
            PrimaryButton(
              onPressed: () {
               
              },
              text: 'Go Home',
            )
          ],
        ),
      ),
    );
  }
}
