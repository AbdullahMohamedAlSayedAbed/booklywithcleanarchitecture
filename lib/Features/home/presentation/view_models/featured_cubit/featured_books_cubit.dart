import 'package:bloc/bloc.dart';
import 'package:booklywithcleanarchitecture/Features/home/domain/entities/book_entity.dart';
import 'package:booklywithcleanarchitecture/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:meta/meta.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this._featuredBooksUseCase)
      : super(FeaturedBooksInitial());
  final FetchFeaturedBooksUseCase _featuredBooksUseCase;
  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedBooksPaginationLoading());
    }
    var result = await _featuredBooksUseCase.call(pageNumber);
    result.fold((failure) {
      if (pageNumber == 0) {
        emit(FeaturedBooksFailure(failure.errorMessage));
      } else {
        emit(FeaturedBooksPaginationFailure(failure.errorMessage));
      }
    }, (book) {
      emit(FeaturedBooksSuccess(book));
    });
  }
}
