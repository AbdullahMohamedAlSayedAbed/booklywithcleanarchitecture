import 'package:booklywithcleanarchitecture/Features/home/data/repos/home_repo_impl.dart';
import 'package:booklywithcleanarchitecture/Features/home/domain/entities/book_entity.dart';
import 'package:booklywithcleanarchitecture/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:booklywithcleanarchitecture/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:booklywithcleanarchitecture/Features/home/presentation/view_models/featured_cubit/featured_books_cubit.dart';
import 'package:booklywithcleanarchitecture/Features/home/presentation/view_models/newest_cubit/newest_books_cubit.dart';
import 'package:booklywithcleanarchitecture/core/utils/app_router.dart';
import 'package:booklywithcleanarchitecture/core/utils/constants.dart';
import 'package:booklywithcleanarchitecture/core/utils/functions/setup_service_locator.dart';
import 'package:booklywithcleanarchitecture/core/utils/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBook);
  await Hive.openBox<BookEntity>(kNewestBook);
  Bloc.observer = SimpleBlocObserver();
  runApp(const BooklyApplication());
}

class BooklyApplication extends StatelessWidget {
  const BooklyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
              FetchFeaturedBooksUseCase(getIt.get<HomeRepoImpl>()))..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
              FetchNewestBooksUseCase(getIt.get<HomeRepoImpl>()))..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: const Color(kPrimaryColor),
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
