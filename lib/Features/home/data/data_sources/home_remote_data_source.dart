import 'package:booklywithcleanarchitecture/Features/home/data/models/book_model/book_model.dart';
import 'package:booklywithcleanarchitecture/Features/home/domain/entities/book_entity.dart';
import 'package:booklywithcleanarchitecture/core/utils/api_service.dart';
import 'package:booklywithcleanarchitecture/core/utils/constants.dart';
import 'package:booklywithcleanarchitecture/core/utils/functions/save_data.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeatureBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeatureBooks() async {
    var data = await apiService.get(
        endPoints: 'volumes?Filtering=free-ebooks&q=subject:programming');
    List<BookEntity> books = getBookList(data);
    saveBooksData(books, kFeaturedBok);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService.get(
        endPoints:
            'volumes?Filtering=free-ebooks&Sorting=newest&q=subject:programming');
    List<BookEntity> books = getBookList(data);
    return books;
  }

  List<BookEntity> getBookList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var book in data['items']) {
      books.add(BookModel.fromJson(book));
    }
    return books;
  }
}