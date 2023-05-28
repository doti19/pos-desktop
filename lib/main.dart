import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'blocs/product/product_bloc.dart';
import 'models/product/product.dart';

import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // MaterialPageRoute.debugEnableFadingRoutes = true;
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());
  await Hive.openBox<Product>('products');

  // runApp(
  //   ChangeNotifierProvider<AppStateNotifier>(
  //     create: (_) => AppStateNotifier(),
  //     child: App(),
  //   ),
  // );
  runApp(const App());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [BlocProvider(create: (context) => ProductBloc())],
        child: MaterialApp(
          scrollBehavior: MyCustomScrollBehavior(),
          title: 'POS',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const App(),
          // home: const Index(),
          debugShowCheckedModeBanner: false,
        ),
      );
  // Widget build(BuildContext context) {
  // return MultiRepositoryProvider(
  //   providers: [
  //     RepositoryProvider(
  //       create: (context) => AuthenticationService(),
  //     ),
  //   ],
  //   child: MaterialApp(
  //     scrollBehavior: MyCustomScrollBehavior(),
  //     title: 'POS',
  //     theme: ThemeData(
  //       primarySwatch: Colors.blue,
  //     ),
  //     home: const App(),
  //     // home: const Index(),
  //     debugShowCheckedModeBanner: false,
  //   ),
  // );
  // }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
        PointerDeviceKind.unknown,
      };
}
