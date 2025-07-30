import 'package:booklywithcleanarchitecture/Features/home/data/models/book_model/book_model.dart';
import 'package:booklywithcleanarchitecture/Features/home/domain/entities/book_entity.dart';
import 'package:booklywithcleanarchitecture/core/utils/api_service.dart';
import 'package:booklywithcleanarchitecture/core/utils/constants.dart';
import 'package:booklywithcleanarchitecture/core/utils/functions/save_data.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeatureBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchSimilarBooks({required String categories});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeatureBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
        endPoints: 'volumes?startIndex=${pageNumber * 10}&Filtering=free-ebooks&q=subject:programming');
    List<BookEntity> books = getBookList(data);
    saveBooksData(books, kFeaturedBook);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
        endPoints:
            'volumes?startIndex=${pageNumber * 10}&Filtering=free-ebooks&Sorting=newest&q=subject:programming');
    List<BookEntity> books = getBookList(data);
    saveBooksData(books, kNewestBook);
    return books;
  }

  List<BookEntity> getBookList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var book in data['items']) {
      books.add(BookModel.fromJson(book));
    }
    return books;
  }
  
  @override
  Future<List<BookEntity>> fetchSimilarBooks({required String categories}) async{
        var data = await apiService.get(
        endPoints:
            'volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:$categories');
    List<BookEntity> books = getBookList(data);
    return books;
  }
}
