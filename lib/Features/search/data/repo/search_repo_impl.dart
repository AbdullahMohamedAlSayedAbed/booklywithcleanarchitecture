import 'package:booklywithcleanarchitecture/Features/home/domain/entities/book_entity.dart';
import 'package:booklywithcleanarchitecture/Features/search/data/data_source/search_remote_data_source.dart';
import 'package:booklywithcleanarchitecture/Features/search/domin/repo/search_repo.dart';
import 'package:booklywithcleanarchitecture/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final SearchRemoteDataSource searchRemoteDataSource;

  SearchRepoImpl(this.searchRemoteDataSource);
  @override
  Future<Either<Failure, List<BookEntity>>> searchBooks(
      {required String searchBook}) async {
    try {
      List<BookEntity> book;
      book = await searchRemoteDataSource.searchBooks(searchBook: searchBook);
      return right(book);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
