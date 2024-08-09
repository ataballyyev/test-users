import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/bloc/user_cubit.dart';
import 'package:test_app/configuration/theme/theme.dart';
import 'package:test_app/data/source/db_helper.dart';
import 'package:test_app/presentation/home/view/home_view.dart';

void main() => runApp(
      BlocProvider(
        create: (context) => UserCubit(DatabaseHelper()),
        child: const ProviderScope(
          child: MyApp(),
        ),
      ),
    );

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  static final ValueNotifier<ThemeMode> _notifier =
      ValueNotifier(ThemeMode.dark);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var themeMode = ref.watch(darkModeProvider);

    return ValueListenableBuilder(
      valueListenable: _notifier,
      builder: (BuildContext context, ThemeMode value, Widget? child) {
        return MaterialApp(
          title: 'Material App',
          initialRoute: '/',
          debugShowCheckedModeBanner: false,
          theme: themeMode ? darkTheme : lightTheme,
          routes: {
            '/': (context) => const HomeView(),
          },
        );
      },
    );
  }
}
