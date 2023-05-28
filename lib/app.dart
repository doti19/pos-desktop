import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/product/product_bloc.dart';
import 'config/theme_data.dart';
import 'routes/index.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
      providers: [BlocProvider(create: (context) => ProductBloc())],
      child: MaterialApp(
        title: 'Pos',
        theme: ThemeConfig.darkTheme,
        darkTheme: ThemeConfig.darkTheme,
        // themeMode: appState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        onGenerateRoute: routes,
      ));
}

  // @override
  // Widget build(BuildContext context) {
  //   return Consumer<AppStateNotifier>(builder: (context, appState, child) {
  //     return MaterialApp(
  //       title: 'Pos',
  //       theme: ThemeConfig.darkTheme,
  //       darkTheme: ThemeConfig.darkTheme,
  //       // themeMode: appState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
  //       onGenerateRoute: routes,
  //     );
  //   });
  // }

