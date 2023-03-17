import 'package:flutter/material.dart';
import 'package:singleton_demo/data/dummy_data.dart';
import 'package:singleton_demo/di/locator.dart';
import 'package:singleton_demo/singleton/UserManager.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:singleton_demo/l10n/app_localizations.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

void main() {
  setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Singleton Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      locale: const Locale('hi'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      // home: MyHomePage(title: ' ${AppLocalizations.of(context)!.appTitle}'),
      home: MyHomePage(title: 'Singleton and Di'),
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
  String changeDetailsAndPrint() {
    UserManager().name = 'Vivek';
    UserManager().age = '22';
    UserManager().gender = 'Male';

    return '\n\n <--- After changing Singleton values---> \n ${UserManager().name} \n${UserManager().age} years \n${UserManager().gender}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '<---Singleton Demo--->',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '${UserManager().name}',
            ),
            Text(
              '${UserManager().age} years',
            ),
            Text(
              '${UserManager().gender}',
            ),
            Text(
              '${changeDetailsAndPrint()}',
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              '<---- DI Demo----> ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                '\nUser data -> \n${locator.get<UserData>().showUserData()} \n Employee Data -> \n${locator.get<Employee>().showEmployeeData()}'),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
