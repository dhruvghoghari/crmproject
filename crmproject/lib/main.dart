import 'package:crmproject/provider/CategoryProvider.dart';
import 'package:crmproject/views/HomeScreen.dart';
import 'package:crmproject/views/Homepage.dart';
import 'package:crmproject/views/demo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/SubcategoryProvider.dart';
import 'provider/maincategoryProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>CategoryProvider()),
        ChangeNotifierProvider(create: (context)=>SubcategoryProvider()),
        ChangeNotifierProvider(create: (context)=>maincategoryProvider()),


      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
          useMaterial3: true,
        ),
        home: Homepage(),
      ),
    );
  }
}
