import 'package:booklywithcleanarchitecture/Features/home/data/repos/home_repo_impl.dart';
import 'package:booklywithcleanarchitecture/Features/home/domain/entities/book_entity.dart';
import 'package:booklywithcleanarchitecture/Features/home/presentation/view_models/similar_cubit/similar_books_cubit.dart';
import 'package:booklywithcleanarchitecture/Features/home/presentation/views/book_details_view.dart';
import 'package:booklywithcleanarchitecture/Features/home/presentation/views/home_view.dart';
import 'package:booklywithcleanarchitecture/Features/search/data/repo/search_repo_impl.dart';
import 'package:booklywithcleanarchitecture/Features/search/presentation/view_model/search_books_cubit/search_books_cubit.dart';
import 'package:booklywithcleanarchitecture/Features/search/presentation/views/search_view.dart';
import 'package:booklywithcleanarchitecture/Features/splash/presention/views/splash_view.dart';
import 'package:booklywithcleanarchitecture/core/utils/functions/setup_service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/SearchView';
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (BuildContext context, GoRouterState state) =>
            const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (BuildContext context, GoRouterState state) => BlocProvider(
          create: (context) =>
              SimilarBooksCubit(getIt.get<HomeRepoImpl>())..fetchSimilarBooks(),
          child: BookDetailsView(
            book: state.extra as BookEntity,
          ),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (BuildContext context, GoRouterState state) => BlocProvider(
          create: (context) => SearchBooksCubit(getIt.get<SearchRepoImpl>()),
          child: const SearchView(),
        ),
      ),
    ],
  );
}
