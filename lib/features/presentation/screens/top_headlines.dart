import 'package:dayer/features/data/models/news_model.dart';
import 'package:dayer/features/data/source/local_data_source.dart';
import 'package:dayer/features/presentation/controller/bloc/theme%20bloc/theme_bloc.dart';
import 'package:dayer/features/presentation/screens/views/top_headline_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../core/animations/news_animation.dart';
import '../controller/bloc/Dayer bloc/dayer_bloc.dart';
import 'news.dart';

class TopHeadLinesScreen extends StatelessWidget {
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
              'اهم العناوين',
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
              IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: Search());
                  },
                  icon: Icon(
                    Icons.search,
                    size: 40,
                  ))
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
              if (state is TopHeadLinesSuccess) {
                return TopHeadLineView(
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

class Search extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () async {
            if (query.isNotEmpty) {
              context.read<DayerBloc>().controller.text = query;
              await Sql().insertDatabase(query);
              await context.read<DayerBloc>()
                ..add(GetNewsEvent());
              Navigator.of(context).push(NewsAnimation(page: NewsScreen()));
            } else {
              query = '';
            }
          },
          icon: Icon(Icons.search))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () async {
          await context.read<DayerBloc>()
            ..add(GetTopHeadLinesEvent());
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: Sql().getRecords(),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            return ListView.builder(
              itemBuilder: (context, i) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () async {
                          context.read<DayerBloc>().controller.text =
                              snapShot.data![i]["query"];
                          await context.read<DayerBloc>()
                            ..add(GetNewsEvent());
                          Navigator.of(context)
                              .push(NewsAnimation(page: NewsScreen()));
                        },
                        child: Text(
                          snapShot.data != null
                              ? snapShot.data![i]["query"]
                              : '',
                          style: TextStyle(fontSize: 20),
                        )),
                    Spacer(
                      flex: 1,
                    ),
                    IconButton(
                        onPressed: () async {
                          await Sql()
                              .deleteColumn(snapShot.data![i]["id"].toString());
                        },
                        icon: Icon(
                          Icons.delete,
                          size: 20,
                        ))
                  ],
                ),
              ),
              itemCount: snapShot.data!.length,
            );
          } else {
            return SizedBox();
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
        future: Sql().getRecords(),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            return ListView.builder(
              itemBuilder: (context, i) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () async {
                          context.read<DayerBloc>().controller.text =
                              snapShot.data![i]["query"];
                          await context.read<DayerBloc>()
                            ..add(GetNewsEvent());
                          Navigator.of(context)
                              .push(NewsAnimation(page: NewsScreen()));
                        },
                        child: Text(
                          snapShot.data != null
                              ? snapShot.data![i]["query"]
                              : '',
                          style: TextStyle(fontSize: 20),
                        )),
                    Spacer(
                      flex: 1,
                    ),
                    IconButton(
                        onPressed: () async {
                          await Sql()
                              .deleteColumn(snapShot.data![i]["id"].toString());
                        },
                        icon: Icon(
                          Icons.delete,
                          size: 25,
                        ))
                  ],
                ),
              ),
              itemCount: snapShot.data!.length,
            );
          } else {
            return SizedBox();
          }
        });
  }
}
