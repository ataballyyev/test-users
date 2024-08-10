import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_app/presentation/widgets/spaces.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              color: theme.primaryColor,
              height: MediaQuery.of(context).size.height * 0.6,
              width: double.infinity,
              child:
                  Image.asset('assets/images/img_truck.png', fit: BoxFit.fill),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
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
                      'Your Successful Journey Starts Here',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: theme.shadowColor,
                      ),
                    ),
                    Spaces().mediumVerticalSpace(),
                    Text(
                      "Take your drive career to the next level with this  app.",
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
                            Navigator.pushNamed(context, '/login_second'),
                        child: Text(
                          "Login to Account",
                          style: TextStyle(
                            color: theme.scaffoldBackgroundColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Spaces().mediumVerticalSpace(),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              splashFactory: NoSplash.splashFactory,
                              backgroundColor: theme.scaffoldBackgroundColor,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 21,
                              ),
                            ),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/icons/google.svg'),
                                Spaces().mediumHorizontalSpace(),
                                Text(
                                  "Google",
                                  style: TextStyle(
                                    color: theme.shadowColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spaces().mediumHorizontalSpace(),
                        Expanded(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              splashFactory: NoSplash.splashFactory,
                              backgroundColor: theme.scaffoldBackgroundColor,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 21,
                              ),
                            ),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/icons/apple.svg'),
                                Spaces().mediumHorizontalSpace(),
                                Text(
                                  "Apple",
                                  style: TextStyle(
                                    color: theme.shadowColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spaces().mediumVerticalSpace(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "New to udrive?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: theme.indicatorColor,
                          ),
                        ),
                        Spaces().smallHorizontalSpace(),
                        Text(
                          "Create Account",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: theme.primaryColor,
                          ),
                        ),
                      ],
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
