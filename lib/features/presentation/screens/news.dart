import 'package:dayer/features/presentation/screens/views/news_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:url_launcher/url_launcher.dart';

import '../controller/bloc/Dayer bloc/dayer_bloc.dart';
import '../controller/bloc/theme bloc/theme_bloc.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThemeBloc, ThemeState>(
      listener: (context, state) {
        if (state is Dark) {
          context.read<ThemeBloc>().isMode = false;
        } else {
          context.read<ThemeBloc>().isMode = true;
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'الاخبار',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            actions: [
              IconButton(
                  icon: Icon(
                      context.read<ThemeBloc>().isMode
                          ? Icons.dark_mode
                          : Icons.light_mode,
                      size: 40),
                  onPressed: () {
                    if (context.read<ThemeBloc>().isMode) {
                      context.read<ThemeBloc>().add(GetDarkThemeEvent());
                    } else {
                      context.read<ThemeBloc>().add(GetLightThemeEvent());
                    }
                  }),
            ],
            elevation: 0,
          ),
          body: BlocBuilder<DayerBloc, DayerState>(
            builder: (context, state) {
              if (state is Loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is NewsSuccess) {
                return NewsView(
                  state: state,
                );
              }
              if (state is Faliure) {
                return Center(child: Text(state.message));
              } else {
                return SizedBox();
              }
            },
          ),
        );
      },
    );
  }
}
