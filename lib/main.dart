import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sol/constants/globals.dart';
import 'package:sol/providers/AuthProvider.dart';
import 'package:sol/providers/app_provider.dart';

import 'constants/custom_theme.dart';
import 'constants/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => AppProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: const Color.fromRGBO(0, 146, 202, 1),
      title: Globals.appName,
      theme: CustomTheme.lightTheme,
      routes: routes,
      initialRoute: RouteNames.auth,
    );
  }
}
