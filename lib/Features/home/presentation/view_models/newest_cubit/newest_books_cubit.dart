import 'package:bloc/bloc.dart';
import 'package:booklywithcleanarchitecture/Features/home/domain/entities/book_entity.dart';
import 'package:booklywithcleanarchitecture/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:meta/meta.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this._fetchNewestBooksUseCase) : super(NewestBooksInitial());
  final FetchNewestBooksUseCase _fetchNewestBooksUseCase;
  Future<void> fetchNewestBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(NewestBooksLoading());
    } else {
      emit(NewestBooksPaginationLoading());
    }
    var result = await _fetchNewestBooksUseCase.call();
    result.fold((failure) {
      if (pageNumber == 0) {
        emit(NewestBooksFailure(failure.errorMessage));
      } else {
        emit(NewestBooksPaginationFailure(failure.errorMessage));
      }
    }, (books) {
      emit(NewestBooksSuccess(books));
    });
  }
}
