import 'package:flutter/material.dart';

import 'themes/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: darkTheme4,
      // theme: darkTheme,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: 30,
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('1Elevated Button'),
            ),
            OutlinedButton(
              onPressed: () {},
              child: Text('Outlined Button'),
            ),
            TextButton(
              onPressed: () {},
              child: Text('Text Button'),
            ),
            Text(
              'display large',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Text(
              'display medium',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(
              'display small',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text(
              'headline medium',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'Headline small',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              'title large',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              'title medium',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              'title small',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text(
              'body large',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'body medium',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              'body small',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              'label large',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Text(
              'label medium',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(
              'label small',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }
}
