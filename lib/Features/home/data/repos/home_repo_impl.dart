import 'package:booklywithcleanarchitecture/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:booklywithcleanarchitecture/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:booklywithcleanarchitecture/Features/home/domain/entities/book_entity.dart';
import 'package:booklywithcleanarchitecture/Features/home/domain/repos/home_repo.dart';
import 'package:booklywithcleanarchitecture/core/error/failure.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl(
      {required this.homeLocalDataSource, required this.homeRemoteDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeatureBooks() async {
    try {
      var bookList = homeLocalDataSource.fetchFeatureBooks();
      if (bookList.isNotEmpty) {
        return right(bookList);
      }
      var book = await homeRemoteDataSource.fetchFeatureBooks();
      return right(book);
    } catch (e) {
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      List<BookEntity> bookList = homeLocalDataSource.fetchNewestBooks();
      if (bookList.isNotEmpty) {
        return right(bookList);
      }
      var book = await homeRemoteDataSource.fetchNewestBooks();
      return right(book);
    } catch (e) {
      return left(Failure());
    }
  }
}
