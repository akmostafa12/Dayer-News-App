import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/bloc/Dayer bloc/dayer_bloc.dart';
import '../controller/bloc/theme bloc/theme_bloc.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: context.read<DayerBloc>().list[context.read<DayerBloc>().i],
        bottomNavigationBar: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            if (state is Dark) {
              return ConvexAppBar(
                  backgroundColor: Colors.black,
                  color: Colors.white,
                  activeColor: Colors.white,
                  style: TabStyle.react,
                  items: [
                    TabItem(icon: Icons.newspaper),
                    TabItem(icon: Icons.facebook),
                  ],
                  initialActiveIndex: context.read<DayerBloc>().i,
                  onTap: (int i) => setState(() {
                        context.read<DayerBloc>().i = i;
                      }));
            }
            if (state is Light) {
              return ConvexAppBar(
                  backgroundColor: Colors.white,
                  color: Colors.black,
                  activeColor: Colors.black,
                  style: TabStyle.react,
                  items: [
                    TabItem(icon: Icons.newspaper),
                    TabItem(icon: Icons.facebook),
                  ],
                  initialActiveIndex: context.read<DayerBloc>().i,
                  onTap: (int i) => setState(() {
                        context.read<DayerBloc>().i = i;
                      }));
            } else {
              return ConvexAppBar(
                  backgroundColor: Colors.white,
                  color: Colors.black,
                  activeColor: Colors.black,
                  style: TabStyle.react,
                  items: [
                    TabItem(icon: Icons.newspaper),
                    TabItem(icon: Icons.facebook),
                  ],
                  initialActiveIndex: context.read<DayerBloc>().i,
                  onTap: (int i) => setState(() {
                        context.read<DayerBloc>().i = i;
                      }));
            }
          },
        ));
  }
}
