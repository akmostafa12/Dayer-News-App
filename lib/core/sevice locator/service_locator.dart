import 'package:dayer/features/data/repository/repository.dart';
import 'package:dayer/features/data/source/remote_data_source.dart';
import 'package:dayer/features/domain/repository/base_repository.dart';
import 'package:dayer/features/domain/usecases/get_top_headlines.dart';
import 'package:get_it/get_it.dart';

import '../../features/domain/usecases/get_news.dart';
import '../../features/presentation/controller/bloc/Dayer bloc/dayer_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    sl.registerLazySingleton(() => DayerBloc(sl(), sl()));
    sl.registerLazySingleton(() => GetNews(sl()));
    sl.registerLazySingleton(() => GetTopHeadLines(sl()));
    sl.registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());
    sl.registerLazySingleton<BaseRepository>(() => Repository(sl()));
  }
}
