import 'package:auxilio_emergencial/source/constants/app_sizes.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auxilio_emergencial/source/core/router/app_router.dart';
import 'package:auxilio_emergencial/source/features/onboarding/presentation/onboarding_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends ConsumerWidget {
  final introKey = GlobalKey<IntroductionScreenState>();

  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(onboardingControllerProvider);
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: const Color.fromARGB(255, 228, 230, 233),
      skipStyle: ButtonStyle(textStyle: WidgetStateProperty.all(TextStyle(fontSize: 17)), foregroundColor: WidgetStateProperty.all(Colors.redAccent)),
      allowImplicitScrolling: true,
      autoScrollDuration: 300000,
      infiniteAutoScroll: true,
      pages: [
        PageViewModel(
          title: "",
          bodyWidget: Column(
            children: [
              Text("Lorem Ipsum sic amet!",
                  style: GoogleFonts.mochiyPopOne(fontSize: 28, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 40, 183, 125))),
              gapW20,
              Image(
                image: const AssetImage('assets/image_placeholder.png'),
                height: MediaQuery.of(context).size.height / 2,
                fit: BoxFit.contain,
              ),
              gapW20,
              Text("Ameno dori me ",
                  style: GoogleFonts.mochiyPopOne(fontSize: 28, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 37, 119, 128))),
            ],
          ),
        ),
       PageViewModel(
          title: "",
          bodyWidget: Column(
            children: [
              Text("Lorem Ipsum sic amet!",
                  style: GoogleFonts.mochiyPopOne(fontSize: 28, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 40, 183, 125))),
              gapW20,
              Image(
                image: const AssetImage('assets/image_placeholder.png'),
                height: MediaQuery.of(context).size.height / 2,
                fit: BoxFit.contain,
              ),
              gapW20,
              Text("Ameno dori me ",
                  style: GoogleFonts.mochiyPopOne(fontSize: 28, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 37, 119, 128))),
            ],
          ),
        ),
        PageViewModel(
          title: "",
          bodyWidget: Column(
            children: [
              Text("Lorem Ipsum sic amet!",
                  style: GoogleFonts.mochiyPopOne(fontSize: 28, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 40, 183, 125))),
              gapW20,
              Image(
                image: const AssetImage('assets/image_placeholder.png'),
                height: MediaQuery.of(context).size.height / 2,
                fit: BoxFit.contain,
              ),
              gapW20,
              Text("Ameno dori me ",
                  style: GoogleFonts.mochiyPopOne(fontSize: 28, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 37, 119, 128))),
            ],
          ),
        ),
        PageViewModel(
          title: "",
          bodyWidget: Column(
            children: [
              Text("Lorem Ipsum sic amet!",
                  style: GoogleFonts.mochiyPopOne(fontSize: 28, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 40, 183, 125))),
              gapW20,
              Image(
                image: const AssetImage('assets/image_placeholder.png'),
                height: MediaQuery.of(context).size.height / 2,
                fit: BoxFit.contain,
              ),
              gapW20,
              Text("Ameno dori me ",
                  style: GoogleFonts.mochiyPopOne(fontSize: 28, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 37, 119, 128))),
            ],
          ),
        ),
        PageViewModel(
          title: "",
          bodyWidget: Column(
            children: [
              Text("Lorem Ipsum sic amet!",
                  style: GoogleFonts.mochiyPopOne(fontSize: 28, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 40, 183, 125))),
              gapW20,
              Image(
                image: const AssetImage('assets/image_placeholder.png'),
                height: MediaQuery.of(context).size.height / 2,
                fit: BoxFit.contain,
              ),
              gapW20,
              Text("Ameno dori me ",
                  style: GoogleFonts.mochiyPopOne(fontSize: 28, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 37, 119, 128))),
            ],
          ),
        ),
      ],
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      // onChange: (val) {},
      skip: const Text('Pular', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(
        Icons.arrow_forward,
      ),
      done: const Text('Pronto', style: TextStyle(fontWeight: FontWeight.w600, color: Color.fromARGB(255, 248, 64, 64))),
      onDone: () async {
        bool isLoading = state.isLoading;
        await ref.read(onboardingControllerProvider.notifier).completeOnboarding();
        if (context.mounted) {
          context.goNamed(AppRoute.signIn.name);
        }
      },
      nextStyle: ButtonStyle(foregroundColor: WidgetStateProperty.all(Color.fromARGB(255, 248, 64, 64))),
      dotsDecorator: const DotsDecorator(
        size: Size.square(10),
        activeColor: Colors.redAccent,
        activeSize: Size.square(17),
      ),
    );
  }
}
