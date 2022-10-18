import 'package:flutter/material.dart';
import 'package:movies_app/core/servies/servies_locator.dart';
import 'package:movies_app/movies/presentation/pages/movies_page.dart';


void main() {

  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor:          Colors.black,

      ),
      home: const MoviesPage(),
    );
  }
}

