import 'package:do_it_flutter/utils/app_colors.dart';
import 'package:do_it_flutter/utils/routes.dart';
import 'package:do_it_flutter/view/mobile/layouts/splash_screen.dart';
import 'package:do_it_flutter/view/mobile/user/log_in_view.dart';
import 'package:flutter/material.dart';

void main() {
  // runApp(DevicePreview(
  //   enabled: true,
  //   builder: (context) => MyApp(), // Wrap your app
  // ),);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: AppColors.black),
            color: AppColors.white,
            elevation: 0,
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: AppColors.black,
            elevation: 0.0,
          ),
          scaffoldBackgroundColor: AppColors.white),
      initialRoute: SplashScreen.route,
      routes: routes,
    );
  }
}
