import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_app/presentation/widgets/spaces.dart';

class LoginSecondView extends StatefulWidget {
  const LoginSecondView({super.key});

  @override
  State<LoginSecondView> createState() => _LoginSecondViewState();
}

class _LoginSecondViewState extends State<LoginSecondView> {
  bool isValidEmail = true;
  bool isValidPass = true;
  bool isObscure = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _emailKey = GlobalKey<FormState>();
  final _passKey = GlobalKey<FormState>();
  bool checkValue = false;

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
              color: theme.shadowColor,
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/logo.svg',
                    fit: BoxFit.fill,
                  ),
                  Text(
                    'Welcome Back!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: theme.scaffoldBackgroundColor,
                    ),
                  ),
                  Text(
                    "Please login first to start your Udrive",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: theme.scaffoldBackgroundColor,
                    ),
                  ),
                  Spaces().veryLargeVerticalSpace(),
                  Spaces().veryLargeVerticalSpace(),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.6,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color: theme.scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spaces().veryLargeVerticalSpace(),
                    Form(
                      key: _emailKey,
                      child: TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Invalid email, try again';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "Email or phone number",
                          labelStyle: TextStyle(
                            color:
                                isValidEmail ? theme.primaryColor : Colors.red,
                          ),
                          hintText: "Input your registered email or phone",
                          hintStyle: TextStyle(
                            color: theme.indicatorColor.withOpacity(0.5),
                            fontSize: 14,
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.red,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: isValidEmail
                                    ? theme.primaryColor
                                    : Colors.red),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: isValidEmail
                                    ? theme.primaryColor
                                    : Colors.red),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: isValidEmail
                                    ? theme.primaryColor
                                    : Colors.red),
                          ),
                        ),
                      ),
                    ),
                    Spaces().mediumVerticalSpace(),
                    Form(
                      key: _passKey,
                      child: TextFormField(
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            setState(() {
                              isValidPass = false;
                            });
                            return 'Invalid password, try again';
                          }
                          setState(() {
                            isValidPass = true;
                          });
                          return null; // Return null if the value is valid
                        },
                        obscureText: isObscure,
                        decoration: InputDecoration(
                          labelText: "Password",
                          suffix: GestureDetector(
                            onTap: () => setState(() {
                              isObscure = !isObscure;
                            }),
                            child: SvgPicture.asset(
                              'assets/icons/eye.svg',
                              height: 16,
                              width: 16,
                              color:
                                  isValidPass ? theme.primaryColor : Colors.red,
                            ),
                          ),
                          labelStyle: TextStyle(
                            color:
                                isValidPass ? theme.primaryColor : Colors.red,
                          ),
                          hintText: "Input your password account",
                          hintStyle: TextStyle(
                            color: theme.indicatorColor.withOpacity(0.5),
                            fontSize: 14,
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.red,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color:
                                  isValidPass ? theme.primaryColor : Colors.red,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: isValidPass
                                    ? theme.primaryColor
                                    : Colors.red),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: isValidPass
                                    ? theme.primaryColor
                                    : Colors.red),
                          ),
                        ),
                      ),
                    ),
                    Spaces().mediumVerticalSpace(),
                    Row(
                      children: [
                        CupertinoCheckbox(
                          value: checkValue,
                          onChanged: (value) {
                            setState(() {
                              checkValue = !checkValue;
                            });
                          },
                        ),
                        Text(
                          "Remember Me",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: theme.indicatorColor,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "Forgot Password",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: theme.indicatorColor,
                          ),
                        ),
                      ],
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
                        onPressed: () {
                          _passKey.currentState!.validate();
                          _emailKey.currentState!.validate();
                          setState(() {
                            isValidPass = validPass();
                            isValidEmail = validEmail();
                          });
                          if (validEmail() && validPass()) {
                            Navigator.pushNamed(context, "/");
                          }
                        },
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
                    Spaces().veryLargeVerticalSpace(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool validPass() {
    return passwordController.text.isNotEmpty &&
        passwordController.text.length >= 6;
  }

  bool validEmail() {
    return emailController.text.isNotEmpty &&
        emailController.text.contains("@");
  }
}
