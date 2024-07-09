import 'package:booklywithcleanarchitecture/Features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

void saveBooksData(List<BookEntity> books, String nameBox) {
  var box = Hive.box(nameBox);
  box.addAll(books);
}
