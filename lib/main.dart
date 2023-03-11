import 'package:flutter/material.dart';
import 'package:on_boarding_screen_with_provider/OnBoarding.dart';
import 'package:provider/provider.dart';

import 'PageViewScreens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => OnBoarding(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PageViewScreens(),
      ),
    );
  }
}
