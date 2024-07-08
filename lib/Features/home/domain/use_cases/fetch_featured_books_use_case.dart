import 'package:booklywithcleanarchitecture/Features/home/domain/entities/book_entity.dart';
import 'package:booklywithcleanarchitecture/Features/home/domain/repos/home_repo.dart';
import 'package:booklywithcleanarchitecture/core/error/failure.dart';
import 'package:booklywithcleanarchitecture/core/use_cases/use_cases.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([int? param]) async {
    //example code check permission
    //......
    return await homeRepo.fetchFeatureBooks();
  }
}
