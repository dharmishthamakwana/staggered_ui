import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:staggered_ui/screen/home/provider/home_provider.dart';
import 'package:staggered_ui/screen/home/view/first_Screen.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Home_provider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => staggered_screen()
        },
      ),
    ),
  );
}