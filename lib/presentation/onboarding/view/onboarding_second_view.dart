import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_app/presentation/widgets/spaces.dart';

class OnboardingSecondView extends StatelessWidget {
  const OnboardingSecondView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: theme.scaffoldBackgroundColor,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: theme.indicatorColor.withOpacity(0.2),
                                ),
                                child:
                                    Image.asset('assets/images/bubble_car.png'),
                              ),
                            ),
                            Spaces().mediumHorizontalSpace(),
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: theme.primaryColor),
                                child:
                                    SvgPicture.asset('assets/icons/logo.svg'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spaces().mediumVerticalSpace(),
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          'assets/images/onb_image.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
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
                      'Solution for drivers striving for successful work',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: theme.shadowColor,
                      ),
                    ),
                    Spaces().largeVerticalSpace(),
                    Text(
                      "Be part of a new era of work with this innovative app",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: theme.indicatorColor,
                      ),
                    ),
                    Spaces().largeVerticalSpace(),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/login'),
                      child:
                          SvgPicture.asset('assets/icons/progress_button.svg'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
