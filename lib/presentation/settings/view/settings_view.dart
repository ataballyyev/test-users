import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/presentation/widgets/spaces.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    final icons = [
      CupertinoIcons.info,
      CupertinoIcons.star,
      CupertinoIcons.share,
      CupertinoIcons.doc,
      CupertinoIcons.check_mark_circled,
      CupertinoIcons.arrow_branch,
    ];

    final titles = [
      "Help",
      "Rrate Us",
      "Share with Friends",
      "Terms of Use",
      "Privacy Policy",
      "OS Version",
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              ListView.builder(
                itemCount: icons.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  return listItem(
                    index == icons.length - 1,
                    titles[index],
                    icons[index],
                    index == icons.length - 1
                        ? const Text(
                            "v1.0.0",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : Icon(
                            CupertinoIcons.arrow_up_right,
                            color: theme.indicatorColor,
                          ),
                    theme,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget listItem(
    bool isFirstOrLast,
    String title,
    IconData icon,
    Widget suffix,
    ThemeData theme,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        children: [
          Spaces().smallVerticalSpace(),
          Row(
            children: [
              Icon(
                icon,
                color: theme.primaryColor,
              ),
              Spaces().mediumHorizontalSpace(),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: theme.shadowColor.withOpacity(0.7),
                ),
              ),
              const Spacer(),
              suffix,
              Spaces().mediumHorizontalSpace(),
            ],
          ),
          Spaces().smallVerticalSpace(),
          if (!isFirstOrLast)
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              height: 1,
              width: double.infinity,
              color: theme.indicatorColor.withOpacity(0.6),
            )
        ],
      ),
    );
  }
}
