import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_api/screens/home_screen/provider/home_provider.dart';
import 'package:weather_api/screens/home_screen/view/home_view.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => HomeView(),
        },
      ),
    ),
  );
}