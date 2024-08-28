import 'package:booklywithcleanarchitecture/Features/home/domain/entities/book_entity.dart';
import 'package:booklywithcleanarchitecture/Features/home/domain/repos/home_repo.dart';
import 'package:booklywithcleanarchitecture/Features/search/domin/repo/search_repo.dart';
import 'package:booklywithcleanarchitecture/core/error/failure.dart';
import 'package:booklywithcleanarchitecture/core/use_cases/use_cases.dart';
import 'package:dartz/dartz.dart';

class SearchBooksUseCase extends UseCase<List<BookEntity>, String> {
  final SearchRepo searchRepo;

  SearchBooksUseCase(this.searchRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([String searchBook = '']) async {
    //example code check permission
    //......
    return await searchRepo.searchBooks(searchBook: searchBook);
  }
}
