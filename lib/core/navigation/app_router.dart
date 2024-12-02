import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:products/core/network/network_connection.dart';
import 'package:products/core/resources/keys.dart';
import 'package:products/products/data/dataSources/products_datasource.dart';
import 'package:products/products/data/repo_implement/products_repo_imp.dart';
import 'package:products/products/domain/entities/products_entity.dart';
import 'package:products/products/domain/products_usecase.dart';
import 'package:products/products/presentation/bloc/products_bloc.dart';
import 'package:products/products/presentation/view/pages/cart_page.dart';
import 'package:products/products/presentation/view/pages/products_details_page.dart';
import 'package:products/products/presentation/view/pages/products_screen.dart';
import 'package:products/products/presentation/view/pages/spalsh_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => const CustomTransitionPage(
          child: SpalshScreen(),
          transitionsBuilder: _fadeTransition,
        ),
      ),
      GoRoute(
        path: AppKeys.productPageKey,
        builder: (context, state) => BlocProvider(
          create: (context) => ProductsBloc(GetProductsUseCase(
              productsRepo: ProductsRepoImp(
                  networkConnection: NetworkConnection(
                      internetConnectionChecker: InternetConnectionChecker()),
                  remoteGetProductsDataSource:
                      RemoteGetProductsDataSource(dio: Dio()))))
            ..add(GetProducts()),
          child: const ProductsScreen(),
        ),
      ),
      GoRoute(
        path: AppKeys.productDetailsPageKey,
        pageBuilder: (context, state) {
          final product = state.extra as IndividualProductEntity;
          return CustomTransitionPage(
            key: state.pageKey,
            child: ProductDetailsPage(
              product: product,
            ),
            transitionsBuilder: _fadeTransition,
          );
        },
      ),
      GoRoute(
        path: AppKeys.cartPageKey,
        pageBuilder: (context, state) => const CustomTransitionPage(
          child: CartPage(),
          transitionsBuilder: _fadeTransition,
        ),
      )
    ],
  );

  static Widget _fadeTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    const curve = Curves.easeInOut;
    var fadeTween = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));
    return FadeTransition(
      opacity: animation.drive(fadeTween),
      child: child,
    );
  }
}
