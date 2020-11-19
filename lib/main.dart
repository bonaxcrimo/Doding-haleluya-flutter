import 'package:flutter/material.dart';
import 'package:first/utils/routes.dart' as router;
import 'configuration.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doding Haleluya',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: colorPrimaryDark,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      onGenerateRoute: router.generateRoute,
    );
  }
}
