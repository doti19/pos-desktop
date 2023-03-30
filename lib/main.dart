import 'package:flutter/material.dart';
import 'package:pos_desktop2/pages/index.dart';


import 'app.dart';
import 'utils/app_state_notifier.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    ChangeNotifierProvider<AppStateNotifier>(
      create: (_) => AppStateNotifier(),
      child: App(),
    ),
  );
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'POS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const App(),
      // home: const Index(),
      debugShowCheckedModeBanner: false,
    );
  }
}

