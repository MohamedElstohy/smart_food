import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_food/provider/get_categories.dart';
import 'package:smart_food/screens/home/home.dart';
import 'package:smart_food/screens/splash.dart';
import 'injection_container.dart' as di;


import 'provider/auth.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProvider.value(
          value: GetCategories(),
        ),
      ],
      child: MaterialApp(
        title: 'Smart Food',
        theme: ThemeData(
            fontFamily: 'Tajawal'
        ),

        debugShowCheckedModeBanner: false,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,

        home: HomeScreen(),//SplashScreen()
      ),
    );
  }
}



