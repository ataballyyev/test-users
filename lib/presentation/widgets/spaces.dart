import 'package:flutter/material.dart';

class Spaces {
  Widget verySmallHorizontalSpace() {
    return const SizedBox(
      width: 4,
    );
  }

  Widget smallHorizontalSpace() {
    return const SizedBox(
      width: 8,
    );
  }

  Widget mediumHorizontalSpace() {
    return const SizedBox(
      width: 16,
    );
  }

  Widget largeHorizontalSpace() {
    return const SizedBox(
      width: 24,
    );
  }

  Widget veryLargeHorizontalSpace() {
    return const SizedBox(
      width: 36,
    );
  }

  Widget verySmallVerticalSpace() {
    return const SizedBox(
      height: 4,
    );
  }

  Widget smallVerticalSpace() {
    return const SizedBox(
      height: 8,
    );
  }

  Widget mediumVerticalSpace() {
    return const SizedBox(
      height: 16,
    );
  }

  Widget largeVerticalSpace() {
    return const SizedBox(
      height: 24,
    );
  }

  Widget veryLargeVerticalSpace() {
    return const SizedBox(
      height: 36,
    );
  }
}
