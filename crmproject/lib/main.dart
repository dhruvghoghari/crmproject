import 'package:crmproject/provider/ProjectProvider.dart';
import 'package:crmproject/views/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/AuthProvider.dart';
import 'provider/CategoryProvider.dart';
import 'provider/SubcategoryProvider.dart';
import 'views/Viewpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>ProjectProvider()),
        ChangeNotifierProvider(create: (context)=>CategoryProvider()),
        ChangeNotifierProvider(create: (context)=>SubcategoryProvider()),
        ChangeNotifierProvider(create: (context)=>AuthProvider()),
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
