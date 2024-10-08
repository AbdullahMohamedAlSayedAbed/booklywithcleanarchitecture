import 'package:booklywithcleanarchitecture/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:booklywithcleanarchitecture/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:booklywithcleanarchitecture/Features/home/domain/entities/book_entity.dart';
import 'package:booklywithcleanarchitecture/Features/home/domain/repos/home_repo.dart';
import 'package:booklywithcleanarchitecture/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl(
      {required this.homeLocalDataSource, required this.homeRemoteDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeatureBooks(
      {int pageNumber = 0}) async {
    try {
      List<BookEntity> book;
      book = homeLocalDataSource.fetchFeatureBooks(pageNumber: pageNumber);
      if (book.isNotEmpty) {
        return right(book);
      }
      book =
          await homeRemoteDataSource.fetchFeatureBooks(pageNumber: pageNumber);
      return right(book);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks(
      {int pageNumber = 0}) async {
    try {
      List<BookEntity> bookList;
      bookList = homeLocalDataSource.fetchNewestBooks(pageNumber: pageNumber);
      if (bookList.isNotEmpty) {
        return right(bookList);
      }
      bookList = await homeRemoteDataSource.fetchNewestBooks(pageNumber: pageNumber);
      return right(bookList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks({required String category}) async{
      try {
      List<BookEntity> book;
      book = await homeRemoteDataSource.fetchSimilarBooks();
      return right(book);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
