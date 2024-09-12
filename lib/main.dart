import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_hub/view/home_view.dart';
import 'package:user_hub/viewmodel/provider/home_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewmodel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'User Hub',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeView(),
      ),
    );
  }
}
