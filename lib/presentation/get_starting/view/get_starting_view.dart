import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_app/presentation/widgets/spaces.dart';

class GetStartingView extends StatelessWidget {
  const GetStartingView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theme.primaryColor,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/ic_globe.svg'),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: theme.primaryColor,
              child: Center(
                child: SvgPicture.asset('assets/icons/logo_light.svg'),
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
                  Spaces().mediumVerticalSpace(),
                  Text(
                    '👋🏻 Hello',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: theme.shadowColor,
                    ),
                  ),
                  Spaces().mediumVerticalSpace(),
                  Text(
                    "Choose how you will use the app for better experience",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: theme.indicatorColor,
                    ),
                  ),
                  Spaces().mediumVerticalSpace(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          splashFactory: NoSplash.splashFactory,
                          backgroundColor: theme.primaryColor,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 21,
                          )),
                      onPressed: () =>
                          Navigator.pushNamed(context, '/onboarding'),
                      child: Text(
                        "I'm driver",
                        style: TextStyle(
                          color: theme.scaffoldBackgroundColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Spaces().mediumVerticalSpace(),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                        backgroundColor: theme.scaffoldBackgroundColor,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 21,
                        ),
                      ),
                      onPressed: () =>
                          Navigator.pushNamed(context, '/onboarding'),
                      child: Text(
                        "I'm a mechanic",
                        style: TextStyle(
                          color: theme.shadowColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
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
