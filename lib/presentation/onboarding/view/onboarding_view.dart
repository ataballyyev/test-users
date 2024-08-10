import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_app/presentation/widgets/spaces.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: theme.primaryColor,
                ),
                Positioned(
                  right: 0,
                  left: 60,
                  top: 100,
                  child: Image.asset(
                    'assets/images/mockup.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  right: 0,
                  left: 240,
                  top: 75,
                  child: Image.asset('assets/images/bubble.png'),
                ),
                Positioned(
                  right: 300,
                  left: 0,
                  top: 180,
                  bottom: 24,
                  child: Image.asset('assets/images/exited.png'),
                ),
                Positioned(
                  right: 0,
                  left: 280,
                  top: 280,
                  child: Image.asset('assets/images/like.png'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Column(
                children: [
                  Spaces().veryLargeVerticalSpace(),
                  Text(
                    'Make your way more comfortable',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: theme.shadowColor,
                    ),
                  ),
                  Spaces().largeVerticalSpace(),
                  Text(
                    "Find the mechanic along the entire route without interrupting your route using this platform.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: theme.indicatorColor,
                    ),
                  ),
                  Spaces().largeVerticalSpace(),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, '/onboarding_second'),
                    child: SvgPicture.asset('assets/icons/progress_button.svg'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
