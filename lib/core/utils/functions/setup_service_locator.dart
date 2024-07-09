import 'package:booklywithcleanarchitecture/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:booklywithcleanarchitecture/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:booklywithcleanarchitecture/Features/home/data/repos/home_repo_impl.dart';
import 'package:booklywithcleanarchitecture/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
      homeLocalDataSource: HomeLocalDataSourceImpl(),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(ApiService(Dio()))));
}