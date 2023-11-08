import 'package:dayer/core/sevice%20locator/service_locator.dart';
import 'package:dayer/features/presentation/controller/bloc/bloc_observer.dart';
import 'package:dayer/features/presentation/screens/splash.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/presentation/controller/bloc/Dayer bloc/dayer_bloc.dart';
import 'features/presentation/controller/bloc/theme bloc/theme_bloc.dart';
import 'features/presentation/screens/Home.dart';

void main() async {
  ServiceLocator().init();
  Bloc.observer = MyBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                DayerBloc(sl(), sl())..add(GetTopHeadLinesEvent())),
        BlocProvider(create: (context) => ThemeBloc()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        if (state is Dark) {
          return MaterialApp(
            title: 'داير',
            theme: state.dark,
            debugShowCheckedModeBanner: false,
            home: Home(),
          );
        }
        if (state is Light) {
          return MaterialApp(
            title: 'داير',
            theme: state.light,
            debugShowCheckedModeBanner: false,
            home: Home(),
          );
        } else {
          return MaterialApp(
            title: 'داير',
            theme: ThemeData(
                brightness: context.read<ThemeBloc>().isLight
                    ? Brightness.light
                    : Brightness.dark,
                useMaterial3: true),
            debugShowCheckedModeBanner: false,
            home: Splash(),
          );
        }
      },
    );
  }
}
