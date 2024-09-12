import 'package:e_commerce/blocs/blocs.dart';

import 'package:e_commerce/config/app_router.dart';
import 'package:e_commerce/config/theme.dart';
import 'package:e_commerce/firebase_options.dart';

import 'package:e_commerce/repositories/category/category_repository.dart';
import 'package:e_commerce/repositories/checkout/checkout_repository.dart';
import 'package:e_commerce/repositories/product/product_repository.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WishlistBloc>(create: (_) => WishlistBloc()..add(StartWishList())),
        BlocProvider<CartBloc>(create: (_) => CartBloc()..add(CartStarted())),
        BlocProvider(create: (_) => CategoryBloc(categoryRepository: CategoryRepository())..add(LoadCategories())),
        BlocProvider(create: (_) => ProductBloc(productRepository: ProductRepository())..add(LoadProducts())),
        BlocProvider(
            create: ((context) => CheckoutBloc(
                  cartBloc: context.read<CartBloc>(),
                  checkoutRepository: CheckoutRepository(),
                ))),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme(),
        home: const HomeScreen(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
