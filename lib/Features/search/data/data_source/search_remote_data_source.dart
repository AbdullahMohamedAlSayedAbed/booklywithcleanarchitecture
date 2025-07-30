import 'package:booklywithcleanarchitecture/Features/home/data/models/book_model/book_model.dart';
import 'package:booklywithcleanarchitecture/Features/home/domain/entities/book_entity.dart';
import 'package:booklywithcleanarchitecture/core/utils/api_service.dart';

abstract class SearchRemoteDataSource {
  Future<List<BookEntity>> searchBooks({required String searchBook});
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final ApiService apiService;

  SearchRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> searchBooks({required String searchBook}) async {
    var data = await apiService.get(
        endPoints: 'volumes?Filtering=free-ebooks&q=intitle:$searchBook');
    List<BookEntity> books = getBookList(data);
    return books;
  }

  List<BookEntity> getBookList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    if (data['items'] != null && data['items'] is List) {
      for (var book in data['items']) {
        books.add(BookModel.fromJson(book));
      }
    }
    return books;
  }
}
