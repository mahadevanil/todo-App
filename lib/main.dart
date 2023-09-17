import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:todo/constants/constants.dart';
import 'package:todo/global/routes/routes.dart';

import 'global/providers/providers_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //!---Hive
  Directory document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  await Hive.openBox(Constants.dbName);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MultiProvider(
      providers: providerList,
      child: const ScreenUtilInit(
        designSize: Size(393, 852),
        child: MyApp(),
      )));
}

GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) =>
      //*---------- if platform is IOS
      Platform.isIOS
          ? CupertinoApp(
              debugShowCheckedModeBanner: false,
              title: Constants.dbName,
              routes: routes,
              initialRoute: '/',
              navigatorKey: navigationKey,
            )
          //*-------  if platform is not IOS
          : MaterialApp(
              debugShowCheckedModeBanner: false,
              title: Constants.dbName,
              routes: routes,
              initialRoute: '/',
              navigatorKey: navigationKey,
            );
}
